local utf8 = libs.utf8;
local timer = libs.timer;
local buffer = libs.buffer;
local server = libs.server;
local bit = require("bit");

-- Documentation
-- http://www.unifiedremote.com/api

-- Script Library
-- http://www.unifiedremote.com/api/libs/script

local s;
local buf;
local profiles;
local profiles_selected;
local tid;

events.focus = function()
	if is_empty(settings.ip) then
		settings.ip = "127.0.0.1";
	end

	if is_empty(settings.port) then
		settings.port = 3636;
	end
	
	if is_empty(settings.apikey) then
		settings.apikey = "";
	end

	update_show_single("Connecting to " .. settings.ip .. ":" .. settings.port .. "...");
	
	buf = buffer.new();
	s = libs.socket.new();

	s:ondata(data);
	s:onerror(err);
	s:onclose(closed);
	s:onconnect(connected);
	s:connect(settings.ip, settings.port);
end

events.blur = function()
	timer.cancel(tid);
	s:close();
end

function _send (command)
	print("<-< " .. command);
	s:write(command .. "\r\n");
end

function connected ()
	print("SOCKET connected, sending apikey: " .. settings.apikey);
	_send("apikey:" .. settings.apikey);
	_send("lock");

	request_update();

	tid = timer.interval(function()
		if s:connected() then
			request_update();
		end
	end, 500000);
end

function closed ()
	print("SOCKET closed");
	update_show_single("Disconnected");
end

function data (chunk)
	buf:write(chunk);
	while true do
		local line = buf:readline();
		if is_empty(line) then
			break;
		else
			process(line);
		end
	end
end

function process (cmd)
	print(">-> " .. cmd);
			
	local split = utf8.split(utf8.trim(cmd), ":");
	local command = split[1];
	local arg1 = "";

	if #split >= 2 then 
		arg1 = split[2];
	end

	if (command == "fail") then
		update_show_single("Invalid apikey: " .. tostring(settings.apikey));
	end

	if (command == "not locked") then
		_send("lock");
	end

	if (command == "authorization required") then
		update_show_single("Please enter an apikey in the settings");
	end

	if (command == "unlock" and arg1 == "success") then
		_send("lock");
	end

	if (command == "profiles") then 
		local tmp = utf8.split(arg1, ";");

		profiles = {}
		for i=1,#tmp do
			local p = tmp[i];
			if not is_empty(p) then
				table.insert(profiles, p);
			end
		end

		print("Found " .. #profiles .. " profiles");
		update_profiles_list();
	end

	if (command == "profile") then 
		profiles_selected = arg1;
		print("Current profile: " .. profiles_selected);
	end

	if (command == "status") then
		if arg1 == "on" then
			layout.on.visibility  = "gone";
			layout.off.visibility = "visible";
		end
		if arg1 == "off" then 
			layout.off.visibility = "gone";
			layout.on.visibility  = "visible";
		end
	end
end

function err (e)
	update_show_single("Unable to connect: " .. e);
end

function request_update ()
	_send("getprofile");
	_send("getprofiles");
	_send("getstatus");
end

actions.setstatus = function (state)
	_send("setstatus:" .. state);
	_send("getstatus");
end

actions.setprofile = function (index) 
	local profile = profiles[index + 1];
	
	if is_empty(profile) then
		print("Unable to set profile idx: " .. index);
	else 
		profiles_selected = profile;
		update_profiles_list();
		
		_send("setprofile:" .. profile);

		timer.timeout(function ()
			_send("unlock");
		end, 500);

	end
end

function is_empty(str)
	return str == nil or utf8.trim(str) == '';
end

function update_profiles_list ()
	local items = {};
	for i=1,#profiles do
		local p = profiles[i];
		if p == profiles_selected then
			table.insert(items, { type = "item", text = p, checked = true });
		else
			table.insert(items, { type = "item", text = p });
		end
	end
	server.update({ id = "profiles", children = items });
end

function update_show_single (txt)
	server.update({ id = "profiles", children = {
		{type = "item", text = txt }}
	});
end

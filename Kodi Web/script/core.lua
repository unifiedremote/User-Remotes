local log = require("log");
local kb = require("keyboard");

------------------------------------------------------------------------
-- global variable
------------------------------------------------------------------------
items = {};
Sourceitems = {};
stack = {};
show = 0;
season = 0;
artist = "";
album = "";
tid = nil;
tSelectId = nil;
currentId = -1;
seekingId = nil;

------------------------------------------------------------------------
-- Trace
------------------------------------------------------------------------
function Trace(msg)
	if (settings.trace == "1") then log.info("Trace" .. msg); end
end

------------------------------------------------------------------------
-- Keyboard
------------------------------------------------------------------------
function kb(key)
	Trace("kb:" .. key);
	kb.press(key);
end

------------------------------------------------------------------------
-- Web Request
------------------------------------------------------------------------
-- function to build & send JSON-RPC call
function send(method, params)
	local req = {};
	req.jsonrpc = "2.0";
	req.id = 1;
	if (method ~= nil) then req.method = method; end
	if (params ~= nil) then req.params = params; end

	-- Send a JSON-RPC request
	local host = settings.host;
	local port = settings.port;
	local url = "http://" .. host .. ":" .. port .. "/jsonrpc";

	local json = libs.data.tojson(req);

	Trace("json" .. json);

	local ok, resp = pcall(libs.http.request,{
		method = "post",
		url = url,
		mime = "application/json",
		content = json
	});
	if (ok and resp ~= nil and resp.status == 200) then
		Trace("json answer" .. libs.data.tojson(resp));
		return libs.data.fromjson(resp.content);
	else
		libs.server.update({ id = "title", text = "[Not Connected]" });
		return nil;
	end
end

------------------------------------------------------------------------
-- Status
------------------------------------------------------------------------
-- Detect if Kodi is launched
function GetStatus()
	Trace("GetStatus");
	host = settings.host;
	port = settings.port;
	password = settings.password;

	-- Verify that Kodi is accessible otherwise show some nice help information
	local resp = nil == send("JSONRPC.Version");
	if (resp) then
		layout.title.text = "[Not Connected]";
	else
		onBlur()
		update_status();
		update_library();
		ListSource();
	end
	return not resp;
end

-- Retrieve the
function update_status()
	Trace("update_status");
	local pid = player();
	if(pid == nil) then
		layout.title.text = "[Not Playing]";
		layout.thumbnail.image = "";
		StopSeeking();
	else
		onBlur();
		local resp = send("Player.GetItem", { playerid = pid, properties = {"fanart"}});
		if(resp ~= nil and resp.result ~= nil) then
			if(currentId ~= resp.result.item.id) then
				currentId = resp.result.item.id
				layout.title.text = resp.result.item.label;
			end
			IsPlaying();
		end
	end
end

function IsPlaying()
	local resp = send("Player.GetProperties", { playerid = player(), properties = {"speed"}});
	if(resp == nil or resp.result == nil) then
		StopSeeking();
		settings.status = "stop";
		settings.playerId = "none";
		update_status();
		return;
	end

	if (math.round(resp.result.speed) ~= 0) then
		settings.status = "play";
		StartSeeking();
	else
		StopSeeking();
		settings.status = "pause";
	end
end

function UpdateSeekBar()
	local resp = send("Player.GetProperties", { playerid = player(), properties = {"percentage"}});

	if (resp ~= nil) then
		layout.seeking.progress = math.round(resp.result.percentage);
	end
end

function StartSeeking()
	Trace("StartSeeking");
	if(seekingId == nil) then
		seekingId = libs.timer.interval(UpdateSeekBar, 5000);
	end
end

function StopSeeking()
	Trace("StopSeeking");
	if(seekingId ~= nil) then
		libs.timer.cancel(seekingId);
		layout.seeking.progress = 0;
		seekingId = nil;
	end
end

-- Cancel timer before quit
function onBlur()
	Trace("onBlur");
	if(tid ~= nil) then
		libs.timer.cancel(tid);
		tid = nil;
	end
	if(tSelectId ~= nil) then
		libs.timer.cancel(tSelectId);
		tSelectId = nil;
	end
	StopSeeking();
end

------------------------------------------------------------------------
-- Kodi Request
------------------------------------------------------------------------
function movies(items)
	local resp = send("VideoLibrary.GetMovies");
	if (resp.result.movies ~= nil) then
		for k,v in pairs(resp.result.movies) do
			table.insert(items, { text = v.label, id = v.movieid });
		end
	else
		empty(items);
	end
end

function tvshows(items)
	local resp = send("VideoLibrary.GetTvShows");
	if (resp.result.tvshows ~= nil) then
		for k,v in pairs(resp.result.tvshows) do
			table.insert(items, { text = v.label .. " (" .. v.tvshowid .. ")", id = v.tvshowid });
		end
	else
		empty(items);
	end
end

function tvseasons(items)
	local resp = send("VideoLibrary.GetSeasons", { tvshowid = show });
	if (resp.result.seasons ~= nil) then
		for k,v in pairs(resp.result.seasons) do
			table.insert(items, { text = v.label, id = k });
		end
	else
		empty(items);
	end
end

function tvepisodes(items)
	local resp = send("VideoLibrary.GetEpisodes", { tvshowid = show, season = season });
	if (resp.result.episodes ~= nil) then
		for k,v in pairs(resp.result.episodes) do
			table.insert(items, { text = v.label, id = v.episodeid });
		end
	else
		empty(items);
	end
end

function artists(items)
	local resp = send("AudioLibrary.GetArtists");
	if (resp.result.artists ~= nil) then
		for k,v in pairs(resp.result.artists) do
			table.insert(items, { text = v.label, id = v.artistid });
		end
	else
		empty(items);
	end
end

function albums(items)
	local resp = send("AudioLibrary.GetAlbums");
	if (resp.result.albums ~= nil) then
		for k,v in pairs(resp.result.albums) do
			table.insert(items, { text = v.label, id = v.albumid });
		end
	else
		empty(items);
	end
end

function songs(items)
	local resp = send("AudioLibrary.GetSongs", {asdf =asdf});
	if (resp.result.songs ~= nil) then
		for k,v in pairs(resp.result.songs) do
			table.insert(items, { text = v.label, id = v.songid });
		end
	else
		empty(items);
	end
end

function empty(items)
	table.insert(items, { text = "Empty" });
end

function loading(items)
	local items = {};
	table.insert(items, { type = "item", text = "Loading..." });
	libs.server.update({ id = "list", children = items });
end

function player ()
	if(settings.playerId ~= "none") then
		return tonumber(settings.playerId);
	end

	local resp = send("Player.GetActivePlayers");
	if(resp.result[1] == nil) then
		settings.playerId = "none";
		return nil;
	else
		settings.playerId = tostring(resp.result[1].playerid);
		print("settings.playerId = " .. settings.playerId);
		return resp.result[1].playerid;
	end
end

function volume ()
	local resp = send("Application.GetProperties", { properties = { "volume" } });
	return resp.result.volume;
end

function input(key)
	send("Input.ExecuteAction", {action = key});
end

function update_library()
	loading(items);

	items = {}
	local state = "";
	if (#stack > 0) then
		state = stack[#stack];
	end
	if (state == "") then
		table.insert(items, { text = "Music" });
		table.insert(items, { text = "Movies" });
		table.insert(items, { text = "TV Shows" });
	elseif (state == "Music") then
		table.insert(items, { text = "Artists" });
		table.insert(items, { text = "Albums" });
		table.insert(items, { text = "Songs" });
	elseif (state == "Artists") then
		artists(items);
	elseif (state == "Albums") then
		albums(items);
	elseif (state == "Songs") then
		songs(items);
	elseif (state == "AlbumSongs") then
		empty(items);
	elseif (state == "ArtistSongs") then
		empty(items);
	elseif (state == "Movies") then
		movies(items);
	elseif (state == "TV Shows") then
		tvshows(items);
	elseif (state == "Seasons") then
		tvseasons(items);
	elseif (state == "Episodes") then
		tvepisodes(items);
	end
	for k,v in pairs(items) do
		v.type = "item";
	end
	libs.server.update({ id = "list", children = items });
end

------------------------------------------------------------------------
-- Shut-down option
------------------------------------------------------------------------
function exitKodi()
	send("Application.Quit");
end

function shutdownKodi()
	local dialog = {
	type = "dialog",
	title = "Confirmation",
	text="Confirm shutdown ?",
	children = {
		{ type="button", text="Yes", ontap = "shutdownDialogConfirmation"  },
		{ type="button", text="No" }
	}};
	server.update(dialog);
end

function suspendKodi()
	send("System.Suspend");
end

function hibernateKodi()
	send("System.Hibernate");
end

function rebootKodi()
	send("System.Reboot");
end

actions.shutdownDialogConfirmation = function ()
	local resp = send("System.Shutdown");
	if(resp == nil or resp.result == nil) then
		os.execute("shutdown /s /f /t 1");
	end
end

------------------------------------------------------------------------
-- Source Tab
------------------------------------------------------------------------
function ListSource()
	local resp = send("Files.GetSources", {media = "video",  sort = {method = "file",  order = "ascending"}});
	fillSource(resp);
end

function ListContentDirectory(directory)
	local resp = send("Files.GetDirectory",{directory = directory, media = "video", properties = {"thumbnail"}});
	fillSource(resp);
end

function fillSource(resp)
	if(resp == nil or resp.result == nil) then
		ListSource();
		return;
	end

	if (resp.result.sources ~= nil) then
		Sourceitems = {}
		for k,v in pairs(resp.result.sources) do
			table.insert(Sourceitems, { type = "item", text = v.label, id = v.file });
		end
	elseif (resp.result.files ~= nil) then
		FillInList(resp.result.files);
		-- FillInGrid(resp.result.files);
		return;
	else
		empty(Sourceitems);
	end
	libs.server.update({ id = "listSource", children = Sourceitems });
end

function FillInList(files)
	Sourceitems = {};

	for n = 1, #files do
		local m = files[n];
		--table.insert(Sourceitems, { type = "item", image = GetImage(m.thumbnail, true), text = m.label, id = m.id });
	end
	--libs.server.update({ id = "listSource", children = Sourceitems });
end

function FillInGrid(resp)
	-- n % 3 for create 3 button per row
	local n = 0;

	-- number of row
	local id = 0;

	-- libs.server.update({ id = "listSource2", children = { type = "grid", children = {
		-- { type = "row", children = { type = "button", text  = "test" }}
	-- });

	for k,v in pairs(resp.result.files) do
		if (n == 0) then
			guidId = "grid" .. id;
			table.insert(Sourceitems, { type = "item", text = v.label, id = v.id });
		end
		table.insert(Sourceitems, { type = "item", text = v.label, id = v.id });
	end
	libs.server.update({ id = "ListSource", children = Sourceitems });
end

function FindPoster(title)
	local dirs = libs.fs.dirs(settings.pathForThumbnail);
	if(#dirs == 0) then
		Refresh();
	end

	dirs = libs.fs.combine(dirs[1], "movies");

	files = libs.fs.files(dirs);
	for i = 1, #files do
		local name = string.lower(libs.fs.name(files[i]));
		if(string.find("-poster") ~= nil) then

		end
	end
end

function Clean()
	send("VideoLibrary.Clean");
end

function Refresh()
	send("VideoLibrary.Scan");
end
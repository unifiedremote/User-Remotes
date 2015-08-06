local kb = libs.keyboard;
local server = libs.server;

local skiptimeval = 1;
local skiptime = 100;
local volChangeAmount = 10;

function switchVideoSource(src)
	if( src == "movies" ) then kb.stroke("ctrl", "1") end
	if( src == "tv") then kb.stroke("ctrl", "2") end
	if( src == "anime" ) then kb.stroke("ctrl", "3") end
end

function increaseVolume()
	if volChangeAmount == 10 then
		kb.stroke("up");
	end
end

function decreaseVolume()
	if volChangeAmount == 10 then
		kb.stroke("down");
	end
end

function muteVolume()
	kb.stroke("m");
end

function toggleFullscreen()
	kb.stroke("f");
end

function increaseCoverSize()
	kb.stroke("ctrl", "oem_plus");
end

function decreaseCoverSize()
	kb.stroke("ctrl", "oem_minus");
end

function doSearch(searchterm)
	--Open search bar
	kb.stroke("ctrl", "f"); 

	--Clear last search
	kb.stroke("ctrl", "a");
	kb.stroke("delete");

	--Do search
	kb.text(searchterm);
	kb.stroke("enter");
end

function clearsearch()
	--Open search bar
	kb.stroke("ctrl", "f"); 

	--Clear last search
	kb.stroke("ctrl", "a");
	kb.stroke("delete");

	--Finish
	kb.stroke("enter");
end

function back()
	kb.stroke("esc");
end

function select()
	kb.press("space");
end

function changeQuality()
	kb.press("q");
end

-- Handle video source changes
actions.switchtomovies = function()
	switchVideoSource("movies");
end

actions.switchtotv = function()
	switchVideoSource("tv");
end

actions.switchtoanime = function()
	switchVideoSource("anime");
end

-- Handle simple control functions
actions.playpause = function() -- Pause / Play
	-- kb.stroke("p");
	decreaseCoverSize();
end

actions.skiptimetoggle = function() -- Skip timer toggle
	skiptimeval = skiptimeval + 1;

	if skiptimeval == 4 then skiptimeval = 1 end

	if skiptimeval == 1 then
		layout.skiptime.text = "10s";
	elseif skiptimeval == 2 then
		layout.skiptime.text = "1min";
	elseif skiptimeval == 3 then
		layout.skiptime.text = "10min";
	end
end

actions.skipbackward = function() -- Skip backwards
	if skiptimeval == 1 then
		kb.stroke("left");
	elseif skiptimeval == 2 then
		kb.stroke("shift", "left");
	elseif skiptimeval == 3 then
		kb.stroke("ctrl", "left")
	end
end

actions.skipforward = function() -- Skip forwards
	if skiptimeval == 1 then
		kb.stroke("right");
	elseif skiptimeval == 2 then
		kb.stroke("shift", "right");
	elseif skiptimeval == 3 then
		kb.stroke("ctrl", "right")
	end
end

actions.moveleft = function()
	kb.stroke("left");
end

actions.moveright = function()
	kb.stroke("right");
end

actions.moveup = function()
	kb.stroke("up");
end

actions.movedown = function()
	kb.stroke("down");
end

actions.search = function()
	server.update({id = "go", type="input", ontap="doSearch", title="Search"});
end

actions.doSearch = doSearch;
actions.goback = back;
actions.select = select;
actions.clearsearch = clearsearch;
actions.switchvideosource = switchVideoSource;
actions.changequality = changeQuality;
actions.volumeup = increaseVolume;
actions.volumedown = decreaseVolume;
actions.volumemute = muteVolume;
actions.togglefullscreen = toggleFullscreen;

print("wtf");
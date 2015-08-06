require("script.core");

actions.library_select = function (i)
	local state = "";
	if (#stack > 0) then
		state = stack[#stack];
	end
	local text = items[i+1].text;
	local id = items[i+1].id;
	if (state == "") then
		table.insert(stack, text);
	elseif (state == "Music") then
		table.insert(stack, text);
	elseif (state == "Movies") then
		if (id ~= nil) then
			send("Player.Open", { item = { movieid = id } });
		end
	elseif (state == "TV Shows") then
		if (id ~= nil) then
			show = id;
			table.insert(stack, "Seasons");
		end
	elseif (state == "Seasons") then
		if (id ~= nil) then
			season = id;
			table.insert(stack, "Episodes");
		end
	elseif (state == "Episodes") then
		if (id ~= nil) then
			send("Player.Open", { item = { episodeid = id } });
		end
	elseif (state == "Artists") then
		if (id ~= nil) then
			artist = id;
			table.insert(stack, "ArtistSongs");
		end
	elseif (state == "Albums") then
		if (id ~= nil) then
			album = id;
			table.insert(stack, "AlbumSongs");
		end
	end
	update_library();
end

actions.library_back = function ()
	if (#stack > 0) then
		table.remove(stack);
		update_library();
	end
end
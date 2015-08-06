require("script.core");
------------------------------------------------------------------------
-- global variable
------------------------------------------------------------------------
audioIndex = {};
subtitleIndex = {};

--@help Toggle play/pause
actions.play_pause = function ()
	send("Player.PlayPause", { playerid = player() });
	libs.timer.timeout(IsPlaying, 1000);
end

--@help Stop playback
actions.stop = function ()
	send("Player.Stop", { playerid = player() });
	libs.timer.timeout(IsPlaying, 1000);
end

actions.SwitchAudio = function()
	local resp = send("Player.GetProperties", { playerid = player(), properties = {"currentaudiostream", "audiostreams"}});
	if(resp ~= nil and resp.result ~= nil) then
		local items = {};
		audioIndex = {};
		local current = resp.result.currentaudiostream.index;

		for n = 1, #resp.result.audiostreams do
			local audio = resp.result.audiostreams[n];
			local text = "";
			if(current == audio.index) then text = "*"; end
			if(audio.language ~= nil) then text = text .. audio.language;  end
			if(audio.name ~= nil) then text = text .. "(" .. audio.name .. ")";  end

			table.insert(items, { type = "item", text = text});
			audioIndex[n-1] = audio.index;
		end

		local dialog = {
			type = "dialog",
			title = "Select audio channel",
			ontap = "OnSwitchAudio",
			children = items
		};
		
		libs.server.update(dialog);
	end
end

actions.OnSwitchAudio = function(index)
	send("Player.SetAudioStream", { playerid = player(), stream = audioIndex[index]});
end

actions.SwitchSubtitle = function()	
	local resp = send("Player.GetProperties", { playerid = player(), properties = {"currentsubtitle", "subtitles"}});
	if(resp ~= nil and resp.result ~= nil) then
		local items = {};
		subtitleIndex = {};
		local current = resp.result.currentsubtitle.index;
		
		-- Add Disable Subtitle
		table.insert(items, { type = "item", text = "None"});

		for n = 1, #resp.result.subtitles do
			local subtitle = resp.result.subtitles[n];
			local text = "";
			if(current == subtitle.index) then text = "*"; end
			if(subtitle.language ~= nil) then text = text .. subtitle.language;  end
			if(subtitle.name ~= nil) then text = text .. "(" .. subtitle.name .. ")";  end

			table.insert(items, { type = "item", text = text});
			subtitleIndex[n-1] = subtitle.index;
		end

		local dialog = {
			type = "dialog",
			title = "Select subtitle channel",
			ontap = "OnSwitchSubtitle",
			children = items
		};
		
		libs.server.update(dialog);
	end
end

actions.OnSwitchSubtitle = function(index)
	if(index == 0) then
		send("Player.SetSubtitle", { playerid = player(), subtitle = "off"});
	else
		send("Player.SetSubtitle", { playerid = player(), subtitle = subtitleIndex[index], enable = true});
	end
end
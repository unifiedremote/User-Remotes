local fs =  libs.fs;

--@help up
actions.up = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 78");
end

--@help down
actions.down = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 79");
end

--@help left
actions.left = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 2000");
end

--@help right
actions.right = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 2100");
end

--@help enter
actions.enter = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 73");
end

--@help back
actions.back = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 84");
end

--@help play
actions.play = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 92");
end

--@help menue
actions.menue = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 111");
end

--@help rew
actions.rew = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 102");
end

--@help fwd
actions.fwd = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 103");
end

--@help red
actions.red = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 74");
end

--@help green
actions.green = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 75");
end

--@help yellow
actions.yellow = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 76");
end

--@help blue
actions.blue = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 77");
end

--@help startdvbviewer
actions.startdvbviewer = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\StartDVBViewer.vbs 77");
end

--@help stopdvbviewer
actions.stopdvbviewer = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 12294");
end

--@help standby
actions.standby = function()
	server.run("Unified.Power", "sleep");
end

--@help shutdown
actions.shutdown = function()
	server.run("Unified.Power", "shutdown");
end

--@help hibernate
actions.hibernate = function()
	server.run("Unified.Power", "hibernate");
end

--@help num_0
actions.num_0 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 40");
end

--@help num_1
actions.num_1 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 41");
end

--@help num_2
actions.num_2 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 42");
end

--@help num_3
actions.num_3 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 43");
end

--@help num_4
actions.num_4 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 44");
end

--@help num_5
actions.num_5 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 45");
end

--@help num_6
actions.num_6 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 46");
end

--@help num_7
actions.num_7 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 47");
end

--@help num_8
actions.num_8 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 48");
end

--@help num_9
actions.num_9 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 49");
end

--@help show_playlist
actions.show_playlist = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 12384");
end

--@help show_htpc
actions.show_htpc = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 2110");
end

--@help show_timer
actions.show_timer = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8195");
end

--@help show_recordings
actions.show_recordings = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8196");
end

--@help show_now
actions.show_now = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8197");
end

--@help show_epg
actions.show_epg = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8198");
end

--@help show_channels
actions.show_channels = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8199");
end

--@help show_favourites
actions.show_favourites = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8200");
end

--@help show_timeline
actions.show_timeline = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8201");
end

--@help show_pictures
actions.show_pictures = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8202");
end

--@help show_music
actions.show_music = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8203");
end

--@help show_video
actions.show_video = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8204");
end

--@help show_news
actions.show_news = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8205");
end

--@help show_weather
actions.show_weather = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8206");
end

--@help show_miniepg
actions.show_miniepg = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8207");
end

--@help show_music_playlist
actions.show_music_playlist = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8208");
end

--@help show_video_playlist
actions.show_video_playlist = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8209");
end

--@help zoomlevel_standard
actions.zoomlevel_standard = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 16389");
end

--@help zoomlevel_0
actions.zoomlevel_0 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 16390");
end

--@help zoomlevel_1
actions.zoomlevel_1 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 16391");
end

--@help zoomlevel_2
actions.zoomlevel_2 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 16392");
end

--@help zoomlevel_3
actions.zoomlevel_3 = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 16393");
end

--@help zoomlevel_toggle
actions.zoomlevel_toggle = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 16394");
end

--@help record
actions.record = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 34");
end

--@help cmd_stop
actions.cmd_stop = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 114");
end

--@help cmd_play
actions.cmd_play = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 92");
end

--@help show_teletext
actions.show_teletext = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 101");
end

--@help show_computer
actions.show_computer = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8210");
end

--@help dovolumedown
actions.dovolumedown = function()
	libs.keyboard.press("volumedown");
end

--@help dovolumeup
actions.dovolumeup = function()
	libs.keyboard.press("volumeup");
end

--@help mute
actions.mute = function()
	libs.keyboard.press("volumemute");
end

--@help aspectratio
actions.aspectratio = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 22");
end

--@help audiochannel
actions.audiochannel = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 72");
end

--@help audioab
actions.audioab = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 133");
end

--@help lastchannel
actions.lastchannel = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 63");
end

--@help portalselect
actions.portalselect = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8254");
end

--@help shaderlast
actions.shaderlast = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 2015");
end

--@help shadernone
actions.shadernone = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 2014");
end

--@help videoab
actions.videoab = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 132");
end

--@help zoomdown
actions.zoomdown = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 105");
end

--@help zoomup
actions.zoomup = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 104");
end

--@help favplus
actions.favplus = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 21");
end

--@help favminus
actions.favminus = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 20");
end

--@help addbookmark
actions.addbookmark = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 12306");
end

--@help brightnessup
actions.brightnessup = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 55");
end

--@help brightnessdown
actions.brightnessdown = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 56");
end

--@help chanminus
actions.chanminus = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8");
end

--@help chanplus
actions.chanplus = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 9");
end

--@help dvdmenu
actions.dvdmenu = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8246");
end

--@help ejectcd
actions.ejectcd = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 12299");
end

--@help osdclock
actions.osdclock = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 2010");
end

--@help rebuildgraph
actions.rebuildgraph = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 53");
end

--@help keeptimeshiftfile
actions.keeptimeshiftfile = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 2012");
end

--@help camwindow
actions.camwindow = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8259");
end

--@help openserviceurl
actions.openserviceurl = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 16382");
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\OpenDVBService.vbs");
	libs.device.mouse();
end

--@help togglesort
actions.togglesort = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8279");
end

--@help togglesortdirection
actions.togglesortdirection = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8280");
end

--@help toggleview
actions.toggleview = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 8278");
end

--@help dopause
actions.dopause = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 0");
end

--@help doresume
actions.doresume = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 92");
end

--@help doactivate
actions.doactivate = function()
	os.start("%SystemRoot%\\System32\\wscript.exe",fs.remotedir() .. "\\DVBViewer\\SendCommand.vbs 16397");
end


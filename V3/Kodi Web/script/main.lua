require("script.core");

------------------------------------------------------------------------
-- Local variable
------------------------------------------------------------------------
local funcArray = {exitKodi, shutdownKodi, suspendKodi, hibernateKodi, rebootKodi};

------------------------------------------------------------------------
-- actions
------------------------------------------------------------------------

--@help Navigate home
actions.home = function ()
	send("Input.Home");
end

--@help Toggle context menu
actions.menu = function ()
	input("contextmenu");
end

--@help Toggle information
actions.info = function ()
	input("info");
end

actions.power = function ()
	libs.server.update({
            type = "dialog",
            title = "Shutdown",
            children = {
				{ type = "item", text="Exit" },
				{ type = "item", text="Shutdown" },
				{ type = "item", text="Suspend" },
				{ type = "item", text="Hibernate" },
				{ type = "item", text="Reboot" }
			},
            ontap = "shutdown"
	});
end

actions.shutdown = function(i)
	i = i + 1;
	if funcArray[i] ~= nil then
		funcArray[i]();
	end
end

--@help Set volume level
--@param vol:number Volume level (0-100)
actions.set_volume = function (vol)
	if (vol > 100) then vol = 100; end
	if (vol < 0) then vol = 0; end
	send("Application.SetVolume", { volume = vol });
end

--@help Toggle mute volume
actions.volume_mute = function ()
	send("Application.SetMute", { mute = "toggle" });
end

--@help Lower volume
actions.volume_down = function ()
	actions.set_volume(volume() - 10);
end

--@help Raise volume
actions.volume_up = function ()
	actions.set_volume(volume() + 10);
end


--@help Navigate up
actions.up = function ()
	input("up");
end

--@help Navigate left
actions.left = function ()
	input("left");
end

--@help Select current item
actions.select = function ()
	Trace("actions.select");
	input("select");
	tSelectId = libs.timer.interval(update_status, 1000);
end

--@help Navigate right
actions.right = function ()
	input("right");
end

--@help Navigate back
actions.back = function ()
	input("back");
end

--@help Navigate down
actions.down = function ()
	input("down");
end
require("script.core");

------------------------------------------------------------------------
-- Event
------------------------------------------------------------------------
events.focus = function ()
	ResetVariable();
	tid = libs.timer.interval(GetStatus, 2000);
end

events.blur = function ()
	onBlur();
	-- ResetVariable();
end

function ResetVariable()
	settings.playerId = "none";
	currentId = -1;
end

------------------------------------------------------------------------
-- actions
------------------------------------------------------------------------
actions.launch = function()
	if OS_WINDOWS then
		os.start(settings.kodiPath);
	end
end

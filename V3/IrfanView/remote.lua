local keyboard = libs.keyboard;


------------------------------------------------
-- Playback
------------------------------------------------


--@help Play previous
actions.play_prev = function()
	keyboard.stroke("backspace");
end

--@help Play next
actions.play_next = function()
	keyboard.stroke("space");
end

--@help Play all
actions.play_all = function()
	keyboard.stroke("control", "w");
end

--@help Enter fullscreen
actions.fullscreen = function()
	keyboard.stroke("enter");
end

--@help Exit fullscreen
actions.quit = function()
	keyboard.stroke("escape");
end


------------------------------------------------
-- Cursors
------------------------------------------------


--@help Left
actions.cur_left = function()
	keyboard.stroke("left");
end

--@help Right
actions.cur_right = function()
	keyboard.stroke("right");
end

--@help Up
actions.cur_up = function()
	keyboard.stroke("up");
end

--@help Down
actions.cur_down = function()
	keyboard.stroke("down");
end


------------------------------------------------
-- Zooming
------------------------------------------------


--@help Zoom out
actions.zoom_out = function()
	keyboard.stroke("oem_minus");
end

--@help Zoom normal
actions.zoom_normal = function()
	keyboard.stroke("digit5");
end

--@help Zoom in
actions.zoom_in = function()
	keyboard.stroke("oem_plus");
end


------------------------------------------------
-- Rotation
------------------------------------------------


--@help Rotate left
actions.rotate_left = function()
	keyboard.text("l");
end

--@help Rotate right
actions.rotate_right= function()
	keyboard.text("r");
end


------------------------------------------------
-- Misc
------------------------------------------------


--@help Delete image
actions.img_delete = function()
	keyboard.stroke("delete");
end


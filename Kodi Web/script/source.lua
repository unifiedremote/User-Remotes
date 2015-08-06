require("script.core");

actions.SourceSelect = function(i)
	i = i + 1;
	--local directory = Sourceitems[i].id;
	--ListContentDirectory(directory);
	
	send("GUI.ActivateWindow", {window = "videolibrary", parameters = {"sources://video/"}});
	
	input("pageup");
	
	for n = 1, i do
		input("down");
	end	
	input("select");
end

actions.Clean = function()
	Clean();
end

actions.Refresh = function()
	Refresh();
end
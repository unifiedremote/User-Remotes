Set WshShell = WScript.CreateObject("WScript.Shell")
Set objXmlDoc = CreateObject("Microsoft.XMLDOM")

Path1 = wshShell.ExpandEnvironmentStrings("%programdata%\CMUV\DVBViewer\setup.xml")


objXmlDoc.async = False
If Not objXmlDoc.load(Path1) Then
   WScript.Echo "Einstellungsdatei des DVB Viewers wurde nicht gefunden."
   WScript.Quit
End If

Set objRoot = objXmlDoc.documentElement
Set colNodes = objXmlDoc.selectNodes("/settings/*")

For Each objNode in colNodes
   For each att in objNode.Attributes
      If att.name = "name" and att.value = "Service" then
         For each objEntry in objNode.childNodes
             If objEntry.Attributes(0).Value = "Adress" then
                ServerURL = objEntry.Text
             End if
         Next
      End if
   Next
Next 


ServerURL = "http://" & ServerURL 
WshShell.Run Chr(34) & ServerURL  & Chr(34), 1, false
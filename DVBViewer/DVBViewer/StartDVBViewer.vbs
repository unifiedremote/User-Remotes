'SET PATH TO DVB Viewer HERE:
Path3 = "c:\program files\DVBViewer\DVBViewer.exe"



'Do not edit below this line --------------------------------
Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

Path1 = wshShell.ExpandEnvironmentStrings("%programfiles(x86)%\DVBViewer\DVBViewer.exe")
Path2 = wshShell.ExpandEnvironmentStrings("%programfiles%\DVBViewer\DVBViewer.exe")

if fso.FileExists(Path1) then
    WshShell.Run """" & Path1 & """"
    WScript.Quit
end if

if fso.FileExists(Path2) then
    WshShell.Run """" & Path2 & """"
    WScript.Quit
end if

if fso.FileExists(Path3) then
    WshShell.Run """" & Path3 & """"
    WScript.Quit
end if

MsgBox("DVBViewer.exe wurde nicht gefunden. Prüfen Sie die Einstellungen in der Datei " & WScript.ScriptFullName)
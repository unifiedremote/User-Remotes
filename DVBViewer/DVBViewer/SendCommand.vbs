Dim Player
If GetDVBVObject(Player) then
	Player.SendCommand(WScript.Arguments(0))
End If

WScript.quit


Function GetDVBVObject(Obj)
    On Error Resume Next

    Err.Clear: Set Obj = GetObject(, "DVBViewerServer.DVBViewer")
    
    If Err.Number = 424 OR Err.Number = 429 Then
        GetDVBVObject = False
    Else
        GetDVBVObject = TRue
    End If
End Function

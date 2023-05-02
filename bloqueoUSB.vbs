Set objShell = CreateObject("WScript.Shell")
objShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR\Start", 4, "REG_DWORD"
Set colDisks = objWMIService.ExecQuery("Select * from Win32_LogicalDisk")
For Each objDisk in colDisks
    If objDisk.DriveType = 2 Then
        objShell.Run "cmd.exe /c echo Y | cacls " & objDisk.DeviceID & "\* /d everyone", 0, True
    End If
Next
MsgBox "Los puertos USB han sido bloqueados."

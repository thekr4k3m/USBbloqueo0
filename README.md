# USBbloqueo0
bloquea el puerto usb y los desbloquea

Set objShell = CreateObject("WScript.Shell")
objShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR\Start", 4, "REG_DWORD"
Set colDisks = objWMIService.ExecQuery("Select * from Win32_LogicalDisk")
For Each objDisk in colDisks
    If objDisk.DriveType = 2 Then
        objShell.Run "cmd.exe /c echo Y | cacls " & objDisk.DeviceID & "\* /d everyone", 0, True
    End If
Next
MsgBox "Los puertos USB han sido bloqueados."
Script para desbloquear los puertos USB:


Set objShell = CreateObject("WScript.Shell")
objShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR\Start", 3, "REG_DWORD"
Set colDisks = objWMIService.ExecQuery("Select * from Win32_LogicalDisk")
For Each objDisk in colDisks
    If objDisk.DriveType = 2 Then
        objShell.Run "cmd.exe /c echo Y | cacls " & objDisk.DeviceID & "\* /g everyone:f", 0, True
    End If
Next
MsgBox "Los puertos USB han sido desbloqueados."



Ten en cuenta que estos scripts deben ejecutarse con privilegios de administrador y que, una vez ejecutados,
 requerirán un reinicio del sistema para que los cambios surtan efecto. Además, ten en cuenta que bloquear
 los puertos USB también puede afectar a otros dispositivos de almacenamiento externos, como discos duros 
externos o tarjetas de memoria, por lo que debes asegurarte de tener una estrategia de seguridad adecuada 
antes de aplicar esta medida.


Como lo guardo y lo ejecuto¿?

Para guardar estos scripts en archivos con extensión ".vbs", sigue estos pasos:
Abre el Bloc de notas o cualquier otro editor de texto.
Copia el código del script que deseas guardar y pégalo en el editor de texto.
Guarda el archivo con el nombre que desees y con la extensión ".vbs". Por ejemplo, "bloquear_usb.vbs" o "desbloquear_usb.vbs".
Asegúrate de guardar el archivo en un lugar donde tengas permisos para acceder y modificar.
Para ejecutar estos scripts, haz doble clic en el archivo ".vbs" que has creado.
 También puedes ejecutarlos desde la línea de comandos de Windows utilizando el
 comando "cscript.exe", siguiendo los mismos pasos que te mencioné anteriormente
 para el script de Active Directory.
Ten en cuenta que, para ejecutar estos scripts, necesitarás tener permisos
 de administrador en el equipo y también deberás asegurarte de haber instalado
 los componentes necesarios para poder trabajar con VBScript y modificar el registro de Windows.


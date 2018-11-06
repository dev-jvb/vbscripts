'-------------------------------------------------------------------------
' // BitLocker Disable Script
' // By: Joeri van Bodegom
' // Date: May 29th 2018
' // Version: 1.0
'-------------------------------------------------------------------------
'Check and run with elevated privileges; required to make registry changes
Set WshShell = WScript.CreateObject("WScript.Shell")
If WScript.Arguments.Length = 0 Then
  Set ObjShell = CreateObject("Shell.Application")
  ObjShell.ShellExecute "wscript.exe" _
    , """" & WScript.ScriptFullName & """ RunAsAdministrator", , "runas", 1
  WScript.Quit
End if

'-------------------------------------------------------------------------
'User input; Yes, No or Cancel
Set objShell = Wscript.CreateObject("Wscript.Shell")
IntButton = objShell.Popup("Do you want to Disable BitLocker to-go?",, "Disable BitLocker to-go script by JvB",3)

'wscript.echo IntButton

'Abort script when Cancel is clicked; otherwise continue
If IntButton = 2 Then Wscript.Quit(0) 'Abort Script - Nothing is changed

' // Set Registry Settings
const HKLM=&H80000002

Set objLoc = CreateObject("WbemScripting.SWbemLocator") 

Set objServx = objLoc.ConnectServer(".", "Root\Default")
objServx.Security_.impersonationlevel = 3 
Set objRegistryx = objServx.Get("StdRegProv")

'-------------------------------------------------------------------------
'When user clicked 'No'; BitLocker will be enabled
If IntButton = 7 Then 'No button was clicked
objRegistryx.SetDwordValue HKLM, "SYSTEM\CurrentControlSet\Policies\Microsoft\FVE", "RDVDenyWriteAccess", "00000001"
WScript.Echo "BitLocker to-go is Enabled - Removable media will be encrypted." 
End If

'-------------------------------------------------------------------------
'When user clicked 'Yes'; BitLocker will be disabled
If IntButton = 6 Then 'Yes button was clicked
objRegistryx.SetDwordValue HKLM, "SYSTEM\CurrentControlSet\Policies\Microsoft\FVE", "RDVDenyWriteAccess", "00000000"
WScript.Echo "BitLocker to-go is Disabled - Removable media will NOT be encrypted." 
End If

'-------------------------------------------------------------------------
'END
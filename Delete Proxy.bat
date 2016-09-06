@ECHO OFF

REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /F

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^
    /v AutoConfigURL /t REG_SZ /d "" /F

Pause

@ECHO OFF

echo Welcome to Vincent's tool.
echo.
pause


:MainMenu 
CLS
echo.
echo [1] Show network tools
echo [2] Show file tools
echo [3] Open website
echo [0] Exit this app
echo.
set /P c=What do you want to do?
if /I "%c%" EQU "1" goto :NetworkToolsMenu
if /I "%c%" EQU "2" goto :FileToolsMenu
if /I "%c%" EQU "3" goto :OpenWebsite
if /I "%c%" EQU "0" goto :Exit

	:OpenWebsite
	CLS
	echo "You selected - Open website"
	echo.
	start "" https://www.vincentdekoning.nl
	echo.
	pause
	goto :MainMenu

	:Exit
	echo "You selected - Exit"
	exit
	

:FileToolsMenu 
CLS
echo.
echo [1] Hide files
echo [2] Show files
echo [0] Return to main menu
echo.
set /P c=What do you want to do?
if /I "%c%" EQU "1" goto :HideFiles
if /I "%c%" EQU "2" goto :UnhideFiles
if /I "%c%" EQU "0" goto :MainMenu

	:HideFiles
	CLS
	echo "You selected - Show Files"
	echo "make sure the secret picture.jpg file is availible on the desktop"
	echo.
	cd desktop
	pause
	echo.
	copy /b picture.png + secret.7z safe.png
	echo.
	pause
	goto :FileToolsMenu 

	
	:UnhideFiles
	CLS
	echo "You selected - Show Files"
	echo "make sure the secret picture.jpg file is availible on the desktop"
	echo.
	cd desktop
	pause
	echo.
	ren safe.png secret.7z
	echo.
	pause
	goto :FileToolsMenu 

:NetworkToolsMenu
CLS
echo.
echo [1] Ping vincentdekoning.nl
echo [2] Show internal IP adress
echo [3] Show external IP adress
echo [4] Show my hostname
echo [5] Delete Proxy Script
echo [6] Find IP based on hostname
echo [7] Shutdown computer based on hostname
echo [8] Display (and use) user input
echo [0] Return to main menu
echo.
set /P c=What do you want to do?
if /I "%c%" EQU "1" goto :Ping
if /I "%c%" EQU "2" goto :InternalIP
if /I "%c%" EQU "3" goto :ExternalIP
if /I "%c%" EQU "4" goto :Hostname
if /I "%c%" EQU "5" goto :DeleteProxyScript
if /I "%c%" EQU "6" goto :FindIP
if /I "%c%" EQU "7" goto :ShutdownHostname
if /I "%c%" EQU "8" goto :UserInput
if /I "%c%" EQU "0" goto :MainMenu

	:Ping
	CLS
	echo "You selected - Ping vincentdekoning.nl"
	echo.
	ping vincentdekoning.nl
	echo.
	pause
	goto :NetworkToolsMenu

	:InternalIP
	CLS
	echo "You selected - Show internal IP adress"
	echo.
	ipconfig
	echo.
	pause
	goto :NetworkToolsMenu

	:ExternalIP
	CLS
	echo "You selected - Show external IP adress"
	echo.
	nslookup myip.opendns.com. resolver1.opendns.com
	echo.
	pause
	goto :NetworkToolsMenu

	:Hostname
	CLS
	echo "You selected - Show my hostname"
	echo.
	hostname
	echo.
	pause
	goto :NetworkToolsMenu

	:DeleteProxyScript
	CLS
	echo "You selected - Delete Proxy Script"
	echo.
	echo First step: We are deleting the register key responsable for the proxy script.
	echo.
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /F
	echo.
	pause
	echo.
	echo Second step: We are adding a empty register key, because the system will otherwise repair, after some time, the original register key .
	echo.
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^ /v AutoConfigURL /t REG_SZ /d "" /F
	echo.
	pause
	goto :NetworkToolsMenu
	
	:FindIP
	CLS
	echo "You selected - Find IP for hostname"
	echo.
	set /p hostnameinput="Enter the hostname you want to find: "
	echo.
	nslookup %hostnameinput%
	echo.
	pause
	goto :NetworkToolsMenu
	
	
	:ShutdownHostname
	CLS
	echo "You selected - Shutdown a computer based on the hostname"
	echo.
	set /p hostnameshutdown="Enter the hostname you want to shutdown: "
	echo.
	shutdown /m \\%hostnameshutdown%
	echo.
	pause
	goto :NetworkToolsMenu
	
	:UserInput
	CLS
	echo "You selected - Display (and use) user input"
	echo.
	set /p input="Write something, it will be used in the command "echo""
	echo %input%
	echo.
	pause
	goto :NetworkToolsMenu
	
	:UserInput
	CLS
	echo "You selected - merge"
	echo.
	set /p input="Write something, it will be used in the command "echo""
	echo %input%
	echo.
	pause
	goto :NetworkToolsMenu
	
		:UserInput
	CLS
	echo "You selected - merge"
	echo.
	set /p input="Write something, it will be used in the command "echo""
	echo %input%
	echo.
	pause
	goto :NetworkToolsMenu



	



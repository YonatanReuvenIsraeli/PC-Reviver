@echo off
title PC Reviver
setlocal
echo Program Name: PC Reviver
echo Version: 1.3.1
echo Developer: @YonatanReuvenIsraeli
echo Website: https://www.yonatanreuvenisraeli.dev
echo License: GNU General Public License v3.0
net user > nul 2>&1
if "%errorlevel%"=="0" goto "NotWindowsRecoveryEnvironment"
goto "Start"

:"NotWindowsRecoveryEnvironment"
echo.
echo You are not Windows Recovery Environment! You must run this option from in Windows Recovery Environment. Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"Start"
echo.
set Kill=
set /p Kill="This batch file only revives PCs killed by "PC Killer.bat" made by @YonatanReuvenIsraeli. Has your PC been killed by "PC Killer.bat" made by @YonatanReuvenIsraeli? (Yes/No) "
if /i "%Kill%"=="Yes" goto "Drive"
if /i "%Kill%"=="No" goto "Close"
echo Invalid syntax
goto "Start"

:"Drive"
echo.
set Drive=
set /p Drive="What drive is Windows installed on? (A:-Z:) "
if /i "%Drive%"=="A:" goto "SureDrive"
if /i "%Drive%"=="B:" goto "SureDrive"
if /i "%Drive%"=="C:" goto "SureDrive"
if /i "%Drive%"=="D:" goto "SureDrive"
if /i "%Drive%"=="E:" goto "SureDrive"
if /i "%Drive%"=="F:" goto "SureDrive"
if /i "%Drive%"=="G:" goto "SureDrive"
if /i "%Drive%"=="H:" goto "SureDrive"
if /i "%Drive%"=="I:" goto "SureDrive"
if /i "%Drive%"=="J:" goto "SureDrive"
if /i "%Drive%"=="K:" goto "SureDrive"
if /i "%Drive%"=="L:" goto "SureDrive"
if /i "%Drive%"=="M:" goto "SureDrive"
if /i "%Drive%"=="N:" goto "SureDrive"
if /i "%Drive%"=="O:" goto "SureDrive"
if /i "%Drive%"=="P:" goto "SureDrive"
if /i "%Drive%"=="Q:" goto "SureDrive"
if /i "%Drive%"=="R:" goto "SureDrive"
if /i "%Drive%"=="S:" goto "SureDrive"
if /i "%Drive%"=="T:" goto "SureDrive"
if /i "%Drive%"=="U:" goto "SureDrive"
if /i "%Drive%"=="V:" goto "SureDrive"
if /i "%Drive%"=="W:" goto "SureDrive"
if /i "%Drive%"=="X:" goto "SureDrive"
if /i "%Drive%"=="Y:" goto "SureDrive"
if /i "%Drive%"=="Z:" goto "SureDrive"
echo Invalid syntax!
goto "Drive"

:"SureDrive"
echo.
set SureDrive=
set /p SureDrive="Are you sure "%Drive%" is the drive Windows is installed on? (Yes/No) "
if /i "%SureDrive%"=="Yes" goto "CheckExistDrive"
if /i "%SureDrive%"=="No" goto "Drive"
echo Invalid syntax!
goto "SureDrive"

:"CheckExistDrive"
if not exist "%Drive%" goto "NotExist"
if not exist "%Drive%\Windows" goto "NotWindows"
goto "CheckKilled"

:"NotExist"
echo "%Drive%" does not exist. Please try again.
goto "Drive"

:"NotWindows"
echo Windows not installed on "%Drive%"!
goto "Drive"

:"CheckKilled"
echo.
echo Checking if this PC has been killed by by "PC Killer.bat" made by @YonatanReuevnIsraeli.
if exist "%Drive%\Windows\System32\hal1.dll" goto "Revive"
echo This PC has not been killed by by "PC Killer.bat" made by @YonatanReuevnIsraeli. Press any key to close this batch file.
goto "Close"

:"Revive"
echo This PC has been killed by by "PC Killer.bat" made by @YonatanReuevnIsraeli.
echo.
echo Reviving this PC.
ren "%Drive%\Windows\System32\hal1.dll" "hal.dll"
if not "%errorlevel%"=="0" goto "ErrorRevive"
goto "Permissions"

:"ErrorRevive"
echo There has been an error! You can try again.
goto "Drive"

:"Permissions"
echo.
echo Reseting user permissions.
icacls "%Drive%\Windows\System32\hal.dll" /setowner "NT SERVICE\TrustedInstaller" > nul
if not "%errorlevel%"=="0" goto "ErrorPermissions"
icacls "%Drive%\Windows\System32\hal.dll" /reset > nul
if not "%errorlevel%"=="0" goto "ErrorPermissions"
echo User permissions reset.
echo.
echo PC revived! Press any key to restart you PC.
endlocal
pause > nul 2>&1
wpeutil reboot

:"ErrorPermissions"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "Permissions"

:"Close"
endlocal
exit

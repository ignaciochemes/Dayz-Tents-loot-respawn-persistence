@echo off
TITLE DayZ Dayz server - Testeo
COLOR 0A
:: Variables::
::SteamCMD.exe path
::DayZServer_64_3.exe path
set DAYZ-SA_SERVER_LOCATION="C:\dayzservercarpas"
::Bec.exe path
set BEC_LOCATION="C:\dayzservercarpas\battleye\Bec"
::::::::::::::
::borrado de archivos
::set Archivos="C:\dayzservercarpas\ServerProfiles"
::Borrado de Dynamics - DYNAMICS DELETE
set ArchivosDynamics="C:\dayzservercarpas\mpmissions\dayzOffline.chernarusplus\storage_1\data"
::Copiado de Dynamics - DYNAMICS PASTE
set Archivospegar="C:\BKseguridadDayZ"

echo siegmund
goto chequeoSV
pause

:chequeoSV
tasklist /FI "IMAGENAME eq DayZServer_x64.exe" 2>NUL | find /I /N "DayZServer_x64.exe">NUL
if "%ERRORLEVEL%"=="0" goto checkbec
cls
echo El servidor esta off, repasando tareas.
timeout 2 >nul
cls
echo El servidor esta off, repasando tareas..
timeout 1 >nul
cls
echo El servidor esta off, repasando tareas...
timeout 1 >nul
goto killsv

:checkbec
tasklist /FI "IMAGENAME eq Bec2.exe" 2>NUL | find /I /N "Bec2.exe">NUL
if "%ERRORLEVEL%"=="0" goto loopsv
cls
echo Bec no esta funcionando, ya lo levanto..
goto startbec

:loopsv
FOR /L %%s IN (25,-1,0) DO (
	cls
	echo el servidor esta corriendo. Proximo chequeo en %%s segundos.. 
	timeout 1 >nul
)
goto chequeoSV

:killsv
taskkill /f /im Bec2.exe
taskkill /f /im DayZServer_x64.exe
goto borradodynamics


:startsv
cls
echo Levantando el servidor DayZ.
timeout 1 >nul
cls
echo Levantando el servidor DayZ..
timeout 1 >nul
cls
echo Levantando el servidor DayZ...
cd "%DAYZ-SA_SERVER_LOCATION%"
start DZSALModServer.exe -instanceId=1 -config=serverDZ.cfg -profiles=C:\dayzservercarpas\ServerProfiles -port=2402 -cpuCount=8 -FilePatching -dologs -BEpath=C:\dayzservercarpas\battleye -adminlog -freezecheck -netLog -servermod=@KillFeed;@PlayerCounter;@UnlimitedStamina -mod=@CF;@AmmunitionExpansion;@WeaponExpansion;@VPPAdminTools;@VPPNotifications;@PartyMe
FOR /L %%s IN (25,-1,0) DO (
	cls
	echo Levantando el servidor DayZ, espere %%s segundos para iniciar BEC.. 
	timeout 1 >nul
)
goto startbec

:startbec
cls
echo Levantando Bec.
timeout 1 >nul
cls
echo Levantando Bec..
timeout 1 >nul
cls
echo Levantando Bec...
timeout 1 >nul
cd "%BEC_LOCATION%"
start Bec2.exe -f Config.cfg --dsc
goto chequeoSV

:borradodynamics
cls
echo borrando Carpetas. 
timeout 1 >nul
cls
rd /s /q "C:\dayzservercarpas\mpmissions\dayzOffline.chernarusplus\storage_1\data"
echo borrando Carpetas..
timeout 1 >nul
cls
echo borrando Carpetas...
timeout 1 >nul

cls
echo Borrado terminado
timeout 4 >nul
goto copiapega
::dynamics 07 carpas:: - TENTS
::dynamics 09 items en el piso:: - GROUND ITEMS

:copiapega
cls
echo Comenzando copiado de dynamics.
timeout 2 >nul
SET Orig=C:\BKseguridadDayZ\data
SET Dest=C:\dayzservercarpas\mpmissions\dayzOffline.chernarusplus\storage_1\data
MKDIR "%Dest%"
XCOPY "%Orig%\*.*" "%Dest%\*.*" /v /e /f /h /y /a
cls
echo Copiado de dynamics Terminado.
timeout 2 >nul

cls
echo By siegmund.
timeout 1 >nul
cls
echo By siegmund..
timeout 1 >nul
cls
echo By siegmund...
timeout 1 >nul
::goto actualizacionmod


:: COPIA ACTUALIZACION MOD - MOD ACTUALIZATION (COMMENT LINES IF DONT USE IT -129 TO 204-)

::actualizacionmod
::rem @AmmunitionExpansion
::set borra=C:\dayzservercarpas\@AmmunitionExpansion
::set copia=C:\Program Files (x86)\Steam\steamapps\common\DayZ\!Workshop\@AmmunitionExpansion
::set pega=C:\dayzservercarpas\@AmmunitionExpansion
::RD /s /q "%borra%" > nul 2>&1
::XCOPY "%copia%\*.*" "%pega%\*.*" /v /e /f /h /y


::rem @CF
::set borra=C:\dayzservercarpas\@CF
::set copia=C:\Program Files (x86)\Steam\steamapps\common\DayZ\!Workshop\@CF
::set pega=C:\dayzservercarpas\@CF
::RD /s /q "%borra%" > nul 2>&1
::XCOPY "%copia%\*.*" "%pega%\*.*" /v /e /f /h /y

::rem @VPPAdminTools
::set borra=C:\dayzservercarpas\@VPPAdminTools
::set copia=C:\Program Files (x86)\Steam\steamapps\common\DayZ\!Workshop\@VPPAdminTools
::set pega=C:\dayzservercarpas\@VPPAdminTools
::RD /s /q "%borra%" > nul 2>&1
::XCOPY "%copia%\*.*" "%pega%\*.*" /v /e /f /h /y

::rem @VPPNotifications
::set borra=C:\dayzservercarpas\@VPPNotifications
::set copia=C:\Program Files (x86)\Steam\steamapps\common\DayZ\!Workshop\@VPPNotifications
::set pega=C:\dayzservercarpas\@VPPNotifications
::RD /s /q "%borra%" > nul 2>&1
::XCOPY "%copia%\*.*" "%pega%\*.*" /v /e /f /h /y

::rem @WeaponExpansion
::set borra=C:\dayzservercarpas\@WeaponExpansion
::set copia=C:\Program Files (x86)\Steam\steamapps\common\DayZ\!Workshop\@WeaponExpansion
::set pega=C:\dayzservercarpas\@WeaponExpansion
::RD /s /q "%borra%" > nul 2>&1
::XCOPY "%copia%\*.*" "%pega%\*.*" /v /e /f /h /y

::rem @PartyMe
::set borra=C:\dayzservercarpas\@PartyMe
::set copia=C:\Program Files (x86)\Steam\steamapps\common\DayZ\!Workshop\@PartyMe
::set pega=C:\dayzservercarpas\@PartyMe
::RD /s /q "%borra%" > nul 2>&1
::XCOPY "%copia%\*.*" "%pega%\*.*" /v /e /f /h /y

::rem @KillFeed
::set borra=C:\dayzservercarpas\@KillFeed
::set copia=C:\Program Files (x86)\Steam\steamapps\common\DayZ\!Workshop\@KillFeed
::set pega=C:\dayzservercarpas\@KillFeed
::RD /s /q "%borra%" > nul 2>&1
::XCOPY "%copia%\*.*" "%pega%\*.*" /v /e /f /h /y

::rem @NoShoeDamage
::set borra=C:\dayzservercarpas\@NoShoeDamage
::set copia=C:\Program Files (x86)\Steam\steamapps\common\DayZ\!Workshop\@No Shoe Damage
::set pega=C:\dayzservercarpas\@NoShoeDamage
::RD /s /q "%borra%" > nul 2>&1
::XCOPY "%copia%\*.*" "%pega%\*.*" /v /e /f /h /y

::rem @PlayerCounter
::set borra=C:\dayzservercarpas\@PlayerCounter
::set copia=C:\Program Files (x86)\Steam\steamapps\common\DayZ\!Workshop\@PlayerCounter
::set pega=C:\dayzservercarpas\@PlayerCounter
::RD /s /q "%borra%" > nul 2>&1
::XCOPY "%copia%\*.*" "%pega%\*.*" /v /e /f /h /y

::rem @UnlimitedStamina
::set borra=C:\dayzservercarpas\@UnlimitedStamina
::set copia=C:\Program Files (x86)\Steam\steamapps\common\DayZ\!Workshop\@Unlimited Stamina
::set pega=C:\dayzservercarpas\@UnlimitedStamina
::RD /s /q "%borra%" > nul 2>&1
::XCOPY "%copia%\*.*" "%pega%\*.*" /v /e /f /h /y

goto startsv
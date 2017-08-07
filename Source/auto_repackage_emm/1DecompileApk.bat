@echo off & setlocal enabledelayedexpansion

cd /d %~dp0
set apk_path=.\apk
set keystore_path=.\keystore
set resource_path=.\resource
set result_path=.\result
set log_name=decompile.log

if not exist %apk_path% (
	echo apk dir not exist
	pause
	exit
)
if not exist %keystore_path% (
	echo keystore dir not exist
	pause
	exit
)
if not exist %resource_path% (
	echo resource dir not exist
	pause
	exit
)

if exist %result_path% (
	echo result dir exist, delete it >> %result_path%\%log_name%
	rd /s /q %result_path%
)
md %result_path%
echo create result dir >> %result_path%\%log_name%
cd %apk_path%
for %%i in (*.apk) do (
	set apkName=%%i
	echo apk name: !apkName:~0,-4!
	echo start copy apk file. >> ..\%result_path%\%log_name%
	copy %%i ..\tools
	echo copy apk file success. >> ..\%result_path%\%log_name%
	cd ..\tools
	echo start decompile apk >> ..\%result_path%\%log_name%
	call apktool.bat d -f %%i
	echo decompile apk success >> ..\%result_path%\%log_name%
	cd ..
	echo start call 2ReplaceResource bat >> %result_path%\%log_name%
	call 2ReplaceResource.bat !apkName:~0,-4!
	echo 2ReplaceResource bat run over >> %result_path%\%log_name%
	echo start call 4Resigner bat >> %result_path%\%log_name%
	call 4Resigner.bat !apkName:~0,-4!
	echo 4Resigner bat run over
)
echo apk file is resigned success
pause
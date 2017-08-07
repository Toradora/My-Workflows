@echo off
cd /d %~dp0

set result_path=..\..\..\result
set keystore_path=..\..\..\keystore/nq.keystore
set keystore_name=nq.keystore
set keystore_alias=nq_android
set keystore_storepass=nq2012
set keystore_keypass=nq2012


set temp_prefix=temp_
set temp_resigner=Resigner_

set target_path=.\tools\%1
set apk_name=%1.apk


if exist %target_path% (
	echo start bale apk
	if exist CheckCert-unsigned.apk (
		del CheckCert-unsigned.apk
	)
	.\tools\apktool b %target_path% CheckCert-unsigned.apk
	echo bale apk success
	if exist tools\%1\dist (
		cd tools\%1\dist
		echo start signer apk
		jarsigner -verbose -keystore %keystore_path% -storepass %keystore_storepass% %apk_name% %keystore_alias% -keypass %keystore_keypass%
		echo signer apk success
		copy %apk_name% %result_path%\%1-signed.apk
		cd ..\..
		rd /s /q .\%1
		del %apk_name%
	)
)else echo target_path not exist

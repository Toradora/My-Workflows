set src_resource_icon_path=.\resource\icon
set src_resource_logo_path=.\resource\logo
set src_resource_string_path=.\resource\string
set target_path=.\tools\%1\res
set result_path=.\result
set log_name=icon_logo_result.log
echo %target_path%

if exist %target_path% (
	echo exist apk file >> %result_path%\%log_name%
	if exist %src_resource_icon_path% (
		xcopy /e/q/y %src_resource_icon_path%  %target_path%
		echo copy icon success >> %result_path%\%log_name%
		if exist %src_resource_logo_path% (
			echo logo path exist >> %result_path%\%log_name%
			goto CopyLogo
		)else echo logo path not exist >> %result_path%\%log_name%
	)else echo icon path not exist >> %result_path%\%log_name%
)else echo apk resource file not exist >>%result_path%\%log_name%


:CopyLogo
echo start copy logo >> %result_path%\%log_name%
if exist %target_path% (
	echo exist apk file >> %result_path%\%log_name%
	if exist %src_resource_logo_path% (
		xcopy /e/q/y %src_resource_logo_path%  %target_path%
		echo copy logo success  >> %result_path%\%log_name%
		if exist %src_resource_string_path% (
			echo string path exist, start call 3ReplaceString.bat >> %result_path%\%log_name%
			call 3ReplaceString.bat %target_path%
			echo 3ReplaceString bat run over >> %result_path%\%log_name%
		)else echo string path not exist >> %result_path%\%log_name%

	)else echo logo path not exist >> %result_path%\%log_name%

)else echo target path not exist  >> %result_path%\%log_name%

set src_resource_string_CN_path=.\resource\string\values-zh-rCN
set src_resource_string_EN_path=.\resource\string\values

set target_CN_path=%1\values-zh-rCN
set target_EN_path=%1\values

set target_CN_file=%1\values-zh-rCN\strings.xml
set target_EN_file=%1\values\strings.xml

set cn_temp_file=gb-2312-cn.xml
set en_temp_file=gb-2312-en.xml

set target_CN_temp_file=%1\values-zh-rCN\%cn_temp_file%
set target_EN_temp_file=%1\values\%en_temp_file%

set target_file=strings.xml
set flag_path=keystore


iconv -c -f utf-8 -t gb2312 %src_resource_string_EN_path%\strings.xml > %src_resource_string_EN_path%\temp_en.xml

del %src_resource_string_EN_path%\strings.xml
ren %src_resource_string_EN_path%\temp_en.xml strings.xml

cd %src_resource_string_EN_path%
if exist %cn_temp_file% (del %cn_temp_file%)
if exist %en_temp_file% (del %en_temp_file%)

for /f "tokens=1,2 delims=:" %%i in (strings.xml) do (
	set replaceKey=%%i
	set replaceStr=%%j
	echo !replaceKey!
	echo !replaceStr!
	if not exist %flag_path% (
		cd ..\..\..
	)
	if exist %target_EN_file% (
		iconv -c -f utf-8 -t gb2312 %target_EN_file% > %target_EN_path%\%en_temp_file%
		del %target_EN_file%
	)
	if exist %target_EN_temp_file% (
		for /f "delims=" %%j in (%target_EN_temp_file%) do (
			set line=%%j
			echo "!line!"|find ""!replaceKey!"">nul && set line=!replaceStr!
			echo !line! >> %en_temp_file%
		)
		del %target_EN_temp_file%
	)else (
		if exist %en_temp_file% (
			for /f "delims=" %%j in (%en_temp_file%) do (
				set line=%%j
				echo  before replace: !line!
				echo "!line!"|find ""!replaceKey!"">nul && set line=!replaceStr!
				echo  after replace: !line!
				echo !line! >> temp_gb-2312-en.xml
			)
			del %en_temp_file%
			ren temp_gb-2312-en.xml %en_temp_file%
		)
	)
)
if not exist %flag_path% (
	cd ..\..\..
)
if exist %en_temp_file% (
	iconv -c -f gb2312 -t utf-8 %en_temp_file% > strings.xml
	del %en_temp_file%
	move strings.xml %target_EN_path%
)


echo start CopyCNString bat
goto CopyCNString

:CopyCNString
echo %src_resource_string_CN_path%\strings.xml
iconv -c -f utf-8 -t gb2312 %src_resource_string_CN_path%\strings.xml > %src_resource_string_CN_path%\temp_cn.xml
del %src_resource_string_CN_path%\strings.xml
ren %src_resource_string_CN_path%\temp_cn.xml strings.xml

cd %src_resource_string_CN_path%
for /f "tokens=1,2 delims=:" %%i in (strings.xml) do (
	set replaceKey=%%i
	set replaceStr=%%j
	echo !replaceKey!
	echo !replaceStr!
	if not exist %flag_path% (
		cd ..\..\..
	)
	echo target_CN_file:%target_CN_file%
	if exist %target_CN_file% (
		iconv -c -f utf-8 -t gb2312 %target_CN_file% > %target_CN_path%\%cn_temp_file%
		del %target_CN_file%
	)
	if exist %target_CN_temp_file% (
		for /f "delims=" %%j in (%target_CN_temp_file%) do (
			set line=%%j
			echo  before replace: !line!
			echo "!line!"|find ""!replaceKey!"">nul && set line=!replaceStr!
			echo  after replace: !line!
			echo !line! >> %cn_temp_file%
		)
		del %target_CN_temp_file%
	)else (
		if exist %cn_temp_file% (
			for /f "delims=" %%j in (%cn_temp_file%) do (
				set line=%%j
				echo  before replace: !line!
				echo "!line!"|find ""!replaceKey!"">nul && set line=!replaceStr!
				echo  after replace: !line!
				echo !line! >> temp_gb-2312-cn.xml
			)
			del %cn_temp_file%
			ren temp_gb-2312-cn.xml %cn_temp_file%
		)
	)
)
if not exist %flag_path% (
	cd ..\..\..
)
if exist %cn_temp_file% (
	iconv -c -f gb2312 -t utf-8 %cn_temp_file% > strings.xml
	del %cn_temp_file%
	move strings.xml %target_CN_path%
)
echo replace string is run success!!!
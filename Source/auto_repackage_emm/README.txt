一、目录说明

	1、apk:

		将需要重新打包的apk文件拷贝到该目录

	2、keystore:
	
		将重新打包需要的签名证书文件拷贝到该目录

	3、resource (需要替换的资源文件目录)

  		该目录下有三个子目录

   		1.icon（需要替换的应用内的其他图标（除了logo以为的所有图标）,根据分辨率的不同放到下面五个不同的分辨率目录下）
			
			drawable-hdpi-v4

			drawable-mdpi-v4

			drawable-nodpi-v4

			drawable-xhdpi-v4

			drawable-xxhdpi-v4

   		2.logo（需要替换的应用logo图标，根据分辨率的不同放到下面五个不同的分辨率目录下）

			mipmap-hdpi 

			mipmap-mdpi 

			mipmap-xhdpi 

			mipmap-xxhdpi 

			mipmap-xxxhdpi 

   		3.string（需要替换的应用内的显示文字）

 			注意：string字符串的替换：英文放到values下的strings文件中, 中文放到values-zh-rCN下的strings文件中

	4、tools:

		脚本运行需要的工具


二、使用方法：

    	只需点击1DecompileApk.bat运行即可

    	执行完控制台会输出："apk file is resigned success" 表示替换完成。


三、新的apk:

	脚本执行时会检查有没有result目录，有的话删除并重新创建result目录，该目录存放打包后的apk和日志文件

	新的apk文件名带有signed标识（例如：xxx-signed.apk）。


四、注意事项：

	1、该工具需要JDK的环境，请使用之前检查是否安装了JDK并正确配置了环境变量


		JDK的下载、安装与环境变量的配置请参考：http://www.cnblogs.com/smyhvae/p/3788534.html


	2、缺少任何一个目录都无法完成资源文件替换功能


	3、可替换的resource和文件的命名规则请参考当前目录下的文档：NQSky EMM 4.2 客户端及管理平台界面定制（白标）规格指南.docx
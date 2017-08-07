=================================================================
自主Inhouse测试版MDM签名方式

1.将要签名的MDM ipa文件放到该文件夹
2.cd 到这个文件夹执行./Nationsky_TestAPPReSign
3.查看out子文件夹下reSign.ipa是否生成，这个reSign.ipa就是重签名后的ipa文件

=================================================================
AppReSign 使用说明

AppReSign [ipa路径] [-AppBundleIdentifier=<AppBundleIdentifier>] [-ProvisionProfilePath=<ProvisionProfilePath>] [-Certificate=<Certificate>] [-Out=<Out>] [-ResourceRules=<ResourceRules>]


-AppBundleIdentifier:   需要修改的app Bundle Identifier （可不传）
-ProvisionProfilePath:  需要使用的Provision Profile绝对路径，如果使用ipa原有的Provision Profile则不需要传递该参数 （可不传）
-Certificate:           签名App使用的证书文件名称或SHA-1值 （必要参数）
-Out:                   签名后的ipa文件目录，签名后的文件为reSign.ipa （必要参数）
-ResourceRules:         签名ipa时指定不签名的资源文件 （可不传）

示例：
./AppReSign /Users/mac/Desktop/2/iEMM-4.3.0.430000100.ipa  -AppBundleIdentifier="com.nationsky.test" -ProvisionProfilePath="/Users/mac/Desktop/2/NS_TEST.mobileprovision" -Certificate="4566FC00FD31331BF4B40C6A479B5E089C7EB11A" -Out="/Users/mac/Desktop/2/out" -ResourceRules="/Users/mac/Desktop/2/ResourceRules.plist"

=================================================================


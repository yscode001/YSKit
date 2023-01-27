/**
 一、文件夹目录
 AppDelegate：应用代理
 AppFunction：应该功能
 Color：颜色
 Configuration：配置
 ConstExt：常量扩展
 Document：文档
 Enum：常用枚举
 
 二、文件命名规则(大驼峰)
 Model：XxxM
 ViewModel：XxxVM
 ViewController：XxxVC
 View：XxxV
 Enum：XxxEnum
 Configuration：XxxCfg
 
 三、变量命名规则(小驼峰)
 Model：xxM
 ViewModel：xxVM
 ViewController：xxVC
 View：    xxV(View)、
        xxBtn(Button)、
        xxImgV(ImageView)、
        xxImg(Image)、
        xxLbl(或xxLab，Label)、
        xxColv(CollectionView)、
        xxTbv(TableView)、
        xxTV(TextView)、
        xxTF(TextField)、
 Enum：xxEnum或xxType
 Configuration：xxCfg
 
 四、常用功能
 当前用户：CurUser.shared.xxx
 
 五、常用工具
 是否启用日志打印功能(默认启用)：Printer.enable(enable:  true or false)
 日志打印(只在启用日志打印功能的前提下有效)：Printer.print("xxx")
 */

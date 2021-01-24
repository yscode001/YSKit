# YSKit
基于原生的iOS开发工具库

~~~ swift
pod 'YSKit'
pod install
import YSKit
~~~


- [YSKit/Core 详情点击](YSKitProject/YSKit/Core/README.md)

  核心组件协议，主要包括：      

  1. 扩展对象协议：YSCoreProtocol、YSOriginalObjectProtocol
  2. Codeable协议扩展
  3. Then协议扩展
  4. 通知Notification协议封装
  5. 用户偏好设置UserDefaults协议封装
  6. 钥匙串KeyChain协议封装

- [YSKit/CreateObject 详情点击](YSKitProject/YSKit/CreateObject/README.md)

  创建对象快捷方式

- [YSKit/Extension 详情点击](YSKitProject/YSKit/Extension/README.md)

  1. Foundation常用扩展
  2. UIKit常用扩展
  3. UIViewController常用扩展
  4. WKWebView常用扩展

- [YSKit/Control 详情点击](YSKitProject/YSKit/Control/README.md)

  常用自定义控件，目前包括以下6类： 
  
  1. 自定义导航控制器
  2. TextView(随内容高度而变化约束，并回调给外部使用)
  3. 自定义角标badge
  4. 自定义消息提醒小红点
  5. CircleDraw(圆形背景绘制)
  6. CategoryView(自定义分类视图)

- [YSKit/PlaceholderView 详情点击](YSKitProject/YSKit/PlaceholderView/README.md)

  UIView的占位视图

  目前有以下4类：loading(加载中)、empty(空数据)、error(出错了)、signIn(需要登录)
  
  使用步骤：

  1. 定义占位视图(placeholderView)
  2. 将占位视图(placeholderView)添加至内容视图上(contentView)
  3. 由内容视图(contentView)来控制占位视图(placeholderView)是否显示

- [YSKit/Base 详情点击](YSKitProject/YSKit/Base/README.md)

  常用的一些基类，为减少耦合，这里仅仅增加了一些辅助方法，使用时直接继承即可。即使继承了此基类，你也完全可以实现自己的基于原生的方法或属性，完全不影响。

  1. 控制器基类
  2. Cell基类

- [YSKit/Database 详情点击](YSKitProject/YSKit/Database/README.md)

  对CoreData的封装，使用CoreData管理本地数据库。
~~~swift
/// 主线程
let m = CoreDataManager.shared.mainContext
        
/// 后台线程
let o = CoreDataManager.shared.operateContext
        
/// 应用启动后进行注册
CoreDataManager.shared.ys.registerAfterLaunching(dbFileName: "dbFileName")
        
/// 保存
CoreDataManager.shared.ys.save(o)
        
/// 回滚
CoreDataManager.shared.ys.roolback(o)
~~~

//
//  Notificater.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/19.
//

class Notificater{
    
    // 发送通知
    class func post(_ notification: Notification){
        NotificationCenter.default.post(notification)
    }
    class func post(_ notiName: NotiName, object: Any? = nil){
        NotificationCenter.default.post(name: NSNotification.Name(notiName.rawValue), object: object)
    }
    class func post(_ notiName: NotiName, object: Any?, userInfo: [AnyHashable: Any]?){
        NotificationCenter.default.post(name: NSNotification.Name(notiName.rawValue), object: object, userInfo: userInfo)
    }
    
    // 监听单个自定义通知
    class func add(observer: Any, selector: Selector, notiName: NotiName, object: Any? = nil){
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(notiName.rawValue), object: object)
    }
    // 监听多个自定义通知，多个通知执行相同方法
    class func add(observer: Any, selector: Selector, notiNames: [NotiName], object: Any? = nil){
        for item in notiNames{
            NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(item.rawValue), object: object)
        }
    }
    
    // 监听单个系统通知
    class func add_system(observer: Any, selector: Selector, notiName: NSNotification.Name, object: Any? = nil){
        NotificationCenter.default.addObserver(observer, selector: selector, name: notiName, object: object)
    }
    // 监听多个系统通知，多个通知执行相同方法
    class func add_system(observer: Any, selector: Selector, notiNames: [NSNotification.Name], object: Any? = nil){
        for item in notiNames{
            NotificationCenter.default.addObserver(observer, selector: selector, name: item, object: object)
        }
    }
}

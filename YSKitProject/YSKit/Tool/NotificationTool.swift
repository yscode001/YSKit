//
//  NotificationTool.swift
//  Alamofire
//
//  Created by 姚帅 on 2023/1/20.
//

/// 通知工具
public class NotificationTool{
    
    // MARK: - 发送通知
    public  class func post(_ noti: Notification){
        NotificationCenter.default.post(noti)
    }
    public  class func post(_ name: Notification.Name){
        NotificationCenter.default.post(name: name, object: nil)
    }
    public  class func post(_ name: Notification.Name, object: Any){
        NotificationCenter.default.post(name: name, object: object)
    }
    public  class func post(_ name: Notification.Name, object: Any?, userInfo: [AnyHashable: Any]?){
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }
    
    // MARK: - 监听通知
    public  class func addObserver(_ observer: Any, selector: Selector, name: Notification.Name?, object: Any? = nil){
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
    }
    public  class func addObserver(_ observer: Any, selector: Selector, names: [Notification.Name?], object: Any? = nil){
        for name in names {
            NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
        }
    }
    public  class func addObserver(_ object: Any?, name: Notification.Name?, queue: OperationQueue?, using: @escaping (Notification) -> Void){
        NotificationCenter.default.addObserver(forName: name, object: object, queue: queue, using: using)
    }
    public class func addObserver(_ object: Any?, names: [Notification.Name?], queue: OperationQueue?, using: @escaping (Notification) -> Void){
        for name in names {
            NotificationCenter.default.addObserver(forName: name, object: object, queue: queue, using: using)
        }
    }
}

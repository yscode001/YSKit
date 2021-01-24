//
//  YSNotificationProtocol.swift
//  Alamofire
//
//  Created by yaoshuai on 2020/12/23.
//

import Foundation

/// 通知管理协议
public protocol YSNotificationProtocol: YSCoreProtocol{
    
    /// 通知名称
    var notificationName:String{ get }
}

// MARK: - 默认实现

public extension YSOriginalObjectProtocol where OriginalObjectType: YSNotificationProtocol{
    
    // MARK: - 静态方法发送监听通知(Notification)
    
    /// 发送通知(Notification)
    static func post(_ notification: Notification){
        NotificationCenter.default.post(notification)
    }
    
    /// 监听通知(NSNotification.Name)
    static func add(observer: Any, selector: Selector, notiNameList: [NSNotification.Name], object: Any?){
        for item in notiNameList{
            NotificationCenter.default.addObserver(observer, selector: selector, name: item, object: object)
        }
    }
    
    /// 监听自定义通知(notificationNameList)
    static func add(observer: Any, selector: Selector, notificationNameList: [OriginalObjectType], object: Any?){
        for item in notificationNameList{
            let name = NSNotification.Name(item.notificationName)
            NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
        }
    }
    
    // MARK: - 对象方法发送监听通知(notificationName)
    
    /// 发送自定义通知(notificationName)
    func post(){
        NotificationCenter.default.post(name: NSNotification.Name(originalObject.notificationName), object: nil)
    }
    
    /// 发送自定义通知(notificationName)
    func post(object: Any?, userInfo: [AnyHashable: Any]?){
        NotificationCenter.default.post(name: NSNotification.Name(originalObject.notificationName), object: object, userInfo: userInfo)
    }
    
    /// 监听自定义通知(notificationName)
    func add(observer: Any, selector: Selector, object: Any?){
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(originalObject.notificationName), object: object)
    }
}

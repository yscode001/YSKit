//
//  UNUserNotificationCenter+ext.swift
//  Pods
//
//  Created by yaoshuai on 2021/1/1.
//

import UIKit
import UserNotifications

public extension YSOriginalProtocol where OriginalType: UNUserNotificationCenter{
    
    /// 取消已预定的本地推送
    ///
    /// - Parameter identifiers: 本地推送标识符集合
    static func removeLocalNotifications(_ identifiers: [String]){
        if identifiers.isEmpty{
            return
        }
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    /// 预定本地推送
    static func pendingLocalNotification(identifier: String, title: String, body: String, userinfo: [String: Any], fireDate: Date){
        if title.ys.isEmptyOrWhiteSpace && body.ys.isEmptyOrWhiteSpace{
            return
        }
        
        let content = UNMutableNotificationContent()
        content.badge = NSNumber.init(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        content.sound = UNNotificationSound.default
        if !title.ys.isEmptyOrWhiteSpace{
            content.title = title
        }
        if !body.ys.isEmptyOrWhiteSpace{
            content.body = body
        }
        content.userInfo = userinfo
        
        var coms = DateComponents()
        coms.year = fireDate.ys.components().year!
        coms.month = fireDate.ys.components().month!
        coms.day = fireDate.ys.components().day!
        coms.hour = fireDate.ys.components().hour!
        coms.minute = fireDate.ys.components().minute!
        coms.second = fireDate.ys.components().second!
        let trigger = UNCalendarNotificationTrigger(dateMatching: coms, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

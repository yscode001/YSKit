//
//  NotificationName.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/19.
//

extension Notification.Name{
    
    /// 在其他设备上登录了，这里即将登出
    static let LoginOnOtherDevice: Notification.Name = Notification.Name("LoginOnOtherDevice")
    
    /// 应用在后台时点击了push
    static let ClickedPushInBackground: Notification.Name = Notification.Name("ClickedPushInBackground")
}

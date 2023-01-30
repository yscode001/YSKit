//
//  AppDelegate+noti.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/28.
//

extension AppDelegate{
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
       
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
}
extension AppDelegate:UNUserNotificationCenterDelegate{
    
}

//
//  AppDelegate+link.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/28.
//

extension AppDelegate{
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return true
    }
    // 1、URI scheme links(别的应用启动或打开此app)
    // 2、点击推送(app打开状态下)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return true
    }
    // 通用链接处理
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        return true
    }
}

//
//  AppDelegate.swift
//  YSKitProject
//
//  Created by 姚帅 on 2021/1/23.
//

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setup_didFinishLaunching(application, launchOptions)
        
        return true
    }
}
extension AppDelegate{
    func applicationWillResignActive(_ application: UIApplication) {
       
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
}

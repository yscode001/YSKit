//
//  AppDelegate+init.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/28.
//

extension AppDelegate{
    func setup_didFinishLaunching(_ application: UIApplication, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?){
        setupThirdLibrary(application, launchOptions)
        setupOthers(application, launchOptions)
        enterApp(application, launchOptions)
    }
    private func setupThirdLibrary(_ application: UIApplication, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?){
        Printer.enable(enable: AppCfg.enablePrintLog)
    }
    private func setupOthers(_ application: UIApplication, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?){
        
    }
    private func enterApp(_ application: UIApplication, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?){
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = TabC()
    }
}

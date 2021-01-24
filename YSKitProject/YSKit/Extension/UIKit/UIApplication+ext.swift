//
//  UIApplication+ext.swift
//  Alamofire
//
//  Created by yaoshuai on 2021/1/1.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType: UIApplication{
    
    static var lastWindow: UIWindow?{
        return UIApplication.shared.windows.last
    }
    
    static var keyWindow: UIWindow?{
        return UIApplication.shared.keyWindow
    }
    
    /// 切换根视图控制器
    ///
    /// - Parameter vc: 根视图控制器
    static func keyWindowSwitchRootVC(_ vc: UIViewController){
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    /// 操作系统语言
    static var osLanguage: String{
        return (UserDefaults.standard.array(forKey: "AppleLanguages")?.first as? String) ?? ""
    }
    
    /// 操作系统版本号
    static var osVersion: String{
        return UIDevice.current.systemVersion
    }
    
    /// app版本号
    static var appVersion: String{
        return (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    }
    
    /// app内部版本号
    static var appBulidVersion: String{
        return (Bundle.main.infoDictionary?["CFBundleVersion"]) as? String ?? ""
    }
    
    /// BundleID
    static var bundleIdentifier: String{
        return Bundle.main.bundleIdentifier ?? ""
    }
}

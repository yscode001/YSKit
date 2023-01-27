//
//  AppCfg.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

/// 应用配置
class AppCfg{
    
    private static var env: EnvEnum = .develop
    
    class var isDevelop: Bool { return env == .develop }
    class var isTest: Bool { return env == .test }
    class var isOnline: Bool { return env == .online }
}

extension AppCfg{
    
    /// 是否启用打印日志的功能
    static var enablePrintLog:Bool{ return isDevelop }
}

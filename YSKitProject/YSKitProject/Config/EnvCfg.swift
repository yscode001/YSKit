//
//  EnvCfg.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

/**
 说明：
 develop：供开发调试时使用
 test：供打测试包使用
 online：供打线上包使用
 */

/// 运行环境
enum EnvEnum {
    /// 开发
    case develop
    /// 测试包
    case test
    /// 线上包
    case online
}

class EnvCfg{
    
    private(set) static var env:EnvEnum = .develop
    class var isDevelop:Bool {return env == .develop}
    class var isTest:Bool {return env == .test}
    class var isOnline:Bool {return env == .online}
}

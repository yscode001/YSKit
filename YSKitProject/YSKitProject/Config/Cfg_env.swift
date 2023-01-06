//
//  Cgf_env.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

/**
 说明：
 debug：
 1、供开发调试时使用
 2、Printer.print会打印日志
 release：
 1、供打包时使用
 2、Printer.print不会打印日志
 */

/// 运行环境
enum Type_env {
    case debug
    case release
}

class Cfg_env{
    
    /// 运行环境
    class var env:Type_env{
        return .debug
    }
    
    /// 是否是debug环境
    class var isDebug:Bool{
        return env == .debug
    }
    
    /// 是否是release环境
    class var isRelease:Bool{
        return env == .release
    }
}

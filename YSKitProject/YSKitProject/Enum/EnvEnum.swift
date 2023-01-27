//
//  EnvEnum.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/27.
//

/**
 说明：
 develop：供开发调试时使用
 test：供打测试包使用
 online：供打线上包使用
 */

/// 运行环境
enum EnvEnum {
    
    /// 开发调试时使用
    case develop
    
    /// 打测试包时使用
    case test
    
    /// 打线上包时使用
    case online
}

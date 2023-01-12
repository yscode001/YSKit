//
//  NetworkServerCode.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation

/// 服务器给的常见码
enum NetworkServerCode: Int {
    
    /// 一切正常
    case correct = 1000
    
    /// 余额不足
    case insufficient = 1008
    
    /// 送的礼物过大，弹出礼物安全锁
    case giftlock = 1302
    
    /// 账号过期，需要重新登录
    case signIn = 1004
    
    /// 登录时账号或密码不正确
    case loginError = 1001
}

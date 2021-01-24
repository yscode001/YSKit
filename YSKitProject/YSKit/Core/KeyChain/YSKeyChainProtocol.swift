//
//  YSKeyChainProtocol.swift
//  Alamofire
//
//  Created by yaoshuai on 2020/12/23.
//

import Foundation

/// 钥匙串管理协议
public protocol YSKeyChainProtocol: YSCoreProtocol{
    
    // MARK: - Property
    
    var service: String{ get }
    
    var account: String{ get }
    
    /// 是否设置过当前account
    var existCurrentAccount: Bool{ get }
    
    // MARK: - Method
    
    /// 设置值
    func set(value: String)
    
    /// 获取设置的值
    func getValue() -> String?
    
    /// 删除
    func delete()
}

//
//  KeyChain.swift
//  YSVendor
//
//  Created by 姚帅 on 2023/1/20.
//

import SAMKeychain

/// 钥匙串管理工具
public class KeyChain{
    
    private static let service = "YSKeyChainService"
    
    /// 钥匙串账号
    public struct Account : Hashable, Equatable, RawRepresentable, @unchecked Sendable {
        
        public var rawValue: String
        
        public init(_ rawValue: String){
            self.rawValue = "\(KeyChain.service)_\(rawValue)"
        }
        
        public init(rawValue: String){
            self.rawValue = "\(KeyChain.service)_\(rawValue)"
        }
    }
}

public extension KeyChain{
    
    /// 获取钥匙串的值
    /// - Parameter account: 账号
    /// - Returns: 对应账号的值
    class func getValue(account: KeyChain.Account) -> String?{
        return SAMKeychain.password(forService: service, account: account.rawValue)
    }
    
    /// 获取钥匙串的值
    /// - Parameters:
    ///   - account: 账号
    ///   - value: 默认空字符串
    /// - Returns: 对应账号的值
    class func getValue(account: KeyChain.Account, default value: String = "") -> String{
        return SAMKeychain.password(forService: service, account: account.rawValue) ?? value
    }
    
    /// 设置钥匙串的值
    /// - Parameters:
    ///   - account: 账号
    ///   - value: 对应账号的值
    class func setValue(account: KeyChain.Account, value: String){
        SAMKeychain.setPassword(value, forService: service, account: account.rawValue)
    }
    
    /// 删除钥匙串
    /// - Parameter account: 账号
    class func delete(account: KeyChain.Account){
        SAMKeychain.deletePassword(forService: service, account: account.rawValue)
    }
    
    /// 钥匙串账号对应的值是否存在
    /// - Parameter account: 账号
    /// - Returns: 此账号对应的值是否存在
    class func exist(account: KeyChain.Account) -> Bool{
        if let pwd = getValue(account: account), !pwd.ys.isEmptyOrWhiteSpace{
            return true
        }
        return false
    }
}

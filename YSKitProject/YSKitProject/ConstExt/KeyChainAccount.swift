//
//  KeyChainAccount.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/19.
//

extension KeyChain.Account{
    
    /// 设备ID
    static let DeviceID: KeyChain.Account = KeyChain.Account("DeviceID")
    
    /// App的第一次安装时间
    static let FirstInstallDateTime: KeyChain.Account = KeyChain.Account("FirstInstallDateTime")
}

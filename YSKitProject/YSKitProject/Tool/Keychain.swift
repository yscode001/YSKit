//
//  Keychain.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/19.
//

import SAMKeychain

enum KeychainAccount:String {
    
    case deviceID = "YSKitKeyChainService_deviceID"
}

class Keychina{
    
    private static let service = "YSKitKeyChainService"
    
    class func getValue(account: KeychainAccount) -> String?{
        return SAMKeychain.password(forService: service, account: account.rawValue)
    }
    
    class func setValue(account: KeychainAccount, value: String){
        SAMKeychain.setPassword(value, forService: service, account: account.rawValue)
    }
    
    class func delete(account: KeychainAccount){
        SAMKeychain.deletePassword(forService: service, account: account.rawValue)
    }
    
    class func exist(account: KeychainAccount) -> Bool{
        if let pwd = getValue(account: account), !pwd.ys.isEmptyOrWhiteSpace{
            return true
        }
        return false
    }
}

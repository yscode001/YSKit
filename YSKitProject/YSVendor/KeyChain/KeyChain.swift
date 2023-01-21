//
//  KeyChain.swift
//  Alamofire
//
//  Created by 姚帅 on 2023/1/20.
//

import SAMKeychain

public class KeyChain{
    
    private static let service = "YSKeyChainService"
    
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
    
    class func getValue(account: KeyChain.Account) -> String?{
        return SAMKeychain.password(forService: service, account: account.rawValue)
    }
    
    class func setValue(account: KeyChain.Account, value: String){
        SAMKeychain.setPassword(value, forService: service, account: account.rawValue)
    }
    
    class func delete(account: KeyChain.Account){
        SAMKeychain.deletePassword(forService: service, account: account.rawValue)
    }
    
    class func exist(account: KeyChain.Account) -> Bool{
        if let pwd = getValue(account: account), !pwd.ys.isEmptyOrWhiteSpace{
            return true
        }
        return false
    }
}

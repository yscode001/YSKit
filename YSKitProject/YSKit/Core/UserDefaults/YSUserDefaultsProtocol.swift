//
//  YSUserDefaultsProtocol.swift
//  Alamofire
//
//  Created by yaoshuai on 2020/12/23.
//

import Foundation

/// 用户偏好设置管理协议
public protocol YSUserDefaultsProtocol: YSCoreProtocol{
    
    /// 偏好设置的key
    var userDefaultKey:String{ get }
}

// MARK: - 赋值

public extension YSOriginalProtocol where OriginalType: YSUserDefaultsProtocol{
    
    /// 当前key是否赋过值
    var existCurrentKey: Bool{
        return UserDefaults.standard.object(forKey: originalObj.userDefaultKey) != nil
    }
    
    func set(_ value: Any){
        UserDefaults.standard.set(value, forKey: originalObj.userDefaultKey)
    }
    
    func set(_ value: URL){
        UserDefaults.standard.set(value, forKey: originalObj.userDefaultKey)
    }
    
    func set(_ value: String){
        UserDefaults.standard.set(value, forKey: originalObj.userDefaultKey)
    }
    
    func set(_ value: Int){
        UserDefaults.standard.set(value, forKey: originalObj.userDefaultKey)
    }
    
    func set(_ value: Float){
        UserDefaults.standard.set(value, forKey: originalObj.userDefaultKey)
    }
    
    func set(_ value: Double){
        UserDefaults.standard.set(value, forKey: originalObj.userDefaultKey)
    }
    
    func set(_ value: Bool){
        UserDefaults.standard.set(value, forKey: originalObj.userDefaultKey)
    }
}

// MARK: - Get可选

public extension YSOriginalProtocol where OriginalType: YSUserDefaultsProtocol{
    
    func getData() -> Data?{
        return UserDefaults.standard.data(forKey: originalObj.userDefaultKey)
    }
    
    func getData(default value: Data) -> Data{
        return UserDefaults.standard.data(forKey: originalObj.userDefaultKey) ?? value
    }
    
    func getAny() -> Any?{
        return UserDefaults.standard.value(forKey: originalObj.userDefaultKey)
    }
    
    func getAny(default value: Any) -> Any{
        return UserDefaults.standard.value(forKey: originalObj.userDefaultKey) ?? value
    }
    
    func getArray() -> [Any]?{
        return UserDefaults.standard.array(forKey: originalObj.userDefaultKey)
    }
    
    func getArray(default value: [Any]) -> [Any]{
        return UserDefaults.standard.array(forKey: originalObj.userDefaultKey) ?? value
    }
    
    func getDictionary() -> [String: Any]?{
        return UserDefaults.standard.dictionary(forKey: originalObj.userDefaultKey)
    }
    
    func getDictionary(default value: [String: Any]) -> [String: Any] {
        return UserDefaults.standard.dictionary(forKey: originalObj.userDefaultKey) ?? value
    }
    
    func getObject() -> Any?{
        return UserDefaults.standard.object(forKey: originalObj.userDefaultKey)
    }
    
    func getObject(default value: Any) -> Any{
        return UserDefaults.standard.object(forKey: originalObj.userDefaultKey) ?? value
    }
    
    func getStringArray() -> [String]?{
        return UserDefaults.standard.stringArray(forKey: originalObj.userDefaultKey)
    }
    
    func getStringArray(default value: [String]) -> [String]{
        return UserDefaults.standard.stringArray(forKey: originalObj.userDefaultKey) ?? value
    }
    
    func getUrl() -> URL?{
        return UserDefaults.standard.url(forKey: originalObj.userDefaultKey)
    }
    
    func getUrl(default value: URL) -> URL{
        return UserDefaults.standard.url(forKey: originalObj.userDefaultKey) ?? value
    }
    
    func getString() -> String?{
        return UserDefaults.standard.string(forKey: originalObj.userDefaultKey)
    }
    
    func getString(default value: String) -> String{
        return UserDefaults.standard.string(forKey: originalObj.userDefaultKey) ?? value
    }
}

// MARK: - Get必选

public extension YSOriginalProtocol where OriginalType: YSUserDefaultsProtocol{
    
    func getBool(default value: Bool = false) -> Bool{
        if existCurrentKey{
            return UserDefaults.standard.bool(forKey: originalObj.userDefaultKey)
        }
        return value
    }
    
    func getInteger(default value: Int = 0) -> Int{
        if existCurrentKey{
            return UserDefaults.standard.integer(forKey: originalObj.userDefaultKey)
        }
        return value
    }
    
    func getFloat(default value: Float = 0) -> Float{
        if existCurrentKey{
            return UserDefaults.standard.float(forKey: originalObj.userDefaultKey)
        }
        return value
    }
    
    func getDouble(default value: Double = 0) -> Double{
        if existCurrentKey{
            return UserDefaults.standard.double(forKey: originalObj.userDefaultKey)
        }
        return value
    }
}

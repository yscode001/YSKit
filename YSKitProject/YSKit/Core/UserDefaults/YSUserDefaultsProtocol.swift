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
    
    func getData(default defaultValue: Data) -> Data{
        return UserDefaults.standard.data(forKey: originalObj.userDefaultKey) ?? defaultValue
    }
    
    func getAny() -> Any?{
        return UserDefaults.standard.value(forKey: originalObj.userDefaultKey)
    }
    
    func getAny(default defaultValue: Any) -> Any{
        return UserDefaults.standard.value(forKey: originalObj.userDefaultKey) ?? defaultValue
    }
    
    func getArray() -> [Any]?{
        return UserDefaults.standard.array(forKey: originalObj.userDefaultKey)
    }
    
    func getArray(default defaultValue: [Any]) -> [Any]{
        return UserDefaults.standard.array(forKey: originalObj.userDefaultKey) ?? defaultValue
    }
    
    func getDictionary() -> [String: Any]?{
        return UserDefaults.standard.dictionary(forKey: originalObj.userDefaultKey)
    }
    
    func getDictionary(default defaultValue: [String: Any]) -> [String: Any] {
        return UserDefaults.standard.dictionary(forKey: originalObj.userDefaultKey) ?? defaultValue
    }
    
    func getObject() -> Any?{
        return UserDefaults.standard.object(forKey: originalObj.userDefaultKey)
    }
    
    func getObject(default defaultValue: Any) -> Any{
        return UserDefaults.standard.object(forKey: originalObj.userDefaultKey) ?? defaultValue
    }
    
    func getStringArray() -> [String]?{
        return UserDefaults.standard.stringArray(forKey: originalObj.userDefaultKey)
    }
    
    func getStringArray(default defaultValue: [String]) -> [String]{
        return UserDefaults.standard.stringArray(forKey: originalObj.userDefaultKey) ?? defaultValue
    }
    
    func getUrl() -> URL?{
        return UserDefaults.standard.url(forKey: originalObj.userDefaultKey)
    }
    
    func getUrl(default defaultValue: URL) -> URL{
        return UserDefaults.standard.url(forKey: originalObj.userDefaultKey) ?? defaultValue
    }
    
    func getString() -> String?{
        return UserDefaults.standard.string(forKey: originalObj.userDefaultKey)
    }
    
    func getString(default defaultValue: String) -> String{
        return UserDefaults.standard.string(forKey: originalObj.userDefaultKey) ?? defaultValue
    }
}

// MARK: - Get必选

public extension YSOriginalProtocol where OriginalType: YSUserDefaultsProtocol{
    
    func getBool() -> Bool{
        return UserDefaults.standard.bool(forKey: originalObj.userDefaultKey)
    }
    
    func getBool(default defaultValue: Bool) -> Bool{
        if existCurrentKey{
            return UserDefaults.standard.bool(forKey: originalObj.userDefaultKey)
        }
        return defaultValue
    }
    
    func getInteger() -> Int{
        return UserDefaults.standard.integer(forKey: originalObj.userDefaultKey)
    }
    
    func getInteger(default defaultValue: Int) -> Int{
        if existCurrentKey{
            return UserDefaults.standard.integer(forKey: originalObj.userDefaultKey)
        }
        return defaultValue
    }
    
    func getFloat() -> Float{
        return UserDefaults.standard.float(forKey: originalObj.userDefaultKey)
    }
    
    func getFloat(default defaultValue: Float) -> Float{
        if existCurrentKey{
            return UserDefaults.standard.float(forKey: originalObj.userDefaultKey)
        }
        return defaultValue
    }
    
    func getDouble() -> Double{
        return UserDefaults.standard.double(forKey: originalObj.userDefaultKey)
    }
    
    func getDouble(default defaultValue: Double) -> Double{
        if existCurrentKey{
            return UserDefaults.standard.double(forKey: originalObj.userDefaultKey)
        }
        return defaultValue
    }
}

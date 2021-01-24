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

public extension YSOriginalObjectProtocol where OriginalObjectType: YSUserDefaultsProtocol{
    
    /// 当前key是否赋过值
    var existCurrentKey: Bool{
        return UserDefaults.standard.object(forKey: originalObject.userDefaultKey) != nil
    }
    
    func set(_ value: Any){
        UserDefaults.standard.set(value, forKey: originalObject.userDefaultKey)
    }
    
    func set(_ value: URL){
        UserDefaults.standard.set(value, forKey: originalObject.userDefaultKey)
    }
    
    func set(_ value: String){
        UserDefaults.standard.set(value, forKey: originalObject.userDefaultKey)
    }
    
    func set(_ value: Int){
        UserDefaults.standard.set(value, forKey: originalObject.userDefaultKey)
    }
    
    func set(_ value: Float){
        UserDefaults.standard.set(value, forKey: originalObject.userDefaultKey)
    }
    
    func set(_ value: Double){
        UserDefaults.standard.set(value, forKey: originalObject.userDefaultKey)
    }
    
    func set(_ value: Bool){
        UserDefaults.standard.set(value, forKey: originalObject.userDefaultKey)
    }
}

// MARK: - Get可选

public extension YSOriginalObjectProtocol where OriginalObjectType: YSUserDefaultsProtocol{
    
    func getData() -> Data?{
        return UserDefaults.standard.data(forKey: originalObject.userDefaultKey)
    }
    
    func getData(default defaultValue: Data) -> Data{
        return UserDefaults.standard.data(forKey: originalObject.userDefaultKey) ?? defaultValue
    }
    
    func getAny() -> Any?{
        return UserDefaults.standard.value(forKey: originalObject.userDefaultKey)
    }
    
    func getAny(default defaultValue: Any) -> Any{
        return UserDefaults.standard.value(forKey: originalObject.userDefaultKey) ?? defaultValue
    }
    
    func getArray() -> [Any]?{
        return UserDefaults.standard.array(forKey: originalObject.userDefaultKey)
    }
    
    func getArray(default defaultValue: [Any]) -> [Any]{
        return UserDefaults.standard.array(forKey: originalObject.userDefaultKey) ?? defaultValue
    }
    
    func getDictionary() -> [String: Any]?{
        return UserDefaults.standard.dictionary(forKey: originalObject.userDefaultKey)
    }
    
    func getDictionary(default defaultValue: [String: Any]) -> [String: Any] {
        return UserDefaults.standard.dictionary(forKey: originalObject.userDefaultKey) ?? defaultValue
    }
    
    func getObject() -> Any?{
        return UserDefaults.standard.object(forKey: originalObject.userDefaultKey)
    }
    
    func getObject(default defaultValue: Any) -> Any{
        return UserDefaults.standard.object(forKey: originalObject.userDefaultKey) ?? defaultValue
    }
    
    func getStringArray() -> [String]?{
        return UserDefaults.standard.stringArray(forKey: originalObject.userDefaultKey)
    }
    
    func getStringArray(default defaultValue: [String]) -> [String]{
        return UserDefaults.standard.stringArray(forKey: originalObject.userDefaultKey) ?? defaultValue
    }
    
    func getUrl() -> URL?{
        return UserDefaults.standard.url(forKey: originalObject.userDefaultKey)
    }
    
    func getUrl(default defaultValue: URL) -> URL{
        return UserDefaults.standard.url(forKey: originalObject.userDefaultKey) ?? defaultValue
    }
    
    func getString() -> String?{
        return UserDefaults.standard.string(forKey: originalObject.userDefaultKey)
    }
    
    func getString(default defaultValue: String) -> String{
        return UserDefaults.standard.string(forKey: originalObject.userDefaultKey) ?? defaultValue
    }
}

// MARK: - Get必选

public extension YSOriginalObjectProtocol where OriginalObjectType: YSUserDefaultsProtocol{
    
    func getBool() -> Bool{
        return UserDefaults.standard.bool(forKey: originalObject.userDefaultKey)
    }
    
    func getBool(default defaultValue: Bool) -> Bool{
        if existCurrentKey{
            return UserDefaults.standard.bool(forKey: originalObject.userDefaultKey)
        }
        return defaultValue
    }
    
    func getInteger() -> Int{
        return UserDefaults.standard.integer(forKey: originalObject.userDefaultKey)
    }
    
    func getInteger(default defaultValue: Int) -> Int{
        if existCurrentKey{
            return UserDefaults.standard.integer(forKey: originalObject.userDefaultKey)
        }
        return defaultValue
    }
    
    func getFloat() -> Float{
        return UserDefaults.standard.float(forKey: originalObject.userDefaultKey)
    }
    
    func getFloat(default defaultValue: Float) -> Float{
        if existCurrentKey{
            return UserDefaults.standard.float(forKey: originalObject.userDefaultKey)
        }
        return defaultValue
    }
    
    func getDouble() -> Double{
        return UserDefaults.standard.double(forKey: originalObject.userDefaultKey)
    }
    
    func getDouble(default defaultValue: Double) -> Double{
        if existCurrentKey{
            return UserDefaults.standard.double(forKey: originalObject.userDefaultKey)
        }
        return defaultValue
    }
}

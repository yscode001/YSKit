//
//  UserDefaultsTool.swift
//  YSKit
//
//  Created by 姚帅 on 2023/1/20.
//

public class UserDefaultsTool{
    
    private static let Prefix: String = "YSUserDefaults"
    
    public struct Key : Hashable, Equatable, RawRepresentable, @unchecked Sendable {
        
        public var rawValue: String
        
        public init(_ rawValue: String){
            self.rawValue = "\(UserDefaultsTool.Prefix)_\(rawValue)"
        }
        
        public init(rawValue: String){
            self.rawValue = "\(UserDefaultsTool.Prefix)_\(rawValue)"
        }
    }
}
public extension UserDefaultsTool.Key{
    static let CurrentUserID: UserDefaultsTool.Key = UserDefaultsTool.Key("CurrentUserID")
}

// MARK: - 判断是否存在key值
public extension UserDefaultsTool{
    
    static func exist(key: UserDefaultsTool.Key) -> Bool{
        return UserDefaults.standard.object(forKey: key.rawValue) != nil
    }
}

// MARK: - 设置值
public extension UserDefaultsTool{
    
    static func set(_ value: Any, forKey: UserDefaultsTool.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
    
    static func set(_ value: URL, forKey: UserDefaultsTool.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
    
    static func set(_ value: String, forKey: UserDefaultsTool.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
    
    static func set(_ value: Int, forKey: UserDefaultsTool.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
    
    static func set(_ value: Float, forKey: UserDefaultsTool.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
    
    static func set(_ value: Double, forKey: UserDefaultsTool.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
    
    static func set(_ value: Bool, forKey: UserDefaultsTool.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
}

// MARK: - 移除值
public extension UserDefaultsTool{
    
    static func removeObject(forkey: UserDefaultsTool.Key){
        UserDefaults.standard.removeObject(forKey: forkey.rawValue)
    }
}

// MARK: - Get必选
public extension UserDefaultsTool{
    
   static func getBool(forKey: UserDefaultsTool.Key, default value: Bool = false) -> Bool{
        if exist(key: forKey){
            return UserDefaults.standard.bool(forKey: forKey.rawValue)
        }
        return value
    }
    
    static func getInteger(forKey: UserDefaultsTool.Key, default value: Int = 0) -> Int{
        if exist(key: forKey){
            return UserDefaults.standard.integer(forKey: forKey.rawValue)
        }
        return value
    }
    
    static func getFloat(forKey: UserDefaultsTool.Key, default value: Float = 0) -> Float{
        if exist(key: forKey){
            return UserDefaults.standard.float(forKey: forKey.rawValue)
        }
        return value
    }
    
    static func getDouble(forKey: UserDefaultsTool.Key, default value: Double = 0) -> Double{
        if exist(key: forKey){
            return UserDefaults.standard.double(forKey: forKey.rawValue)
        }
        return value
    }
}

// MARK: - Get可选
public extension UserDefaultsTool{
    
    static func getData(forKey: UserDefaultsTool.Key) -> Data?{
        return UserDefaults.standard.data(forKey: forKey.rawValue)
    }
    
    static func getData(forKey: UserDefaultsTool.Key, default value: Data) -> Data{
        return UserDefaults.standard.data(forKey: forKey.rawValue) ?? value
    }
    
    static func getAny(forKey: UserDefaultsTool.Key) -> Any?{
        return UserDefaults.standard.value(forKey: forKey.rawValue)
    }
    
    static func getAny(forKey: UserDefaultsTool.Key, default value: Any) -> Any{
        return UserDefaults.standard.value(forKey: forKey.rawValue) ?? value
    }
    
    static func getArray(forKey: UserDefaultsTool.Key) -> [Any]?{
        return UserDefaults.standard.array(forKey: forKey.rawValue)
    }
    
    static func getArray(forKey: UserDefaultsTool.Key, default value: [Any] = []) -> [Any]{
        return UserDefaults.standard.array(forKey: forKey.rawValue) ?? value
    }
    
    static func getDictionary(forKey: UserDefaultsTool.Key) -> [String: Any]?{
        return UserDefaults.standard.dictionary(forKey: forKey.rawValue)
    }
    
    static func getDictionary(forKey: UserDefaultsTool.Key, default value: [String: Any] = [:]) -> [String: Any] {
        return UserDefaults.standard.dictionary(forKey: forKey.rawValue) ?? value
    }
    
    static func getObject(forKey: UserDefaultsTool.Key) -> Any?{
        return UserDefaults.standard.object(forKey: forKey.rawValue)
    }
    
    static func getObject(forKey: UserDefaultsTool.Key, default value: Any) -> Any{
        return UserDefaults.standard.object(forKey: forKey.rawValue) ?? value
    }
    
    static func getStringArray(forKey: UserDefaultsTool.Key) -> [String]?{
        return UserDefaults.standard.stringArray(forKey: forKey.rawValue)
    }
    
    static func getStringArray(forKey: UserDefaultsTool.Key, default value: [String] = []) -> [String]{
        return UserDefaults.standard.stringArray(forKey: forKey.rawValue) ?? value
    }
    
    static func getUrl(forKey: UserDefaultsTool.Key) -> URL?{
        return UserDefaults.standard.url(forKey: forKey.rawValue)
    }
    
    static func getUrl(forKey: UserDefaultsTool.Key, default value: URL) -> URL{
        return UserDefaults.standard.url(forKey: forKey.rawValue) ?? value
    }
    
    static func getString(forKey: UserDefaultsTool.Key) -> String?{
        return UserDefaults.standard.string(forKey: forKey.rawValue)
    }
    
    static func getString(forKey: UserDefaultsTool.Key, default value: String = "") -> String{
        return UserDefaults.standard.string(forKey: forKey.rawValue) ?? value
    }
}

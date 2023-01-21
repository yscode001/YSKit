//
//  UserDefaults+ext.swift
//  YSKit
//
//  Created by 姚帅 on 2023/1/20.
//

public extension UserDefaults{
    
    private static let Prefix: String = "YSUserDefaults"
    
    struct Key : Hashable, Equatable, RawRepresentable, @unchecked Sendable {
        
        public var rawValue: String
        
        public init(_ rawValue: String){
            self.rawValue = "\(UserDefaults.Prefix)_\(rawValue)"
        }
        
        public init(rawValue: String){
            self.rawValue = "\(UserDefaults.Prefix)_\(rawValue)"
        }
    }
}

// MARK: - 判断是否存在key值
public extension YSOriginalProtocol where OriginalType: UserDefaults{
    
    static func exist(key: UserDefaults.Key) -> Bool{
        return UserDefaults.standard.object(forKey: key.rawValue) != nil
    }
}

// MARK: - 设置值
public extension YSOriginalProtocol where OriginalType: UserDefaults{
    
    static func set(_ value: Any, forKey: UserDefaults.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
    
    static func set(_ value: URL, forKey: UserDefaults.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
    
    static func set(_ value: String, forKey: UserDefaults.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
    
    static func set(_ value: Int, forKey: UserDefaults.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
    
    static func set(_ value: Float, forKey: UserDefaults.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
    
    static func set(_ value: Double, forKey: UserDefaults.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
    
    static func set(_ value: Bool, forKey: UserDefaults.Key){
        UserDefaults.standard.set(value, forKey: forKey.rawValue)
    }
}

// MARK: - 移除值
public extension YSOriginalProtocol where OriginalType: UserDefaults{
    
    static func removeObject(forkey: UserDefaults.Key){
        UserDefaults.standard.removeObject(forKey: forkey.rawValue)
    }
}

// MARK: - Get必选
public extension YSOriginalProtocol where OriginalType: UserDefaults{
    
   static func getBool(forKey: UserDefaults.Key, default value: Bool = false) -> Bool{
        if exist(key: forKey){
            return UserDefaults.standard.bool(forKey: forKey.rawValue)
        }
        return value
    }
    
    static func getInteger(forKey: UserDefaults.Key, default value: Int = 0) -> Int{
        if exist(key: forKey){
            return UserDefaults.standard.integer(forKey: forKey.rawValue)
        }
        return value
    }
    
    static func getFloat(forKey: UserDefaults.Key, default value: Float = 0) -> Float{
        if exist(key: forKey){
            return UserDefaults.standard.float(forKey: forKey.rawValue)
        }
        return value
    }
    
    static func getDouble(forKey: UserDefaults.Key, default value: Double = 0) -> Double{
        if exist(key: forKey){
            return UserDefaults.standard.double(forKey: forKey.rawValue)
        }
        return value
    }
}

// MARK: - Get可选
public extension YSOriginalProtocol where OriginalType: UserDefaults{
    
    static func getData(forKey: UserDefaults.Key) -> Data?{
        return UserDefaults.standard.data(forKey: forKey.rawValue)
    }
    
    static func getData(forKey: UserDefaults.Key, default value: Data) -> Data{
        return UserDefaults.standard.data(forKey: forKey.rawValue) ?? value
    }
    
    static func getAny(forKey: UserDefaults.Key) -> Any?{
        return UserDefaults.standard.value(forKey: forKey.rawValue)
    }
    
    static func getAny(forKey: UserDefaults.Key, default value: Any) -> Any{
        return UserDefaults.standard.value(forKey: forKey.rawValue) ?? value
    }
    
    static func getArray(forKey: UserDefaults.Key) -> [Any]?{
        return UserDefaults.standard.array(forKey: forKey.rawValue)
    }
    
    static func getArray(forKey: UserDefaults.Key, default value: [Any] = []) -> [Any]{
        return UserDefaults.standard.array(forKey: forKey.rawValue) ?? value
    }
    
    static func getDictionary(forKey: UserDefaults.Key) -> [String: Any]?{
        return UserDefaults.standard.dictionary(forKey: forKey.rawValue)
    }
    
    static func getDictionary(forKey: UserDefaults.Key, default value: [String: Any] = [:]) -> [String: Any] {
        return UserDefaults.standard.dictionary(forKey: forKey.rawValue) ?? value
    }
    
    static func getObject(forKey: UserDefaults.Key) -> Any?{
        return UserDefaults.standard.object(forKey: forKey.rawValue)
    }
    
    static func getObject(forKey: UserDefaults.Key, default value: Any) -> Any{
        return UserDefaults.standard.object(forKey: forKey.rawValue) ?? value
    }
    
    static func getStringArray(forKey: UserDefaults.Key) -> [String]?{
        return UserDefaults.standard.stringArray(forKey: forKey.rawValue)
    }
    
    static func getStringArray(forKey: UserDefaults.Key, default value: [String] = []) -> [String]{
        return UserDefaults.standard.stringArray(forKey: forKey.rawValue) ?? value
    }
    
    static func getUrl(forKey: UserDefaults.Key) -> URL?{
        return UserDefaults.standard.url(forKey: forKey.rawValue)
    }
    
    static func getUrl(forKey: UserDefaults.Key, default value: URL) -> URL{
        return UserDefaults.standard.url(forKey: forKey.rawValue) ?? value
    }
    
    static func getString(forKey: UserDefaults.Key) -> String?{
        return UserDefaults.standard.string(forKey: forKey.rawValue)
    }
    
    static func getString(forKey: UserDefaults.Key, default value: String = "") -> String{
        return UserDefaults.standard.string(forKey: forKey.rawValue) ?? value
    }
}

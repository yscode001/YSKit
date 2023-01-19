//
//  NSCoder+ext.swift
//  YSKit
//
//  Created by 姚帅 on 2023/1/16.
//

public extension YSOriginalProtocol where OriginalType: NSCoder{
    
    func decodeCInt(forKey key: String, default value: CInt = 0) -> CInt{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeCInt(forKey: key)
        }
        return value
    }
    
    func decodeCIntOptional(forKey key: String) -> CInt?{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeCInt(forKey: key)
        }
        return nil
    }
    
    func decodeInt32(forKey key: String, default value: Int32 = 0) -> Int32{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeInt32(forKey: key)
        }
        return value
    }
    
    func decodeInt32Optional(forKey key: String) -> Int32?{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeInt32(forKey: key)
        }
        return nil
    }
    
    func decodeInt64(forKey key: String, default value: Int64 = 0) -> Int64{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeInt64(forKey: key)
        }
        return value
    }
    
    func decodeInt64Optional(forKey key: String) -> Int64?{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeInt64(forKey: key)
        }
        return nil
    }
    
    func decodeInteger(forKey key: String, default value: Int = 0) -> Int{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeInteger(forKey: key)
        }
        return value
    }
    
    func decodeIntegerOptional(forKey key: String) -> Int?{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeInteger(forKey: key)
        }
        return nil
    }
    
    func decodeFloat(forKey key: String, default value: Float = 0) -> Float{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeFloat(forKey: key)
        }
        return value
    }
    
    func decodeFloatOptional(forKey key: String) -> Float?{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeFloat(forKey: key)
        }
        return nil
    }
    
    func decodeDouble(forKey key: String, default value: Double = 0) -> Double{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeDouble(forKey: key)
        }
        return value
    }
    
    func decodeDoubleOptional(forKey key: String) -> Double?{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeDouble(forKey: key)
        }
        return nil
    }
    
    func decodeBool(forKey key: String, default value: Bool = false) -> Bool{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeBool(forKey: key)
        }
        return value
    }
    
    func decodeBoolOptional(forKey key: String) -> Bool?{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeBool(forKey: key)
        }
        return nil
    }
    
    func decodeString(forKey key: String, default value: String = "") -> String{
        if originalObj.containsValue(forKey: key){
            return (originalObj.decodeObject(of: NSString.self, forKey: key) as? String) ?? value
        }
        return value
    }
    
    func decodeStringOptional(forKey key: String) -> String?{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeObject(of: NSString.self, forKey: key) as? String
        }
        return nil
    }
    
    func decodeNSString(forKey key: String, default value: NSString = "") -> NSString{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeObject(of: NSString.self, forKey: key) ?? value
        }
        return value
    }
    
    func decodeNSStringOptional(forKey key: String) -> NSString?{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeObject(of: NSString.self, forKey: key)
        }
        return nil
    }
}

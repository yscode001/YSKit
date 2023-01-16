//
//  NSCoder+ext.swift
//  YSKit
//
//  Created by 姚帅 on 2023/1/16.
//

public extension YSOriginalProtocol where OriginalType: NSCoder{
    
    func decodeString(forKey key: String) -> String{
        if originalObj.containsValue(forKey: key){
            return (originalObj.decodeObject(forKey: key) as? String) ?? ""
        } else{
            return ""
        }
    }
    
    func decodeBool(forKey key: String) -> Bool{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeBool(forKey: key)
        } else{
            return false
        }
    }
    
    func decodeCInt(forKey key: String) -> Int32{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeCInt(forKey: key)
        } else{
            return 0
        }
    }
    
    func decodeInt32(forKey key: String) -> Int32{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeInt32(forKey: key)
        } else{
            return 0
        }
    }
    
    func decodeInt64(forKey key: String) -> Int64{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeInt64(forKey: key)
        } else{
            return 0
        }
    }
    
    func decodeFloat(forKey key: String) -> Float{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeFloat(forKey: key)
        } else{
            return 0
        }
    }
    
    func decodeDouble(forKey key: String) -> Double{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeDouble(forKey: key)
        } else{
            return 0
        }
    }
    
    func decodeInteger(forKey key: String) -> Int{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeInteger(forKey: key)
        } else{
            return 0
        }
    }
}

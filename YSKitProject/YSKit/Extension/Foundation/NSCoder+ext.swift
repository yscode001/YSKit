//
//  NSCoder+ext.swift
//  YSKit
//
//  Created by 姚帅 on 2023/1/16.
//

public extension YSOriginalProtocol where OriginalType: NSCoder{
    
    func decodeString(forKey key: String, `default` value: String = "") -> String{
        if originalObj.containsValue(forKey: key){
            return (originalObj.decodeObject(forKey: key) as? String) ?? value
        } else{
            return value
        }
    }
    
    func decodeBool(forKey key: String, `default` value: Bool = false) -> Bool{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeBool(forKey: key)
        } else{
            return value
        }
    }
    
    func decodeCInt(forKey key: String, `default` value: CInt = 0) -> CInt{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeCInt(forKey: key)
        } else{
            return value
        }
    }
    
    func decodeInt32(forKey key: String, `default` value: Int32 = 0) -> Int32{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeInt32(forKey: key)
        } else{
            return value
        }
    }
    
    func decodeInt64(forKey key: String, `default` value: Int64 = 0) -> Int64{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeInt64(forKey: key)
        } else{
            return value
        }
    }
    
    func decodeFloat(forKey key: String, `default` value: Float = 0) -> Float{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeFloat(forKey: key)
        } else{
            return value
        }
    }
    
    func decodeDouble(forKey key: String, `default` value: Double = 0) -> Double{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeDouble(forKey: key)
        } else{
            return value
        }
    }
    
    func decodeInteger(forKey key: String, `default` value: Int = 0) -> Int{
        if originalObj.containsValue(forKey: key){
            return originalObj.decodeInteger(forKey: key)
        } else{
            return value
        }
    }
}

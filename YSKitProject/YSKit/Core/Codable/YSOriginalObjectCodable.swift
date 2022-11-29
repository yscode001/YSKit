//
//  YSOriginalObjectCodable.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/20.
//

/*
 注意：(以下错误情况适用于var修饰属性，let不会报错)
 1、json提供的数据，key相对于模型的必选属性，只能多，不能少，否则会转换失败(返回nil)
 
 2、如果json中key对应的value为null,但对象属性必选，转换失败(返回nil)
 
 3、如果json中key少、或key与对象属性名不一致，使用以下代码解决
 
 枚举里面是要进行解编码的属性，如果json的key缺失，可以不把对象相关必选属性加进去
 enum CodingKeys: String, CodingKey {
 case name
 case age
 case address = "userAddress" // address为对象属性名，userAddress为json的key
 }
 */

import Foundation

extension YSOriginalProtocol where OriginalType: Codable{
    
    // MARK: - 序列化
    
    // 序列化
    public func serialize() -> Data?{
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try? JSONEncoder().encode(originalObj)
    }
    
    // MARK: - 反序列化 -> 对象
    
    /// 反序列化(data -> object)
    public static func deserialize(data: Data) -> OriginalType?{
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(
            positiveInfinity: "+Infinity",
            negativeInfinity: "-Infinity",
            nan: "NaN")
        return try? decoder.decode(OriginalType.self, from: data)
    }
    
    /// 反序列化(jsonString -> object)
    public static func deserialize(jsonString: String, encoding: String.Encoding) -> OriginalType?{
        guard let data = jsonString.data(using: encoding) else{
            return nil
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(
            positiveInfinity: "+Infinity",
            negativeInfinity: "-Infinity",
            nan: "NaN")
        return try? decoder.decode(OriginalType.self, from: data)
    }
    
    /// 反序列化(jsonString -> object)
    public static func deserialize(jsonString: String) -> OriginalType?{
        guard let data = jsonString.data(using: .utf8) else{
            return nil
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(
            positiveInfinity: "+Infinity",
            negativeInfinity: "-Infinity",
            nan: "NaN")
        return try? decoder.decode(OriginalType.self, from: data)
    }
    
    /// 反序列化(dict -> object)
    public static func deserialize(dict: [String: Any]) -> OriginalType?{
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else{
            return nil
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(
            positiveInfinity: "+Infinity",
            negativeInfinity: "-Infinity",
            nan: "NaN")
        return try? decoder.decode(OriginalType.self, from: data)
    }
    
    // MARK: - 反序列化 -> [对象]
    
    /// 反序列化(data -> [object])
    public static func deserializeList(data: Data) -> [OriginalType]?{
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(
            positiveInfinity: "+Infinity",
            negativeInfinity: "-Infinity",
            nan: "NaN")
        return try? decoder.decode([OriginalType].self, from: data)
    }
    
    /// 反序列化(jsonString -> [object])
    public static func deserializeList(jsonString: String, encoding: String.Encoding) -> [OriginalType]?{
        guard let data = jsonString.data(using: encoding) else{
            return nil
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(
            positiveInfinity: "+Infinity",
            negativeInfinity: "-Infinity",
            nan: "NaN")
        return try? decoder.decode([OriginalType].self, from: data)
    }
    
    /// 反序列化(jsonString -> [object])
    public static func deserializeList(jsonString: String) -> [OriginalType]?{
        guard let data = jsonString.data(using: .utf8) else{
            return nil
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(
            positiveInfinity: "+Infinity",
            negativeInfinity: "-Infinity",
            nan: "NaN")
        return try? decoder.decode([OriginalType].self, from: data)
    }
    
    /// 反序列化(dictionaryList -> [object])
    public static func deserializeList(dictList: [[String: Any]]) -> [OriginalType]?{
        guard let data = try? JSONSerialization.data(withJSONObject: dictList, options: []) else{
            return nil
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(
            positiveInfinity: "+Infinity",
            negativeInfinity: "-Infinity",
            nan: "NaN")
        return try? decoder.decode([OriginalType].self, from: data)
    }
}

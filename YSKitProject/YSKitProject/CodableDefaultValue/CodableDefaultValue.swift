//
//  CodableDefaultValue.swift
//  YSKitProject
//
//  Created by 姚帅 on 2021/3/9.
//

// MARK: - 默认值协议
public protocol CodableDefaultValueProtocol {
    
    associatedtype DefaultValueType: Codable
    
    /// 默认值
    static var defaultValue: DefaultValueType { get }
}

// MARK: - propertyWrapper
@propertyWrapper
struct CodableDefault<T: CodableDefaultValueProtocol> where T == T.DefaultValueType {
    
    var wrappedValue: T.DefaultValueType
    
    init(_ value: T.DefaultValueType? = nil) {
        if let value = value {
            wrappedValue = value
        } else {
            wrappedValue = T.defaultValue
        }
    }
}

extension CodableDefault: Decodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try? container.encode(wrappedValue)
    }
    
    init(from decoder: Decoder) throws {
        if let container = try? decoder.singleValueContainer(), let val = try? container.decode(T.DefaultValueType.self){
            wrappedValue = val
        } else{
            wrappedValue = T.defaultValue
        }
    }
}

// MARK: - 重写KeyedDecodingContainer对于Default类型解码的实现
extension KeyedDecodingContainer {
    
    func decode<T>(_ type: CodableDefault<T>.Type, forKey key: Key) throws -> CodableDefault<T> where T: CodableDefaultValueProtocol{
        try decodeIfPresent(type, forKey: key) ?? CodableDefault(T.defaultValue)
    }
}

// MARK: - 具体类型需遵守DefaultValue协议
extension Int: CodableDefaultValueProtocol{
    public static var defaultValue: Int{ return 0 }
}
extension Int8: CodableDefaultValueProtocol{
    public static var defaultValue: Int8{ return 0 }
}
extension Int16: CodableDefaultValueProtocol{
    public static var defaultValue: Int16{ return 0 }
}
extension Int32: CodableDefaultValueProtocol{
    public static var defaultValue: Int32{ return 0 }
}
extension Int64: CodableDefaultValueProtocol{
    public static var defaultValue: Int64{ return 0 }
}

extension UInt: CodableDefaultValueProtocol{
    public static var defaultValue: UInt{ return 0 }
}
extension UInt8: CodableDefaultValueProtocol{
    public static var defaultValue: UInt8{ return 0 }
}
extension UInt16: CodableDefaultValueProtocol{
    public static var defaultValue: UInt16{ return 0 }
}
extension UInt32: CodableDefaultValueProtocol{
    public static var defaultValue: UInt32{ return 0 }
}
extension UInt64: CodableDefaultValueProtocol{
    public static var defaultValue: UInt64{ return 0 }
}

extension Float: CodableDefaultValueProtocol{
    public static var defaultValue: Float{ return 0 }
}

extension Double: CodableDefaultValueProtocol{
    public static var defaultValue: Double{ return 0 }
}

extension Bool: CodableDefaultValueProtocol{
    public static var defaultValue: Bool{ return false }
}

extension String: CodableDefaultValueProtocol{
    public static var defaultValue: String{ return "" }
}

extension Date: CodableDefaultValueProtocol{
    public static var defaultValue: Date{ return Date() }
}

extension Array: CodableDefaultValueProtocol where Element: CodableDefaultValueProtocol, Element: Codable {
    public typealias Value = Array<Element>
    public static var defaultValue: Array<Element> {
        return []
    }
}

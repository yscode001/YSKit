//
//  CodableDefaultValue.swift
//  YSKitProject
//
//  Created by 姚帅 on 2021/3/9.
//

// MARK: - 默认值协议
protocol DefaultValueProtocol {
    
    associatedtype DefaultValueType: Decodable
    
    /// 默认值
    static var defaultValue: DefaultValueType { get }
}

// MARK: - propertyWrapper

@propertyWrapper
struct Default<T: DefaultValueProtocol> {
    
    var wrappedValue: T.DefaultValueType
}

extension Default: Decodable {
    
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
    
    func decode<T>(_ type: Default<T>.Type, forKey key: Key) throws -> Default<T> where T: DefaultValueProtocol{
        try decodeIfPresent(type, forKey: key) ?? Default(wrappedValue: T.defaultValue)
    }
}

// MARK: - 具体类型需遵守DefaultValue协议
extension Int{
    enum Int_0: DefaultValueProtocol{ static let defaultValue = 0 }
}
extension Int8{
    enum Int8_0: DefaultValueProtocol{ static let defaultValue = 0 }
}
extension Int16{
    enum Int16_0: DefaultValueProtocol{ static let defaultValue = 0 }
}
extension Int32{
    enum Int32_0: DefaultValueProtocol{ static let defaultValue = 0 }
}
extension Int64{
    enum Int64_0: DefaultValueProtocol{ static let defaultValue = 0 }
}

extension UInt{
    enum UInt_0: DefaultValueProtocol{ static let defaultValue = 0 }
}
extension UInt8{
    enum UInt8_0: DefaultValueProtocol{ static let defaultValue = 0 }
}
extension UInt16{
    enum UInt16_0: DefaultValueProtocol{ static let defaultValue = 0 }
}
extension UInt32{
    enum UInt32_0: DefaultValueProtocol{ static let defaultValue = 0 }
}
extension UInt64{
    enum UInt64_0: DefaultValueProtocol{ static let defaultValue = 0 }
}

extension Float{
    enum Float_0: DefaultValueProtocol{ static let defaultValue = 0 }
}
extension Float32{
    enum Float32_0: DefaultValueProtocol{ static let defaultValue = 0 }
}
extension Float64{
    enum Float64_0: DefaultValueProtocol{ static let defaultValue = 0 }
}
extension Float80{
    enum Float80_0: DefaultValueProtocol{ static let defaultValue = 0 }
}

extension Double{
    enum Double_0: DefaultValueProtocol{ static let defaultValue = 0 }
}

extension Bool{
    enum False: DefaultValueProtocol { static let defaultValue = false }
    enum True: DefaultValueProtocol { static let defaultValue = true }
}

extension String{
    enum Empty: DefaultValueProtocol { static let defaultValue = "" }
}

extension Date{
    enum now: DefaultValueProtocol { static let defaultValue = Date() }
}


// MARK: - 扩展Default
extension Default{
    typealias Int_0 = Default<Int.Int_0>
    typealias Int8_0 = Default<Int8.Int8_0>
    typealias Int16_0 = Default<Int16.Int16_0>
    typealias Int32_0 = Default<Int32.Int32_0>
    typealias Int64_0 = Default<Int64.Int64_0>
    
    typealias UInt_0 = Default<UInt.UInt_0>
    typealias UInt8_0 = Default<UInt8.UInt8_0>
    typealias UInt16_0 = Default<UInt16.UInt16_0>
    typealias UInt32_0 = Default<UInt32.UInt32_0>
    typealias UInt64_0 = Default<UInt64.UInt64_0>
    
    typealias Float_0 = Default<Float.Float_0>
    typealias Float32_0 = Default<Float32.Float32_0>
    typealias Float64_0 = Default<Float64.Float64_0>
    typealias Float80_0 = Default<Float80.Float80_0>
    
    typealias Double_0 = Default<Double.Double_0>
    
    typealias True = Default<Bool.True>
    typealias False = Default<Bool.False>
    typealias EmptyString = Default<String.Empty>
    typealias now = Default<Date.now>
}

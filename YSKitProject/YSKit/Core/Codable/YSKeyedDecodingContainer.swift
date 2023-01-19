//
//  YSKeyedDecodingContainer.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/20.
//

/**
 这个扩展先留着，但不建议使用，因为codable的默认值得封装在工程中CodableDefaultValue。使用property wrapper对默认值进行封装
 */

import Foundation

// MARK: - 解析单个属性，有默认值：false、""、0
public extension KeyedDecodingContainer{
    
    func ys_decodeBool(forKey key: KeyedDecodingContainer.Key, default value: Bool = false) -> Bool{
        if contains(key){
            return (try? decode(Bool.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeString(forKey key: KeyedDecodingContainer.Key, default value: String = "") -> String{
        if contains(key){
            return (try? decode(String.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeDouble(forKey key: KeyedDecodingContainer.Key, default value: Double = 0) -> Double{
        if contains(key){
            return (try? decode(Double.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeFloat(forKey key: KeyedDecodingContainer.Key, default value: Float = 0) -> Float{
        if contains(key){
            return (try? decode(Float.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeInt(forKey key: KeyedDecodingContainer.Key, default value: Int = 0) -> Int{
        if contains(key){
            return (try? decode(Int.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeInt8(forKey key: KeyedDecodingContainer.Key, default value: Int8 = 0) -> Int8{
        if contains(key){
            return (try? decode(Int8.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeInt16(forKey key: KeyedDecodingContainer.Key, default value: Int16 = 0) -> Int16{
        if contains(key){
            return (try? decode(Int16.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeInt32(forKey key: KeyedDecodingContainer.Key, default value: Int32 = 0) -> Int32{
        if contains(key){
            return (try? decode(Int32.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeInt64(forKey key: KeyedDecodingContainer.Key, default value: Int64 = 0) -> Int64{
        if contains(key){
            return (try? decode(Int64.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeUInt(forKey key: KeyedDecodingContainer.Key, default value: UInt = 0) -> UInt{
        if contains(key){
            return (try? decode(UInt.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeUInt8(forKey key: KeyedDecodingContainer.Key, default value: UInt8 = 0) -> UInt8{
        if contains(key){
            return (try? decode(UInt8.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeUInt16(forKey key: KeyedDecodingContainer.Key, default value: UInt16 = 0) -> UInt16{
        if contains(key){
            return (try? decode(UInt16.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeUInt32(forKey key: KeyedDecodingContainer.Key, default value: UInt32 = 0) -> UInt32{
        if contains(key){
            return (try? decode(UInt32.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeUInt64(forKey key: KeyedDecodingContainer.Key, default value: UInt64 = 0) -> UInt64{
        if contains(key){
            return (try? decode(UInt64.self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeObject<T>(_ type: T.Type, forKey key: KeyedDecodingContainer.Key, default value: T) -> T where T : Decodable{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? value
        }
        return value
    }
}

// MARK: - 解析单个属性，值为可选
public extension KeyedDecodingContainer{
    
    func ys_decodeBoolOptional(forKey key: KeyedDecodingContainer.Key) -> Bool?{
        if contains(key){
            return try? decode(Bool.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeStringOptional(forKey key: KeyedDecodingContainer.Key) -> String?{
        if contains(key){
            return try? decode(String.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeDoubleOptional(forKey key: KeyedDecodingContainer.Key) -> Double?{
        if contains(key){
            return try? decode(Double.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeFloatOptional(forKey key: KeyedDecodingContainer.Key) -> Float?{
        if contains(key){
            return try? decode(Float.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeIntOptional(forKey key: KeyedDecodingContainer.Key) -> Int?{
        if contains(key){
            return try? decode(Int.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeInt8Optional(forKey key: KeyedDecodingContainer.Key) -> Int8?{
        if contains(key){
            return try? decode(Int8.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeInt16Optional(forKey key: KeyedDecodingContainer.Key) -> Int16?{
        if contains(key){
            return try? decode(Int16.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeInt32Optional(forKey key: KeyedDecodingContainer.Key) -> Int32?{
        if contains(key){
            return try? decode(Int32.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeInt64Optional(forKey key: KeyedDecodingContainer.Key) -> Int64?{
        if contains(key){
            return try? decode(Int64.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeUIntOptional(forKey key: KeyedDecodingContainer.Key) -> UInt?{
        if contains(key){
            return try? decode(UInt.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeUInt8Optional(forKey key: KeyedDecodingContainer.Key) -> UInt8?{
        if contains(key){
            return try? decode(UInt8.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeUInt16Optional(forKey key: KeyedDecodingContainer.Key) -> UInt16?{
        if contains(key){
            return try? decode(UInt16.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeUInt32Optional(forKey key: KeyedDecodingContainer.Key) -> UInt32?{
        if contains(key){
            return try? decode(UInt32.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeUInt64Optional(forKey key: KeyedDecodingContainer.Key) -> UInt64?{
        if contains(key){
            return try? decode(UInt64.self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeObjectOptional<T>(_ type: T.Type, forKey key: KeyedDecodingContainer.Key) -> T? where T : Decodable{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
}

// MARK: - 解析数组属性，默认为空数组
public extension KeyedDecodingContainer{
    
    func ys_decodeBools(forKey key: KeyedDecodingContainer.Key, default value: [Bool] = [Bool]()) -> [Bool]{
        if contains(key){
            return (try? decode([Bool].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeStrings(forKey key: KeyedDecodingContainer.Key, default value: [String] = [String]()) -> [String]{
        if contains(key){
            return (try? decode([String].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeDoubles(forKey key: KeyedDecodingContainer.Key, default value: [Double] = [Double]()) -> [Double]{
        if contains(key){
            return (try? decode([Double].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeFloats(forKey key: KeyedDecodingContainer.Key, default value: [Float] = [Float]()) -> [Float]{
        if contains(key){
            return (try? decode([Float].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeInts(forKey key: KeyedDecodingContainer.Key, default value: [Int] = [Int]()) -> [Int]{
        if contains(key){
            return (try? decode([Int].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeInt8s(forKey key: KeyedDecodingContainer.Key, default value: [Int8] = [Int8]()) -> [Int8]{
        if contains(key){
            return (try? decode([Int8].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeInt16s(forKey key: KeyedDecodingContainer.Key, default value: [Int16] = [Int16]()) -> [Int16]{
        if contains(key){
            return (try? decode([Int16].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeInt32s(forKey key: KeyedDecodingContainer.Key, default value: [Int32] = [Int32]()) -> [Int32]{
        if contains(key){
            return (try? decode([Int32].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeInt64s(forKey key: KeyedDecodingContainer.Key, default value: [Int64] = [Int64]()) -> [Int64]{
        if contains(key){
            return (try? decode([Int64].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeUInts(forKey key: KeyedDecodingContainer.Key, default value: [UInt] = [UInt]()) -> [UInt]{
        if contains(key){
            return (try? decode([UInt].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeUInt8s(forKey key: KeyedDecodingContainer.Key, default value: [UInt8] = [UInt8]()) -> [UInt8]{
        if contains(key){
            return (try? decode([UInt8].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeUInt16s(forKey key: KeyedDecodingContainer.Key, default value: [UInt16] = [UInt16]()) -> [UInt16]{
        if contains(key){
            return (try? decode([UInt16].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeUInt32s(forKey key: KeyedDecodingContainer.Key, default value: [UInt32] = [UInt32]()) -> [UInt32]{
        if contains(key){
            return (try? decode([UInt32].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeUInt64s(forKey key: KeyedDecodingContainer.Key, default value: [UInt64] = [UInt64]()) -> [UInt64]{
        if contains(key){
            return (try? decode([UInt64].self, forKey: key)) ?? value
        }
        return value
    }
    
    func ys_decodeObjects<T>(_ type: [T].Type, forKey key: KeyedDecodingContainer.Key, default value: [T] = [T]()) -> [T] where T : Decodable{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? value
        }
        return value
    }
}

// MARK: - 解析数组属性，值为可选
public extension KeyedDecodingContainer{
    
    func ys_decodeBoolsOptional(forKey key: KeyedDecodingContainer.Key) -> [Bool]?{
        if contains(key){
            return try? decode([Bool].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeStringsOptional(forKey key: KeyedDecodingContainer.Key) -> [String]?{
        if contains(key){
            return try? decode([String].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeDoublesOptional(forKey key: KeyedDecodingContainer.Key) -> [Double]?{
        if contains(key){
            return try? decode([Double].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeFloatsOptional(forKey key: KeyedDecodingContainer.Key) -> [Float]?{
        if contains(key){
            return try? decode([Float].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeIntsOptional(forKey key: KeyedDecodingContainer.Key) -> [Int]?{
        if contains(key){
            return try? decode([Int].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeInt8sOptional(forKey key: KeyedDecodingContainer.Key) -> [Int8]?{
        if contains(key){
            return try? decode([Int8].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeInt16sOptional(forKey key: KeyedDecodingContainer.Key) -> [Int16]?{
        if contains(key){
            return try? decode([Int16].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeInt32sOptional(forKey key: KeyedDecodingContainer.Key) -> [Int32]?{
        if contains(key){
            return try? decode([Int32].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeInt64sOptional(forKey key: KeyedDecodingContainer.Key) -> [Int64]?{
        if contains(key){
            return try? decode([Int64].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeUIntsOptional(forKey key: KeyedDecodingContainer.Key) -> [UInt]?{
        if contains(key){
            return try? decode([UInt].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeUInt8sOptional(forKey key: KeyedDecodingContainer.Key) -> [UInt8]?{
        if contains(key){
            return try? decode([UInt8].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeUInt16sOptional(forKey key: KeyedDecodingContainer.Key) -> [UInt16]?{
        if contains(key){
            return try? decode([UInt16].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeUInt32sOptional(forKey key: KeyedDecodingContainer.Key) -> [UInt32]?{
        if contains(key){
            return try? decode([UInt32].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeUInt64sOptional(forKey key: KeyedDecodingContainer.Key) -> [UInt64]?{
        if contains(key){
            return try? decode([UInt64].self, forKey: key)
        }
        return nil
    }
    
    func ys_decodeObjectsOptional<T>(_ type: [T].Type, forKey key: KeyedDecodingContainer.Key) -> [T]? where T : Decodable{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
}

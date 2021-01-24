//
//  YSKeyedDecodingContainer.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/20.
//

import Foundation

// MARK: - 解析单个属性，有默认值：false、""、0
extension KeyedDecodingContainer{
    
    public func ys_decode(_ type: Bool.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: Bool? = false) -> Bool{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: String.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: String? = "") -> String{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: Double.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: Double? = 0) -> Double{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: Float.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: Float? = 0) -> Float{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: Int.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: Int? = 0) -> Int{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: Int8.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: Int8? = 0) -> Int8{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: Int16.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: Int16? = 0) -> Int16{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: Int32.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: Int32? = 0) -> Int32{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: Int64.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: Int64? = 0) -> Int64{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: UInt.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: UInt? = 0) -> UInt{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: UInt8.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: UInt8? = 0) -> UInt8{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: UInt16.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: UInt16? = 0) -> UInt16{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: UInt32.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: UInt32? = 0) -> UInt32{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: UInt64.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: UInt64? = 0) -> UInt64{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: T) -> T where T : Decodable{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal
        }
        return defaultVal
    }
}

// MARK: - 解析单个属性，值为可选
extension KeyedDecodingContainer{
    
    public func ys_decode_option(_ type: Bool.Type, forKey key: KeyedDecodingContainer.Key) -> Bool?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: String.Type, forKey key: KeyedDecodingContainer.Key) -> String?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: Double.Type, forKey key: KeyedDecodingContainer.Key) -> Double?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: Float.Type, forKey key: KeyedDecodingContainer.Key) -> Float?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: Int.Type, forKey key: KeyedDecodingContainer.Key) -> Int?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: Int8.Type, forKey key: KeyedDecodingContainer.Key) -> Int8?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: Int16.Type, forKey key: KeyedDecodingContainer.Key) -> Int16?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: Int32.Type, forKey key: KeyedDecodingContainer.Key) -> Int32?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: Int64.Type, forKey key: KeyedDecodingContainer.Key) -> Int64?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: UInt.Type, forKey key: KeyedDecodingContainer.Key) -> UInt?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: UInt8.Type, forKey key: KeyedDecodingContainer.Key) -> UInt8?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: UInt16.Type, forKey key: KeyedDecodingContainer.Key) -> UInt16?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: UInt32.Type, forKey key: KeyedDecodingContainer.Key) -> UInt32?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: UInt64.Type, forKey key: KeyedDecodingContainer.Key) -> UInt64?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option<T>(_ type: T.Type, forKey key: KeyedDecodingContainer.Key) -> T? where T : Decodable{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
}

// MARK: - 解析数组属性，默认为空数组
extension KeyedDecodingContainer{
    
    public func ys_decode(_ type: [Bool].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [Bool]? = [Bool]()) -> [Bool]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [String].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [String]? = [String]()) -> [String]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [Double].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [Double]? = [Double]()) -> [Double]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [Float].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [Float]? = [Float]()) -> [Float]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [Int].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [Int]? = [Int]()) -> [Int]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [Int8].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [Int8]? = [Int8]()) -> [Int8]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [Int16].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [Int16]? = [Int16]()) -> [Int16]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [Int32].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [Int32]? = [Int32]()) -> [Int32]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [Int64].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [Int64]? = [Int64]()) -> [Int64]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [UInt].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [UInt]? = [UInt]()) -> [UInt]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [UInt8].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [UInt8]? = [UInt8]()) -> [UInt8]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [UInt16].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [UInt16]? = [UInt16]()) -> [UInt16]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [UInt32].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [UInt32]? = [UInt32]()) -> [UInt32]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode(_ type: [UInt64].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [UInt64]? = [UInt64]()) -> [UInt64]{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
    
    public func ys_decode<T>(_ type: [T].Type, forKey key: KeyedDecodingContainer.Key, default defaultVal: [T]? = [T]()) -> [T] where T : Decodable{
        if contains(key){
            return (try? decode(type, forKey: key)) ?? defaultVal!
        }
        return defaultVal!
    }
}

// MARK: - 解析数组属性，值为可选
extension KeyedDecodingContainer{
    
    public func ys_decode_option(_ type: [Bool].Type, forKey key: KeyedDecodingContainer.Key) -> [Bool]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [String].Type, forKey key: KeyedDecodingContainer.Key) -> [String]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [Double].Type, forKey key: KeyedDecodingContainer.Key) -> [Double]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [Float].Type, forKey key: KeyedDecodingContainer.Key) -> [Float]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [Int].Type, forKey key: KeyedDecodingContainer.Key) -> [Int]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [Int8].Type, forKey key: KeyedDecodingContainer.Key) -> [Int8]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [Int16].Type, forKey key: KeyedDecodingContainer.Key) -> [Int16]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [Int32].Type, forKey key: KeyedDecodingContainer.Key) -> [Int32]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [Int64].Type, forKey key: KeyedDecodingContainer.Key) -> [Int64]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [UInt].Type, forKey key: KeyedDecodingContainer.Key) -> [UInt]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [UInt8].Type, forKey key: KeyedDecodingContainer.Key) -> [UInt8]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [UInt16].Type, forKey key: KeyedDecodingContainer.Key) -> [UInt16]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [UInt32].Type, forKey key: KeyedDecodingContainer.Key) -> [UInt32]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option(_ type: [UInt64].Type, forKey key: KeyedDecodingContainer.Key) -> [UInt64]?{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func ys_decode_option<T>(_ type: [T].Type, forKey key: KeyedDecodingContainer.Key) -> [T]? where T : Decodable{
        if contains(key){
            return try? decode(type, forKey: key)
        }
        return nil
    }
}

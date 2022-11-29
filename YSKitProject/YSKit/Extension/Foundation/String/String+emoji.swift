//
//  String+emoji.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/31.
//

import Foundation

public extension YSOriginalProtocol where OriginalType == String{
    
    /// 16进制字符串转成emoji表情
    var emoji: String {
        // 1、在一段字符串中查找十六进制的字符串
        let scanner = Scanner(string: originalObj)
        // 2、将查找的字符串转换为十六进制的数字
        var value: UInt32 = 0
        scanner.scanHexInt32(&value)
        // 3、将十六进制的数字转化为unicode字符
        guard let saclar = UnicodeScalar(value) else{
            return ""
        }
        // 4、将uniconde字符转换为字符串
        return String(Character(saclar))
    }
    
    /// 16进制数转成emoji表情
    static func emoji(_ hex: __int32_t) -> String{
        guard let value = UInt32(hex.description), let saclar = UnicodeScalar(value) else{
            return ""
        }
        return String(Character(saclar))
    }
}

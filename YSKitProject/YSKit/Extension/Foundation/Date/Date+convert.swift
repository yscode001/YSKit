//
//  Date+convert.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

// MARK: - 日期转字符串
public extension YSOriginalObjectProtocol where OriginalObjectType == Date{
    
    func string(_ format: String, locale: Locale? = nil) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale.getLocale(locale)
        return formatter.string(from: originalObject)
    }
}

// MARK: - 字符串转日期
public extension YSOriginalObjectProtocol where OriginalObjectType == String{
    
    /// 转为日期
    func date(_ format: String, locale: Locale? = nil) -> Date?{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale.getLocale(locale)
        return formatter.date(from: originalObject)
    }
}

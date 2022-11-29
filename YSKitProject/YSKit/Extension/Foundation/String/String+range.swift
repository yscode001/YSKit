//
//  String+range.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

public extension YSOriginalProtocol where OriginalType == String{
    
    /// 返回自己的完整range
    var range:NSRange{
        return nsstring.range(of: originalObj)
    }
    
    /// 返回自己的第一个匹配到的子串的range
    @discardableResult func range(subString: String) -> NSRange{
        if originalObj.contains(subString){
            return nsstring.range(of: subString)
        }
        return NSRange(location: 0, length: 0)
    }
    
    /// 返回自己的第一个匹配到的子串的range
    @discardableResult func range(subNSString: NSString) -> NSRange{
        if originalObj.contains(subNSString.ys.string){
            return nsstring.range(of: subNSString.ys.string)
        }
        return NSRange(location: 0, length: 0)
    }
}

public extension YSOriginalProtocol where OriginalType == String{
    
    /// 正则表达式取匹配到的所有子串的range
    @discardableResult func rangeList(subString: String) -> [NSRange]?{
        if originalObj.contains(subString), let matchResult = try? NSRegularExpression(pattern: subString, options: []).matches(in: originalObj, options: [], range: range){
            return matchResult.map{$0.range}
        }
        return nil
    }
    
    /// 正则表达式取匹配到的所有子串的range
    @discardableResult func rangeList(subNSString: NSString) -> [NSRange]?{
        if originalObj.contains(subNSString.ys.string), let matchResult = try? NSRegularExpression(pattern: subNSString.ys.string, options: []).matches(in: originalObj, options: [], range: range){
            return matchResult.map{$0.range}
        }
        return nil
    }
}

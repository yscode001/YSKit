//
//  NSString+range.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType == NSString{
    
    /// 返回自己的完整range
    var range:NSRange{
        return originalObject.range(of: string)
    }
    
    /// 返回自己的第一个匹配到的子串的range
    @discardableResult func range(subString: String) -> NSRange{
        if string.contains(subString){
            return originalObject.range(of: subString)
        }
        return NSRange(location: 0, length: 0)
    }
    
    /// 返回自己的第一个匹配到的子串的range
    @discardableResult func range(subNSString: NSString) -> NSRange{
        if string.contains(subNSString.ys.string){
            return originalObject.range(of: subNSString.ys.string)
        }
        return NSRange(location: 0, length: 0)
    }
}

public extension YSOriginalObjectProtocol where OriginalObjectType == NSString{
    
    /// 正则表达式取匹配到的所有子串的range
    @discardableResult func rangeList(subString: String) -> [NSRange]?{
        if string.contains(subString), let matchResult = try? NSRegularExpression(pattern: subString, options: []).matches(in: string, options: [], range: range){
            return matchResult.map{$0.range}
        }
        return nil
    }
    
    /// 正则表达式取匹配到的所有子串的range
    @discardableResult func rangeList(subNSString: NSString) -> [NSRange]?{
        if string.contains(subNSString.ys.string), let matchResult = try? NSRegularExpression(pattern: subNSString.ys.string, options: []).matches(in: string, options: [], range: range){
            return matchResult.map{$0.range}
        }
        return nil
    }
}

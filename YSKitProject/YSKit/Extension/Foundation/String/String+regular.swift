//
//  String+regular.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/31.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType == String{
    
    /// 是否匹配某个正则表达式
    func regularExpression(_ regularExpression: String) -> Bool{
        
        // pattern：正则表达式
        // options：匹配选项，如忽略大小写等，传[]即可
        // range：匹配的范围
        let matchResult = try? NSRegularExpression(pattern: regularExpression, options: []).matches(in: originalObject, options: [], range: NSMakeRange(0, nsstring.length))
        return (matchResult?.count ?? 0) > 0
    }
}

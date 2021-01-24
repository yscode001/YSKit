//
//  NSMutableAttributedString+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation

public extension YSOriginalObject where OriginalObjectType == NSMutableAttributedString{
    
    /// 指定range改变样式
    @discardableResult func addAttributes(range: NSRange, attrs: [NSAttributedString.Key: Any]) -> OriginalObjectType{
        originalObject.addAttributes(attrs, range: range)
        return originalObject
    }
    
    /// 指定range改变样式
    @discardableResult func addAttributes(rangeList: [NSRange], attrs: [NSAttributedString.Key: Any]) -> OriginalObjectType{
        for range in rangeList{
            originalObject.addAttributes(attrs, range: range)
        }
        return originalObject
    }
    
    /// 匹配到的第一个substring改变样式
    @discardableResult func addAttributes(firstSubString: String, attrs: [NSAttributedString.Key: Any]) -> OriginalObjectType{
        let range = originalObject.string.ys.range(subString: firstSubString)
        originalObject.addAttributes(attrs, range: range)
        return originalObject
    }
    
    /// 匹配到的所有substring改变样式
    @discardableResult func addAttributes(allSubString: String, attrs: [NSAttributedString.Key: Any]) -> OriginalObjectType{
        guard let rangeList = originalObject.string.ys.rangeList(subString: allSubString) else{
            return originalObject
        }
        if rangeList.isEmpty{
            return originalObject
        }
        for range in rangeList{
            originalObject.addAttributes(attrs, range: range)
        }
        return originalObject
    }
}

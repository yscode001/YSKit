//
//  NSMutableAttributedString+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation

public extension YSOriginalObject where OriginalType == NSMutableAttributedString{
    
    /// 指定range改变样式
    @discardableResult func addAttributes(range: NSRange, attrs: [NSAttributedString.Key: Any]) -> OriginalType{
        originalObj.addAttributes(attrs, range: range)
        return originalObj
    }
    
    /// 指定range改变样式
    @discardableResult func addAttributes(rangeList: [NSRange], attrs: [NSAttributedString.Key: Any]) -> OriginalType{
        for range in rangeList{
            originalObj.addAttributes(attrs, range: range)
        }
        return originalObj
    }
    
    /// 匹配到的第一个substring改变样式
    @discardableResult func addAttributes(firstSubString: String, attrs: [NSAttributedString.Key: Any]) -> OriginalType{
        let range = originalObj.string.ys.range(subString: firstSubString)
        originalObj.addAttributes(attrs, range: range)
        return originalObj
    }
    
    /// 匹配到的所有substring改变样式
    @discardableResult func addAttributes(allSubString: String, attrs: [NSAttributedString.Key: Any]) -> OriginalType{
        guard let rangeList = originalObj.string.ys.rangeList(subString: allSubString) else{
            return originalObj
        }
        if rangeList.isEmpty{
            return originalObj
        }
        for range in rangeList{
            originalObj.addAttributes(attrs, range: range)
        }
        return originalObj
    }
}

//
//  String+ext.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType == String{
    
    @discardableResult func trim_startAndEnd() -> String{
        let whitespace = NSCharacterSet.whitespacesAndNewlines
        return originalObject.trimmingCharacters(in: whitespace)
    }
    
    @discardableResult func trim_all() -> String{
        return originalObject.replacingOccurrences(of: " ", with: "")
    }
    
    /// 是否为空串或全部是空格的串
    var isEmptyOrWhiteSpace:Bool{
        return originalObject.isEmpty || trim_all().isEmpty
    }
    
    /// 移除最后一个字符
    @discardableResult func removeLastCharacter() -> String{
        var str = originalObject
        if str.count > 0{
            str.remove(at: str.index(before: str.endIndex))
        }
        return str
    }
    
    /// 移除匹配到的第一个子串
    @discardableResult func removeFirstString(_ str: String) -> String{
        let subrange = nsstring.range(of: str)
        return nsstring.replacingCharacters(in: subrange, with: "")
    }
    
    /// 替换匹配到的第一个子串
    @discardableResult func replaceFirstString(old: String, new: String) -> String{
        let subrange = nsstring.range(of: old)
        return nsstring.replacingCharacters(in: subrange, with: new)
    }
    
    /// 截取最大字数(最后面是否显示3个点)
    @discardableResult func substring(_ maxCount: Int, showMore: Bool) -> String{
        if originalObject.count <= maxCount{
            return originalObject
        } else if showMore{
            return nsstring.substring(to: maxCount) + "..."
        } else{
            return nsstring.substring(to: maxCount)
        }
    }
    
    @discardableResult func size(attributes: [NSAttributedString.Key: Any]?) -> CGSize{
        return nsstring.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions(rawValue: 0), attributes: attributes, context: nil).size
    }
}

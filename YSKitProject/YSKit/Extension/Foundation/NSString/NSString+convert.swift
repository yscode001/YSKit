//
//  NSString+convert.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/30.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType == NSString{
    
    var string:String{ return originalObject as String }
    
    var attributedString:NSAttributedString{ return NSAttributedString(string: string) }
    
    var mutableAttributedString:NSMutableAttributedString{ return NSMutableAttributedString(string: string) }
    
    func attributedString(attributes: [NSAttributedString.Key: Any]?) -> NSAttributedString{
        return NSAttributedString(string: string, attributes: attributes)
    }
    
    func mutableAttributedString(attributes: [NSAttributedString.Key: Any]?) -> NSMutableAttributedString{
        return NSMutableAttributedString(string: string, attributes: attributes)
    }
}

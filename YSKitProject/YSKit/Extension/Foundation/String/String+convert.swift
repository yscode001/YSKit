//
//  String+convert.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/30.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType == String{
    
    var nsstring:NSString{ return originalObject as NSString }
    
    var attributedString:NSAttributedString{ return NSAttributedString(string: originalObject) }
    
    var mutableAttributedString:NSMutableAttributedString{ return NSMutableAttributedString(string: originalObject) }
    
    func attributedString(attributes: [NSAttributedString.Key: Any]?) -> NSAttributedString{
        return NSAttributedString(string: originalObject, attributes: attributes)
    }
    
    func mutableAttributedString(attributes: [NSAttributedString.Key: Any]?) -> NSMutableAttributedString{
        return NSMutableAttributedString(string: originalObject, attributes: attributes)
    }
}

public extension YSOriginalObjectProtocol where OriginalObjectType == String{
    
    var bool:Bool{
        let boolStr = originalObject.lowercased()
        return boolStr == "true" || boolStr == "t" || boolStr == "yes" || boolStr == "y"
    }
    
    var int:Int{return Int(originalObject) ?? 0}
    
    var float:Float{return Float(originalObject) ?? 0}
    
    var cgFloat:CGFloat{return CGFloat(float)}
    
    var double:Double{return Double(originalObject) ?? 0}
}

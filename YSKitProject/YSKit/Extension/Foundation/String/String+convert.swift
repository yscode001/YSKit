//
//  String+convert.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/30.
//

import Foundation

public extension YSOriginalProtocol where OriginalType == String{
    
    var nsstring:NSString{ return originalObj as NSString }
    
    var attributedString:NSAttributedString{ return NSAttributedString(string: originalObj) }
    
    var mutableAttributedString:NSMutableAttributedString{ return NSMutableAttributedString(string: originalObj) }
    
    func attributedString(attributes: [NSAttributedString.Key: Any]?) -> NSAttributedString{
        return NSAttributedString(string: originalObj, attributes: attributes)
    }
    
    func mutableAttributedString(attributes: [NSAttributedString.Key: Any]?) -> NSMutableAttributedString{
        return NSMutableAttributedString(string: originalObj, attributes: attributes)
    }
}

public extension YSOriginalProtocol where OriginalType == String{
    
    var bool:Bool{
        let boolStr = originalObj.lowercased()
        return boolStr == "true" || boolStr == "t" || boolStr == "yes" || boolStr == "y"
    }
    
    var int:Int{return Int(originalObj) ?? 0}
    
    var float:Float{return Float(originalObj) ?? 0}
    
    var cgFloat:CGFloat{return CGFloat(float)}
    
    var double:Double{return Double(originalObj) ?? 0}
}

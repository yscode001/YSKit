//
//  UILabel+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType == UILabel{
    
    static func create(textc: UIColor) -> OriginalObjectType{
        return UILabel().ys.then{ $0.textColor = textc }
    }
    
    static func create(textc: UIColor, text: String) -> OriginalObjectType{
        return UILabel().ys.then{
            $0.textColor = textc
            $0.text = text
        }
    }
    
    static func create(textc: UIColor, target: Any, action: Selector) -> OriginalObjectType{
        return UILabel().ys.then{
            $0.textColor = textc
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        }
    }
    
    static func create(textc: UIColor, text: String, target: Any, action: Selector) -> OriginalObjectType{
        return UILabel().ys.then{
            $0.textColor = textc
            $0.text = text
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        }
    }
}

//
//  UITextField+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType == UITextField{
    
    static func create(bgc: UIColor, textc: UIColor, clearMode: UITextField.ViewMode, borderStyle: UITextField.BorderStyle) -> OriginalObjectType{
        return UITextField().ys.then{
            $0.backgroundColor = bgc
            $0.textColor = textc
            $0.clearButtonMode = clearMode
            $0.borderStyle = borderStyle
        }
    }
    
    static func create(bgc: UIColor, textc: UIColor, clearMode: UITextField.ViewMode, borderStyle: UITextField.BorderStyle, placeholder: String) -> OriginalObjectType{
        return UITextField().ys.then{
            $0.backgroundColor = bgc
            $0.textColor = textc
            $0.clearButtonMode = clearMode
            $0.borderStyle = borderStyle
            $0.placeholder = placeholder
        }
    }
    
    static func create(bgc: UIColor, textc: UIColor, clearMode: UITextField.ViewMode, borderStyle: UITextField.BorderStyle, placeholderAtt: NSAttributedString) -> OriginalObjectType{
        return UITextField().ys.then{
            $0.backgroundColor = bgc
            $0.textColor = textc
            $0.clearButtonMode = clearMode
            $0.borderStyle = borderStyle
            $0.attributedPlaceholder = placeholderAtt
        }
    }
}

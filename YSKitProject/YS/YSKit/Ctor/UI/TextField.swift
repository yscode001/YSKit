//
//  TextField.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    static func textField(bgColor: UIColor, textColor: UIColor, clearMode: UITextField.ViewMode, borderStyle: UITextField.BorderStyle) -> UITextField{
        return UITextField().ys.then{
            $0.backgroundColor = bgColor
            $0.textColor = textColor
            $0.clearButtonMode = clearMode
            $0.borderStyle = borderStyle
        }
    }
    
    static func textField(bgColor: UIColor, textColor: UIColor, clearMode: UITextField.ViewMode, borderStyle: UITextField.BorderStyle, placeholder: String) -> UITextField{
        return UITextField().ys.then{
            $0.backgroundColor = bgColor
            $0.textColor = textColor
            $0.clearButtonMode = clearMode
            $0.borderStyle = borderStyle
            $0.placeholder = placeholder
        }
    }
    
    static func textField(bgColor: UIColor, textColor: UIColor, clearMode: UITextField.ViewMode, borderStyle: UITextField.BorderStyle, placeholderAtt: NSAttributedString) -> UITextField{
        return UITextField().ys.then{
            $0.backgroundColor = bgColor
            $0.textColor = textColor
            $0.clearButtonMode = clearMode
            $0.borderStyle = borderStyle
            $0.attributedPlaceholder = placeholderAtt
        }
    }
}

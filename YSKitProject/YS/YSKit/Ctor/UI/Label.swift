//
//  Label.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    static func label(textColor: UIColor) -> UILabel{
        return UILabel().ys.then{
            $0.textColor = textColor
        }
    }
    
    static func label(textColor: UIColor, text: String) -> UILabel{
        return UILabel().ys.then{
            $0.textColor = textColor
            $0.text = text
        }
    }
    
    static func label(textColor: UIColor, target: Any, action: Selector) -> UILabel{
        return UILabel().ys.then{
            $0.textColor = textColor
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        }
    }
    
    static func label(textColor: UIColor, text: String, target: Any, action: Selector) -> UILabel{
        return UILabel().ys.then{
            $0.textColor = textColor
            $0.text = text
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        }
    }
}

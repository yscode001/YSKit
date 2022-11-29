//
//  View.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public class Ctor{
    
    public static func view(bgColor: UIColor) -> UIView{
        return UIView().ys.then{
            $0.backgroundColor = bgColor
        }
    }
    
    public static func view(bgColor: UIColor, target: Any, action: Selector) -> UIView{
        return UIView().ys.then{
            $0.backgroundColor = bgColor
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        }
    }
}

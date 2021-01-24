//
//  UIView+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType == UIView{
    
    static func create(bgc: UIColor) -> OriginalObjectType{
        return UIView().ys.then{ $0.backgroundColor = bgc }
    }
    
    static func create(bgc: UIColor, target: Any, action: Selector) -> OriginalObjectType{
        return UIView().ys.then{
            $0.backgroundColor = bgc
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        }
    }
}

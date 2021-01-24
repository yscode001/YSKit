//
//  UISwitch+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType == UISwitch{
    
    static func create(target: Any, action: Selector) -> OriginalObjectType{
        return UISwitch().ys.then{
            $0.addTarget(target, action: action, for: .valueChanged)
        }
    }
    
    static func create(target: Any, action: Selector, isOn: Bool) -> OriginalObjectType{
        return UISwitch().ys.then{
            $0.isOn = isOn
            $0.addTarget(target, action: action, for: .valueChanged)
        }
    }
    
    static func create(target: Any, action: Selector, onTintC: UIColor) -> OriginalObjectType{
        return UISwitch().ys.then{
            $0.onTintColor = onTintC
            $0.addTarget(target, action: action, for: .valueChanged)
        }
    }
    
    static func create(target: Any, action: Selector, isOn: Bool, onTintC: UIColor) -> OriginalObjectType{
        return UISwitch().ys.then{
            $0.isOn = isOn
            $0.onTintColor = onTintC
            $0.addTarget(target, action: action, for: .valueChanged)
        }
    }
}

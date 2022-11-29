//
//  Switch.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    static func `switch`(target: Any, action: Selector) -> UISwitch{
        return UISwitch().ys.then{
            $0.addTarget(target, action: action, for: .valueChanged)
        }
    }
    
    static func `switch`(target: Any, action: Selector, isOn: Bool) -> UISwitch{
        return UISwitch().ys.then{
            $0.isOn = isOn
            $0.addTarget(target, action: action, for: .valueChanged)
        }
    }
    
    static func `switch`(target: Any, action: Selector, onTintC: UIColor) -> UISwitch{
        return UISwitch().ys.then{
            $0.onTintColor = onTintC
            $0.addTarget(target, action: action, for: .valueChanged)
        }
    }
    
    static func `switch`(target: Any, action: Selector, isOn: Bool, onTintC: UIColor) -> UISwitch{
        return UISwitch().ys.then{
            $0.isOn = isOn
            $0.onTintColor = onTintC
            $0.addTarget(target, action: action, for: .valueChanged)
        }
    }
}

//
//  Button.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

// MARK: - 根据title创建UIButton
public extension Ctor{
    
    static func btn(titleColor: UIColor) -> UIButton{
        return UIButton().ys.then{
            $0.setTitleColor(titleColor, for: .normal)
            $0.adjustsImageWhenHighlighted = false
        }
    }
    
    static func btn(titleColor: UIColor, title: String) -> UIButton{
        return UIButton().ys.then{
            $0.setTitleColor(titleColor, for: .normal)
            $0.setTitle(title, for: .normal)
            $0.adjustsImageWhenHighlighted = false
        }
    }
    
    static func btn(titleColor: UIColor, target: Any, action: Selector) -> UIButton{
        return UIButton().ys.then{
            $0.setTitleColor(titleColor, for: .normal)
            $0.adjustsImageWhenHighlighted = false
            $0.addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    static func btn(titleColor: UIColor, title: String, target: Any, action: Selector) -> UIButton{
        return UIButton().ys.then{
            $0.setTitleColor(titleColor, for: .normal)
            $0.setTitle(title, for: .normal)
            $0.adjustsImageWhenHighlighted = false
            $0.addTarget(target, action: action, for: .touchUpInside)
        }
    }
}

// MARK: - 根据image创建UIButton
public extension Ctor{
    
    static func btn(img: UIImage?) -> UIButton{
        return UIButton().ys.then{
            $0.setImage(img, for: .normal)
            $0.adjustsImageWhenHighlighted = false
        }
    }
    
    static func btn(img: UIImage?, target: Any, action: Selector) -> UIButton{
        return UIButton().ys.then{
            $0.setImage(img, for: .normal)
            $0.adjustsImageWhenHighlighted = false
            $0.addTarget(target, action: action, for: .touchUpInside)
        }
    }
}

public extension Ctor{
    
    static func btn(imgName: String?) -> UIButton{
        return UIButton().ys.then{
            $0.setImage(Ctor.img(imgName), for: .normal)
            $0.adjustsImageWhenHighlighted = false
        }
    }
    
    static func btn(imgName: String?, target: Any, action: Selector) -> UIButton{
        return UIButton().ys.then{
            $0.setImage(Ctor.img(imgName), for: .normal)
            $0.adjustsImageWhenHighlighted = false
            $0.addTarget(target, action: action, for: .touchUpInside)
        }
    }
}

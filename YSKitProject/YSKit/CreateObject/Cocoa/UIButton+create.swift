//
//  UIButton+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

// MARK: - 根据title创建UIButton
public extension YSOriginalObjectProtocol where OriginalObjectType == UIButton{
    
    static func create(titlec: UIColor) -> OriginalObjectType{
        return UIButton().ys.then{
            $0.setTitleColor(titlec, for: .normal)
            $0.adjustsImageWhenHighlighted = false
        }
    }
    
    static func create(titlec: UIColor, title: String) -> OriginalObjectType{
        return UIButton().ys.then{
            $0.setTitleColor(titlec, for: .normal)
            $0.setTitle(title, for: .normal)
            $0.adjustsImageWhenHighlighted = false
        }
    }
    
    static func create(titlec: UIColor, target: Any, action: Selector) -> OriginalObjectType{
        return UIButton().ys.then{
            $0.setTitleColor(titlec, for: .normal)
            $0.adjustsImageWhenHighlighted = false
            $0.addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    static func create(titlec: UIColor, title: String, target: Any, action: Selector) -> OriginalObjectType{
        return UIButton().ys.then{
            $0.setTitleColor(titlec, for: .normal)
            $0.setTitle(title, for: .normal)
            $0.adjustsImageWhenHighlighted = false
            $0.addTarget(target, action: action, for: .touchUpInside)
        }
    }
}

// MARK: - 根据image创建UIButton
public extension YSOriginalObjectProtocol where OriginalObjectType == UIButton{
    
    static func create(img: UIImage?) -> OriginalObjectType{
        return UIButton().ys.then{
            $0.setImage(img, for: .normal)
            $0.adjustsImageWhenHighlighted = false
        }
    }
    
    static func create(img: UIImage?, target: Any, action: Selector) -> OriginalObjectType{
        return UIButton().ys.then{
            $0.setImage(img, for: .normal)
            $0.adjustsImageWhenHighlighted = false
            $0.addTarget(target, action: action, for: .touchUpInside)
        }
    }
}

public extension YSOriginalObjectProtocol where OriginalObjectType == UIButton{
    
    static func create(imgName: String) -> OriginalObjectType{
        return UIButton().ys.then{
            $0.setImage(UIImage(named: imgName), for: .normal)
            $0.adjustsImageWhenHighlighted = false
        }
    }
    
    static func create(imgName: String, target: Any, action: Selector) -> OriginalObjectType{
        return UIButton().ys.then{
            $0.setImage(UIImage(named: imgName), for: .normal)
            $0.adjustsImageWhenHighlighted = false
            $0.addTarget(target, action: action, for: .touchUpInside)
        }
    }
}

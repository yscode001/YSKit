//
//  UIBarButtonItem+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

// MARK: - 根据customView创建UIBarButtonItem
public extension YSOriginalObjectProtocol where OriginalObjectType == UIBarButtonItem{
    
    static func create(customV: UIView) -> OriginalObjectType{
        return UIBarButtonItem().ys.then{ $0.customView = customV }
    }
}

// MARK: - 创建customView为UIButton的UIBarButtonItem

/// UIBarButtonItem样式
public enum UIBarButtonItemStyle{
    
    /// 图片(正常状态)
    case image
    
    /// 图片(正常状态 + 禁用状态)
    case image_disable
    
    /// 文字(正常状态)
    case title
    
    /// 文字(正常状态 + 禁用状态)
    case title_disable
    
    /// 图片+文字(正常状态)
    case image_title
    
    /// 图片+文字(正常状态 + 禁用状态)
    case image_title_disable
}

/// UIBarButtonItem样式内容
public struct UIBarButtonItemContent: YSCoreProtocol{
    
    private(set) var imageName = ""
    
    private(set) var imageName_disable = ""
    
    private(set) var title = ""
    
    private(set) var title_disable = ""
    
    private(set) var titleColor:UIColor = .clear
    
    private(set) var titleColor_disable:UIColor = .clear
    
    private(set) var font:UIFont = UIFont.systemFont(ofSize: 13)
    
    internal init() {}
    
    /// 正常状态
    fileprivate init(imageName: String, title: String, titleColor: UIColor, font: UIFont = UIFont.systemFont(ofSize: 13)) {
        self.imageName = imageName
        self.title = title
        self.titleColor = titleColor
        self.font = font
    }
    
    /// 正常状态+禁用状态
    fileprivate init(imageName: String, title: String, titleColor: UIColor, font: UIFont = UIFont.systemFont(ofSize: 13), imageName_disable: String,  title_disable: String,  titleColor_disable: UIColor){
        self.imageName = imageName
        self.title = title
        self.titleColor = titleColor
        self.font = font
        self.imageName_disable = imageName_disable
        self.title_disable = title_disable
        self.titleColor_disable = titleColor_disable
    }
}

public extension YSOriginalObjectProtocol where OriginalObjectType == UIBarButtonItemContent{
    
    /// 正常状态
    static func create(imageName: String, title: String, titleColor: UIColor, font: UIFont = UIFont.systemFont(ofSize: 13)) -> OriginalObjectType{
        return UIBarButtonItemContent(imageName: imageName, title: title, titleColor: titleColor, font: font)
    }
    
    /// 正常状态+禁用状态
    static func create(imageName: String, title: String, titleColor: UIColor, imageName_disable: String,  title_disable: String,  titleColor_disable: UIColor) -> OriginalObjectType{
        return UIBarButtonItemContent(imageName: imageName, title: title, titleColor: titleColor, font: UIFont.systemFont(ofSize: 13), imageName_disable: imageName_disable, title_disable: title_disable, titleColor_disable: titleColor_disable)
    }
    
    /// 正常状态+禁用状态
    static func create(imageName: String, title: String, titleColor: UIColor, imageName_disable: String,  title_disable: String,  titleColor_disable: UIColor, font: UIFont) -> OriginalObjectType{
        return UIBarButtonItemContent(imageName: imageName, title: title, titleColor: titleColor, font: font, imageName_disable: imageName_disable, title_disable: title_disable, titleColor_disable: titleColor_disable)
    }
}

public extension YSOriginalObjectProtocol where OriginalObjectType == UIBarButtonItem{
    
    static func create(alignment: UIControl.ContentHorizontalAlignment, style: UIBarButtonItemStyle, content: UIBarButtonItemContent, target: Any, action: Selector) -> OriginalObjectType{
        let btn = UIButton().ys.then{
            $0.contentHorizontalAlignment = alignment
            $0.addTarget(target, action: action, for: .touchUpInside)
            $0.adjustsImageWhenHighlighted = false
            switch style{
            case .image:
                $0.frame = CGRect(x: 0, y: 0, width: InternalConst.navHeight, height: InternalConst.navHeight)
                $0.setImage(UIImage(named: content.imageName), for: .normal)
            case .image_disable:
                $0.frame = CGRect(x: 0, y: 0, width: InternalConst.navHeight, height: InternalConst.navHeight)
                $0.setImage(UIImage(named: content.imageName), for: .normal)
                $0.setImage(UIImage(named: content.imageName_disable), for: .disabled)
            case .title:
                $0.frame.origin = CGPoint(x: 0, y: 0)
                $0.frame.size.height = InternalConst.navHeight
                $0.titleLabel?.font = content.font
                $0.setTitle(content.title, for: .normal)
                $0.setTitleColor(content.titleColor, for: .normal)
            case .title_disable:
                $0.frame.origin = CGPoint(x: 0, y: 0)
                $0.frame.size.height = InternalConst.navHeight
                $0.titleLabel?.font = content.font
                $0.setTitle(content.title, for: .normal)
                $0.setTitleColor(content.titleColor, for: .normal)
                $0.setTitle(content.title_disable, for: .disabled)
                $0.setTitleColor(content.titleColor_disable, for: .disabled)
            case .image_title:
                $0.frame.origin = CGPoint(x: 0, y: 0)
                $0.frame.size.height = InternalConst.navHeight
                $0.setImage(UIImage(named: content.imageName), for: .normal)
                $0.titleLabel?.font = content.font
                $0.setTitle(content.title, for: .normal)
                $0.setTitleColor(content.titleColor, for: .normal)
            case .image_title_disable:
                $0.frame.origin = CGPoint(x: 0, y: 0)
                $0.frame.size.height = InternalConst.navHeight
                $0.setImage(UIImage(named: content.imageName), for: .normal)
                $0.setImage(UIImage(named: content.imageName_disable), for: .disabled)
                $0.titleLabel?.font = content.font
                $0.setTitle(content.title, for: .normal)
                $0.setTitleColor(content.titleColor, for: .normal)
                $0.setTitle(content.title_disable, for: .disabled)
                $0.setTitleColor(content.titleColor_disable, for: .disabled)
            }
        }
        return UIBarButtonItem.ys.create(customV: btn)
    }
}

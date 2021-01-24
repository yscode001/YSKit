//
//  UIColor+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType == UIColor{
    
    static func create(hex: __int32_t) -> OriginalObjectType{
        let red = (hex & 0xFF0000) >> 16
        let green = (hex & 0x00FF00) >> 8
        let blue = (hex & 0x0000FF)
        return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
    }
    
    static func create(hex: __int32_t, alpha: CGFloat) -> OriginalObjectType{
        let red = (hex & 0xFF0000) >> 16
        let green = (hex & 0x00FF00) >> 8
        let blue = (hex & 0x0000FF)
        return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }
    
    static func create(red: CShort, green: CShort, blue: CShort) -> OriginalObjectType{
        return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
    }
    
    static func create(red: CShort, green: CShort, blue: CShort, alpha: CGFloat) -> OriginalObjectType{
        return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }
    
    /// 根据图片以平铺方式创建颜色对象
    static func create(img: UIImage) -> OriginalObjectType{
        return UIColor(patternImage: img)
    }
    
    /// 随机颜色
    static func createRandom() -> OriginalObjectType{
        let red = ((0...9999).randomElement() ?? 0) % 256
        let green = ((0...9999).randomElement() ?? 0) % 256
        let blue = ((0...9999).randomElement() ?? 0) % 256
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
}

@available(iOS 11.0, *)
public extension YSOriginalObjectProtocol where OriginalObjectType == UIColor{
    
    /// 默认值为透明色
    static func create(named: String?) -> OriginalObjectType{
        if let n = named, let c = UIColor(named: n){
            return c
        }
        return UIColor.clear
    }
    
    static func create(named: String?, default defaultColor: UIColor) -> OriginalObjectType{
        if let n = named, let c = UIColor(named: n){
            return c
        }
        return defaultColor
    }
}

public extension YSOriginalObjectProtocol where OriginalObjectType == UIColor{
    
    /// 暗黑颜色适配，iOS13以下使用light
    static func create(light: UIColor, other: UIColor) -> OriginalObjectType{
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light{
                    return light
                } else{
                    return other
                }
            }
        } else{
            return light
        }
    }
    
    /// 暗黑颜色适配，iOS13以下使用other
    static func create(dark: UIColor, other: UIColor) -> OriginalObjectType{
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark{
                    return dark
                } else{
                    return other
                }
            }
        } else{
            return other
        }
    }
}

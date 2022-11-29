//
//  Color.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    static func color(hex: __int32_t) -> UIColor{
        let red = (hex & 0xFF0000) >> 16
        let green = (hex & 0x00FF00) >> 8
        let blue = (hex & 0x0000FF)
        return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
    }
    
    static func color(hex: __int32_t, alpha: CGFloat) -> UIColor{
        let red = (hex & 0xFF0000) >> 16
        let green = (hex & 0x00FF00) >> 8
        let blue = (hex & 0x0000FF)
        return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }
    
    static func color(red: CShort, green: CShort, blue: CShort) -> UIColor{
        return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
    }
    
    static func color(red: CShort, green: CShort, blue: CShort, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }
    
    /// 根据图片以平铺方式创建颜色对象
    static func color(img: UIImage) -> UIColor{
        return UIColor(patternImage: img)
    }
    
    /// 随机颜色
    static func colorRandom() -> UIColor{
        let red = ((0...9999).randomElement() ?? 0) % 256
        let green = ((0...9999).randomElement() ?? 0) % 256
        let blue = ((0...9999).randomElement() ?? 0) % 256
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
}

@available(iOS 11.0, *)
public extension Ctor{
    
    /// 默认值为透明色
    static func color(named: String?) -> UIColor{
        if let n = named, let c = UIColor(named: n){
            return c
        }
        return UIColor.clear
    }
    
    static func color(named: String?, default defaultColor: UIColor) -> UIColor{
        if let n = named, let c = UIColor(named: n){
            return c
        }
        return defaultColor
    }
}

public extension Ctor{
    
    /// 暗黑颜色适配，iOS13以下使用light
    static func color(light: UIColor, other: UIColor) -> UIColor{
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
    static func color(dark: UIColor, other: UIColor) -> UIColor{
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

//
//  Color.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

class Color{
    
    /// 根据16进制创建颜色
    class func create(darkHex: __int32_t, darkAlpha: CGFloat = 1, lightHex: __int32_t, lightAlpha: CGFloat = 1) -> UIColor{
        let dark = Ctor.color(hex: darkHex, alpha: darkAlpha)
        let light = Ctor.color(hex: lightHex, alpha: lightAlpha)
        return Ctor.color(dark: dark, other: light)
    }
    
    class func create(lightHex: __int32_t, lightAlpha: CGFloat = 1) -> UIColor{
        return Ctor.color(hex: lightHex, alpha: lightAlpha)
    }
}

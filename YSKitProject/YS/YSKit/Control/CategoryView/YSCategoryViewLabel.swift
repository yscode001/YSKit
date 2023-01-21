//
//  YSCategoryViewLabel.swift
//  YSCategoryView
//
//  Created by 姚帅 on 2018/6/27.
//  Copyright © 2018年 YS. All rights reserved.
//

import UIKit

/// 分类视图Item
internal class YSCategoryViewLabel: UILabel {
    
    /// 选中状态
    internal var isSelected:Bool = false{
        didSet{
            if isSelected{
                font = font_selected
                textColor = createColor(color: color_selected)
                transform = CGAffineTransform(scaleX: maxScale, y: maxScale)
            } else{
                font = font_
                textColor = createColor(color: color)
                transform = CGAffineTransform.identity
            }
        }
    }
    
    /// 最大缩放比
    internal var maxScale:CGFloat = 1.2
    
    /// 正常状态下的颜色
    internal var color = YSCategoryViewColor.ys.create(lightRed: 180, lightGreen: 180, lightBlue: 180, darkRed: 180, darkGreen: 180, darkBlue: 180)
    
    /// 选中状态下的颜色
    internal var color_selected = YSCategoryViewColor.ys.create(lightRed: 0, lightGreen: 0, lightBlue: 0, darkRed: 0, darkGreen: 0, darkBlue: 0)
    
    /// 正常状态下的字体
    internal var font_:UIFont = UIFont.systemFont(ofSize: 14)
    
    /// 选中状态下的字体
    internal var font_selected:UIFont = UIFont.systemFont(ofSize: 14)
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 初始化
    internal convenience init(maxScale: CGFloat, font: UIFont, font_selected: UIFont, color: YSCategoryViewColor, color_selected: YSCategoryViewColor) {
        self.init()
        self.isUserInteractionEnabled = true
        self.textAlignment = .center
        self.font = font
        self.textColor = createColor(color: color)
        
        self.maxScale = maxScale
        self.color = color
        self.color_selected = color_selected
        self.font_ = font
        self.font_selected = font_selected
    }
    
    /// 创建颜色
    private func createColor(color: YSCategoryViewColor) -> UIColor{
        let light = UIColor(red: CGFloat(color.lightRed) / 255, green: CGFloat(color.lightGreen) / 255, blue: CGFloat(color.lightBlue) / 255, alpha: 1)
        let dark = UIColor(red: CGFloat(color.darkRed) / 255, green: CGFloat(color.darkGreen) / 255, blue: CGFloat(color.darkBlue) / 255, alpha: 1)
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark{
                    return dark
                } else{
                    return light
                }
            }
        } else{
            return light
        }
    }
    
    /// 添加点击事件
    internal func addTarget(target: Any, action: Selector){
        if let gesList = gestureRecognizers{
            for ges in gesList{
                removeGestureRecognizer(ges)
            }
        }
        let tap = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(tap)
    }
    
    /// 设置缩放比
    ///
    /// - Parameter scale: 缩放比[0,1]
    internal func setupScale(scale: CGFloat){
        if scale < 0 || scale > 1{
            return
        }
        
        // 大小缩放
        let minScale:CGFloat = 1
        let sca = minScale + (maxScale - minScale) * scale
        self.transform = CGAffineTransform(scaleX: sca, y: sca)
        
        // 颜色渐变
        let lightRed = CShort(CGFloat(color.lightRed) + CGFloat(color_selected.lightRed - color.lightRed) * scale)
        let lightGreen = CShort(CGFloat(color.lightGreen) + CGFloat(color_selected.lightGreen - color.lightGreen) * scale)
        let lightBlue = CShort(CGFloat(color.lightBlue) + CGFloat(color_selected.lightBlue - color.lightBlue) * scale)
        let darkRed = CShort(CGFloat(color.darkRed) + CGFloat(color_selected.darkRed - color.darkRed) * scale)
        let darkGreen = CShort(CGFloat(color.darkGreen) + CGFloat(color_selected.darkGreen - color.darkGreen) * scale)
        let darkBlue = CShort(CGFloat(color.darkBlue) + CGFloat(color_selected.darkBlue - color.darkBlue) * scale)
        
        let color_cal = YSCategoryViewColor.ys.create(lightRed: lightRed, lightGreen: lightGreen, lightBlue: lightBlue, darkRed: darkRed, darkGreen: darkGreen, darkBlue: darkBlue)
        textColor = createColor(color: color_cal)
    }
}

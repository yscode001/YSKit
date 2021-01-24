//
//  YSCategoryViewStyle.swift
//  YSCategoryView
//
//  Created by yaoshuai on 2018/6/21.
//  Copyright © 2018年 YS. All rights reserved.
//

import UIKit

/// 分类视图样式
public struct YSCategoryViewStyle: YSCoreProtocol{
    
    // MARK: - 国际化语音方向
    
    /// 国际化语音方向是否是从左到右
    public var languageLTR = true
    
    // MARK: - 背景色
    
    /// 背景色
    public var bgColor = UIColor.white
    
    // MARK: - 底部标示线
    
    /// 标识线颜色
    public var identifierLineColor = UIColor.red
    
    /// 标识线size，如果width <= 0，宽度随条目走
    public var identifyerLineSize = CGSize(width: 20, height: 3)
    
    /// 标识线与底部的距离
    public var identifyerLineBottomDistance:CGFloat = 4
    
    /// 标识线拖动动画
    public var identifierLineAnimationType:YSCategoryViewAnimationType = .stretch
    
    // MARK: - 底部边线
    
    /// 底部边线颜色
    public var bottomLineColor = UIColor.gray
    
    /// 底部边线高度
    public var bottomLineHeight:CGFloat = 1
    
    // MARK: - 正常状态、选中状态下的文字
    
    /// 正常状态下文字颜色
    public var textColor = YSCategoryViewColor.ys.create(lightRed: 180, lightGreen: 180, lightBlue: 180, darkRed: 180, darkGreen: 180, darkBlue: 180)
    
    /// 选中状态下文字颜色
    public var textColor_selected = YSCategoryViewColor.ys.create(lightRed: 0, lightGreen: 0, lightBlue: 0, darkRed: 0, darkGreen: 0, darkBlue: 0)
    
    /// 正常状态字体
    public var font = UIFont.systemFont(ofSize: 14)
    
    /// 选中状态字体
    public var font_selected = UIFont.systemFont(ofSize: 14)
    
    // MARK: - 最大缩放比
    
    /// 最大缩放比例
    public var maxScale:CGFloat = 1.2
    
    // MARK: - item相关
    
    /// item间距
    public var itemMargin:CGFloat = 15
    
    /// item宽度，<=0表示自适应
    public var itemWidth:CGFloat = 0
    
    // MARK: - 渐变
    
    /// 滑动的时候是否允许渐变(颜色与缩放比)
    public var allowGradual = true
    
    // MARK: - 初始化
    
    fileprivate init() {}
    
    fileprivate init(languageLTR: Bool, bgColor: UIColor, identifierLineColor: UIColor, identifyerLineSize: CGSize, identifyerLineBottomDistance: CGFloat, identifierLineAnimationType: YSCategoryViewAnimationType, bottomLineColor: UIColor, bottomLineHeight: CGFloat, textColor: YSCategoryViewColor, textColor_selected: YSCategoryViewColor, font: UIFont, font_selected: UIFont, maxScale: CGFloat, itemMargin: CGFloat, itemWidth: CGFloat, allowGradual: Bool) {
        self.languageLTR = languageLTR
        self.bgColor = bgColor
        self.identifierLineColor = identifierLineColor
        self.identifyerLineSize = identifyerLineSize
        self.identifyerLineBottomDistance = identifyerLineBottomDistance
        self.identifierLineAnimationType = identifierLineAnimationType
        self.bottomLineColor = bottomLineColor
        self.bottomLineHeight = bottomLineHeight
        self.textColor = textColor
        self.textColor_selected = textColor_selected
        self.font = font
        self.font_selected = font_selected
        self.maxScale = maxScale
        self.itemMargin = itemMargin
        self.itemWidth = itemWidth
        self.allowGradual = allowGradual
    }
}

public extension YSOriginalObject where OriginalObjectType == YSCategoryViewStyle{
    
    /// 创建默认样式
    static func create() -> YSCategoryViewStyle{
        return YSCategoryViewStyle()
    }
    
    /// 创建自定义样式
    static func create(languageLTR: Bool, bgColor: UIColor, identifierLineColor: UIColor, identifyerLineSize: CGSize, identifyerLineBottomDistance: CGFloat, identifierLineAnimationType: YSCategoryViewAnimationType, bottomLineColor: UIColor, bottomLineHeight: CGFloat, textColor: YSCategoryViewColor, textColor_selected: YSCategoryViewColor, font: UIFont, font_selected: UIFont, maxScale: CGFloat, itemMargin: CGFloat, itemWidth: CGFloat, allowGradual: Bool) -> YSCategoryViewStyle{
        return YSCategoryViewStyle(languageLTR: languageLTR, bgColor: bgColor, identifierLineColor: identifierLineColor, identifyerLineSize: identifyerLineSize, identifyerLineBottomDistance: identifyerLineBottomDistance, identifierLineAnimationType: identifierLineAnimationType, bottomLineColor: bottomLineColor, bottomLineHeight: bottomLineHeight, textColor: textColor, textColor_selected: textColor_selected, font: font, font_selected: font_selected, maxScale: maxScale, itemMargin: itemMargin, itemWidth: itemWidth, allowGradual: allowGradual)
    }
}

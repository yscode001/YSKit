//
//  YSRadiusInformation+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/26.
//

import Foundation

public extension YSOriginalProtocol where OriginalType == YSRadiusInformation{
    
    /// 创建圆角信息
    static func create(radius: CGFloat, radiusInnerColor: UIColor, radiusBorderWidth: CGFloat, radiusBorderColor: UIColor, radiusOuterColor: UIColor) -> YSRadiusInformation {
        return YSRadiusInformation(radius: radius, radiusInnerColor: radiusInnerColor, radiusBorderWidth: radiusBorderWidth, radiusBorderColor: radiusBorderColor, radiusOuterColor: radiusOuterColor)
    }
    
    /// 清除指定区域，view背景色需是clear，否则清除之后会显色黑色
    func drawInfoView_clearRect(rect: CGRect){
        originalObj.drawInfoView_clearRect(rect: rect)
    }
    
    /// 绘制圆角区域内的颜色
    func drawIntoView_radiusInnerRect(rect: CGRect){
        originalObj.drawIntoView_radiusInnerRect(rect: rect)
    }
    
    /// 绘制圆角区域外面边框的颜色
    func drawIntoView_borderArea(rect: CGRect){
        originalObj.drawIntoView_borderArea(rect: rect)
    }
    
    /// 绘制圆角区域外面边框的外面的4个角的颜色
    func drawIntoView_radiusOuterRect(rect: CGRect){
        originalObj.drawIntoView_radiusOuterRect(rect: rect)
    }
}

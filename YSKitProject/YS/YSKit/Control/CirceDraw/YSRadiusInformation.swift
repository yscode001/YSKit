//
//  YSRadiusInformation.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/26.
//

import Foundation
import CoreGraphics

public struct YSRadiusInformation: YSCoreProtocol{
    
    /// 圆角值
    var radius: CGFloat = 0
    
    /// 圆角区域内的填充颜色
    var radiusInnerColor: UIColor = .clear
    
    /// 圆角区域外面的边框的线宽
    var radiusBorderWidth: CGFloat = 0
    
    /// 圆角区域外面的边框的填充颜色
    var radiusBorderColor: UIColor = .clear
    
    /// 圆角区域外面的边框的外面的4个角的填充颜色
    var radiusOuterColor: UIColor = .clear
}

extension YSRadiusInformation{
    
    /// 获取圆角区域内的rect
    private func getRadiusInnerRect(rect: CGRect) -> CGRect{
        return rect.insetBy(dx: radiusBorderWidth, dy: radiusBorderWidth)
    }
    
    /// 清除指定区域，view背景色需是clear，否则清除之后会显色黑色
    func drawInfoView_clearRect(rect: CGRect){
        UIGraphicsGetCurrentContext()?.clear(rect)
    }
    
    /// 绘制圆角区域内的颜色
    func drawIntoView_radiusInnerRect(rect: CGRect){
        if radiusInnerColor != .clear{
            let radiusPath = UIBezierPath(roundedRect: getRadiusInnerRect(rect: rect), cornerRadius: radius)
            radiusInnerColor.setFill()
            radiusPath.fill()
        }
    }
    
    /// 绘制圆角区域外面边框的颜色
    func drawIntoView_borderArea(rect: CGRect){
        if radiusBorderWidth > 0 && radiusBorderColor != .clear{
            let radiusPath = UIBezierPath(roundedRect: getRadiusInnerRect(rect: rect), cornerRadius: radius)
            let borderPath = UIBezierPath(roundedRect: rect, cornerRadius: radius)
            borderPath.append(radiusPath.reversing())
            borderPath.lineWidth = radiusBorderWidth
            borderPath.lineCapStyle = .round
            borderPath.lineJoinStyle = .round
            radiusBorderColor.setFill()
            borderPath.fill()
        }
    }
    
    /// 绘制圆角区域外面边框的外面的4个角的颜色
    func drawIntoView_radiusOuterRect(rect: CGRect){
        if radius > 0{
            let outerPath = UIBezierPath(rect: rect)
            outerPath.append(UIBezierPath(roundedRect: rect, cornerRadius: radius).reversing())
            radiusOuterColor.setFill()
            outerPath.fill()
        }
    }
}

//
//  YSRedPointV.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/10.
//

import UIKit

/// 小红点视图
public class YSRedPointV: UIView {
    
    private var badgeColor:UIColor = UIColor.red
    
    private var borderColor:UIColor = UIColor.clear
    
    private var borderWidth:CGFloat = 0
    
    /// 最小直径
    private var minDiameter:CGFloat = 6
    
    /// 水平方向偏移量
    private var horizontalOffset:CGFloat = 0
    
    /// 垂直方向偏移量
    private var verticalOffset:CGFloat = 0
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        isOpaque = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// 获取圆角区域内的rect
    private func getRadiusInnerRect(rect: CGRect) -> CGRect{
        return rect.insetBy(dx: borderWidth, dy: borderWidth)
    }
    
    override public func draw(_ rect: CGRect) {
        UIGraphicsGetCurrentContext()?.clear(rect)
        
        // 边框圆角值
        let borderRadius = minDiameter * 0.5
        
        // 填充区域圆角值
        let innerRadius = (minDiameter - borderWidth) * 0.5
        
        // 边框
        if borderWidth > 0 && borderColor != .clear{
            let radiusPath = UIBezierPath(roundedRect: getRadiusInnerRect(rect: rect), cornerRadius: innerRadius)
            let borderPath = UIBezierPath(roundedRect: rect, cornerRadius: borderRadius)
            borderPath.append(radiusPath.reversing())
            borderPath.lineWidth = borderWidth
            borderPath.lineCapStyle = .round
            borderPath.lineJoinStyle = .round
            borderColor.setFill()
            borderPath.fill()
        }
        
        // 填充区域
        if badgeColor != .clear{
            let radiusPath = UIBezierPath(roundedRect: getRadiusInnerRect(rect: rect), cornerRadius: innerRadius)
            badgeColor.setFill()
            radiusPath.fill()
        }
    }
}

// MARK: - 设置样式
extension YSRedPointV{
    
    /// 布局
    func updateRedPointViewFrame(){
        guard let sv = superview else{
            return
        }
        
        // 删除旧约束
        NSLayoutConstraint.deactivate(constraints)
        removeConstraints(constraints)
        
        // 重新布局
        addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: minDiameter))
        addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: minDiameter))
        sv.addConstraint(NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: sv, attribute: .top, multiplier: 1, constant: verticalOffset))
        sv.addConstraint(NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: sv, attribute: .trailing, multiplier: 1, constant:  horizontalOffset))
    }
    
    /// 设置样式
    func setupStyle(badgeColor: UIColor, borderColor: UIColor?, borderWidth: CGFloat?, minDiameter: CGFloat, horizontalOffset: CGFloat?, verticalOffset: CGFloat?) {
        self.badgeColor = badgeColor
        if borderColor != nil{self.borderColor = borderColor!}
        if borderWidth != nil{self.borderWidth = borderWidth!}
        self.minDiameter = minDiameter
        if horizontalOffset != nil{self.horizontalOffset = horizontalOffset!}
        if verticalOffset != nil{self.verticalOffset = verticalOffset!}
    }
}

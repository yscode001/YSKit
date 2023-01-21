//
//  YSBadgeView.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/29.
//

import UIKit

/// 角标视图
public class YSBadgeView: UIView {
    
    private var font:UIFont = UIFont.systemFont(ofSize: 12)
    
    private var textColor:UIColor = UIColor.white
    
    private var badgeColor:UIColor = UIColor.red
    
    private var borderColor:UIColor = UIColor.gray
    
    private var borderWidth:CGFloat = 0
    
    /// 最小直径
    private var minDiameter:CGFloat = 20
    
    /// 水平方向偏移量
    private var horizontalOffset:CGFloat = 0
    
    /// 垂直方向偏移量
    private var verticalOffset:CGFloat = 0
    
    /// 数字与边界的距离
    private var innerSpaceFromBorder:CGFloat = 3
    
    // badget的ag值
    private let badgeTag = 98769876
    
    /// 默认X的布局偏移
    private let defaultLayoutX:CGFloat = 6
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        isOpaque = true
        tag = badgeTag
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateBadgeViewFrame(badgeVal: String){
        guard let sv = superview else{
            return
        }
        
        let numberSize = badgeVal.size(withAttributes: [NSAttributedString.Key.font:font,NSAttributedString.Key.foregroundColor:textColor])
        var badgeHeight:CGFloat
        var badgeWidth:CGFloat
        if badgeValue.count > 1{ // 两位数及以上，椭圆
            badgeHeight = max(innerSpaceFromBorder * 2.0 + numberSize.height + borderWidth, minDiameter)
            badgeWidth = max(innerSpaceFromBorder * 2.0 + numberSize.width + borderWidth, minDiameter)
        } else{ // 一位数，正圆
            badgeHeight = max(innerSpaceFromBorder * 2.0 + numberSize.height + borderWidth, minDiameter)
            badgeWidth = badgeHeight
        }
        
        // 删除旧约束
        NSLayoutConstraint.deactivate(constraints)
        removeConstraints(constraints)
        
        // 重新布局
        addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: badgeWidth))
        addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: badgeHeight))
        sv.addConstraint(NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: sv, attribute: .top, multiplier: 1, constant: verticalOffset))
        sv.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: sv, attribute: .trailing, multiplier: 1, constant: defaultLayoutX + horizontalOffset))
    }
    
    override public func draw(_ rect: CGRect) {
        if badgeValue.count <= 0{
            return
        }
        // 边框
        if borderWidth > 0{
            let borderPath = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.5)
            borderColor.setFill()
            borderPath.fill()
        }
        // badge填充色
        let badgeRect = rect.insetBy(dx: borderWidth, dy: borderWidth)
        let badgePath = UIBezierPath(roundedRect: badgeRect, cornerRadius: badgeRect.height * 0.5)
        badgeColor.setFill()
        badgePath.fill()
        // 数字
        let numberSize = badgeValue.size(withAttributes: [NSAttributedString.Key.font:font,NSAttributedString.Key.foregroundColor:textColor])
        let numRect = CGRect(x: (rect.width - numberSize.width) * 0.5, y: (rect.height - numberSize.height) * 0.5, width: numberSize.width, height: numberSize.height)
        let paragrapStyle = NSMutableParagraphStyle()
        paragrapStyle.lineBreakMode = .byClipping
        paragrapStyle.alignment = .center
        textColor.set()
        (badgeValue as NSString).draw(in: numRect, withAttributes: [NSAttributedString.Key.font:font,NSAttributedString.Key.paragraphStyle:paragrapStyle,NSAttributedString.Key.foregroundColor:textColor])
    }
    
    // MARK: - badge的值
    
    /// badge的值
    var badgeValue:String = ""{
        didSet{
            updateBadgeViewFrame(badgeVal: badgeValue)
            setNeedsDisplay()
        }
    }
}

// MARK: - 设置样式
extension YSBadgeView{
    
    /// 设置样式
    func setupStyle(font:UIFont?, textColor:UIColor?, badgeColor:UIColor?, borderColor:UIColor?, borderWidth:CGFloat?, minDiameter:CGFloat?, horizontalOffset:CGFloat?, verticalOffset:CGFloat?, innerSpaceFromBorder:CGFloat?) {
        if font != nil{self.font = font!}
        if textColor != nil{self.textColor = textColor!}
        if badgeColor != nil{self.badgeColor = badgeColor!}
        if borderColor != nil{self.borderColor = borderColor!}
        if borderWidth != nil{self.borderWidth = borderWidth!}
        if minDiameter != nil{self.minDiameter = minDiameter!}
        if horizontalOffset != nil{self.horizontalOffset = horizontalOffset!}
        if verticalOffset != nil{self.verticalOffset = verticalOffset!}
        if innerSpaceFromBorder != nil{self.innerSpaceFromBorder = innerSpaceFromBorder!}
    }
}

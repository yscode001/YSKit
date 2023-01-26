//
//  UIView+badge.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/29.
//

import Foundation

public extension YSOriginalProtocol where OriginalType: UIView{
    
    private var badgeView:YSBadgeView{
        let badgev = originalObj.subviews.first { (subv) -> Bool in
            return subv.isKind(of: YSBadgeView.self)
        }
        guard let badgeView = badgev as? YSBadgeView else {
            let newBadgeV = YSBadgeView()
            originalObj.addSubview(newBadgeV)
            return newBadgeV
        }
        return badgeView
    }
    
    /// 设置badge的值
    func badge(value: String){
        badgeView.badgeValue = value
        badgeView.isHidden = value.count <= 0
        if value.count <= 0 && originalObj.subviews.contains(badgeView){
            originalObj.sendSubviewToBack(badgeView)
        } else if value.count > 0 && originalObj.subviews.contains(badgeView){
            originalObj.bringSubviewToFront(badgeView)
        }
    }
    
    /// 设置badge的样式
    func badge(value: String, font: UIFont?, textColor:UIColor?, badgeColor: UIColor?, borderColor:  UIColor?, borderWidth: CGFloat?, minDiameter: CGFloat?, horizontalOffset: CGFloat?, verticalOffset: CGFloat?, innerSpaceFromBorder: CGFloat?){
        badgeView.setupStyle(font: font, textColor: textColor, badgeColor: badgeColor, borderColor: borderColor, borderWidth: borderWidth, minDiameter: minDiameter, horizontalOffset: horizontalOffset, verticalOffset: verticalOffset, innerSpaceFromBorder: innerSpaceFromBorder)
        badge(value: value)
    }
}

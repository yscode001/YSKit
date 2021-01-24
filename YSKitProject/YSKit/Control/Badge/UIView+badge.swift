//
//  UIView+badge.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/29.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType: UIView{
    
    private var badgeView:YSBadgeView{
        let badgev = originalObject.subviews.first { (subv) -> Bool in
            return subv.isKind(of: YSBadgeView.self)
        }
        guard let badgeView = badgev as? YSBadgeView else {
            let newBadgeV = YSBadgeView()
            originalObject.addSubview(newBadgeV)
            return newBadgeV
        }
        return badgeView
    }
    
    /// 设置badge的值
    func badge(value: String){
        if value.count <= 0{
            badgeView.isHidden = true
            if originalObject.subviews.contains(badgeView){
                originalObject.sendSubviewToBack(badgeView)
            }
        } else{
            badgeView.isHidden = false
            badgeView.badgeValue = value
            if originalObject.subviews.contains(badgeView){
                originalObject.bringSubviewToFront(badgeView)
            }
        }
    }
    
    /// 设置badge的样式
    func badge(value: String, font: UIFont?, textColor:UIColor?, badgeColor: UIColor?, borderColor:  UIColor?, borderWidth: CGFloat?, minDiameter: CGFloat?, horizontalOffset: CGFloat?, verticalOffset: CGFloat?, innerSpaceFromBorder: CGFloat?){
        badgeView.setupStyle(font: font, textColor: textColor, badgeColor: badgeColor, borderColor: borderColor, borderWidth: borderWidth, minDiameter: minDiameter, horizontalOffset: horizontalOffset, verticalOffset: verticalOffset, innerSpaceFromBorder: innerSpaceFromBorder)
        badge(value: value)
    }
}

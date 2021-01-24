//
//  UIView+redPoint.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/10.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType: UIView{
    
    private var redPointView:YSRedPointV{
        let redPointV = originalObject.subviews.first { (subv) -> Bool in
            return subv.isKind(of: YSRedPointV.self)
        }
        guard let redPView = redPointV as? YSRedPointV else {
            let newRedPV = YSRedPointV()
            originalObject.addSubview(newRedPV)
            return newRedPV
        }
        return redPView
    }
    
    /// 设置redPoint
    func redPoint(show: Bool){
        if show{
            redPointView.isHidden = false
            if originalObject.subviews.contains(redPointView){
                originalObject.bringSubviewToFront(redPointView)
            }
        } else{
            redPointView.isHidden = true
            if originalObject.subviews.contains(redPointView){
                originalObject.sendSubviewToBack(redPointView)
            }
        }
        redPointView.updateRedPointViewFrame()
    }
    
    /// 设置redPoint
    func redPoint(show: Bool, badgeColor:UIColor, borderColor:UIColor?, borderWidth:CGFloat?, minDiameter:CGFloat, horizontalOffset:CGFloat?, verticalOffset:CGFloat?){
        redPointView.setupStyle(badgeColor: badgeColor, borderColor: borderColor, borderWidth: borderWidth, minDiameter: minDiameter, horizontalOffset: horizontalOffset, verticalOffset: verticalOffset)
        redPoint(show: show)
    }
}

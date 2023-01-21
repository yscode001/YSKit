//
//  UIView+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/30.
//

import UIKit

// MARK: - 子视图管理
public extension YSOriginalProtocol where OriginalType: UIView{
    
    /// 批量添加子视图
    func addSubviews(_ subviews: UIView...){
        for subV in subviews{
            originalObj.addSubview(subV)
        }
    }
    
    /// 批量添加子视图
    func addSubviews(_ subviewArray: [UIView]){
        for subV in subviewArray{
            originalObj.addSubview(subV)
        }
    }
    
    /// 移除全部子视图
    func removeAllSubviews(){
        for subV in originalObj.subviews.reversed(){
            subV.removeFromSuperview()
        }
    }
    
    /// 移除部分子视图
    func removeSomeSubviews(tags: Int...){
        let subvs = originalObj.subviews.filter{ tags.contains($0.tag) }
        for subV in subvs.reversed(){
            subV.removeFromSuperview()
        }
    }
    
    /// 移除部分子视图
    func removeSomeSubviews(tagArray: [Int]){
        let subvs = originalObj.subviews.filter{ tagArray.contains($0.tag) }
        for subV in subvs.reversed(){
            subV.removeFromSuperview()
        }
    }
    
    /// 移除部分子视图
    func removeSomeSubviews(subviews: UIView...){
        let subvs = originalObj.subviews.filter{ subviews.contains($0) }
        for subV in subvs.reversed(){
            subV.removeFromSuperview()
        }
    }
    
    /// 移除部分子视图
    func removeSomeSubviews(subviewArray: [UIView]){
        let subvs = originalObj.subviews.filter{ subviewArray.contains($0) }
        for subV in subvs.reversed(){
            subV.removeFromSuperview()
        }
    }
}

public extension YSOriginalProtocol where OriginalType: UIView{
    
    /// 添加点击手势
    func addTapListener(target: Any, action: Selector){
        if let taps = originalObj.gestureRecognizers{
            let tapsfilter = taps.filter{ $0 is UITapGestureRecognizer }
            for tap in tapsfilter.reversed(){
                originalObj.removeGestureRecognizer(tap)
            }
        }
        originalObj.isUserInteractionEnabled = true
        originalObj.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
    }
    
    /// 快照
    func snapshot(complete: @escaping((UIImage?) -> ())){
        if originalObj.bounds.size.width <= 0 || originalObj.bounds.size.height <= 0{
            complete(nil)
        } else{
            UIGraphicsBeginImageContextWithOptions(originalObj.bounds.size, false, 0)
            originalObj.drawHierarchy(in: originalObj.bounds, afterScreenUpdates: true)
            let img = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            complete(img)
        }
    }
    
    /// 添加圆形遮罩
    func addCycleMaskLayer(rect: CGRect){
        if rect.width <= 0 || rect.height <= 0{
            return
        }
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(ovalIn: rect).cgPath
        originalObj.layer.mask = shapeLayer
    }
}

extension UIView{
    
    /// 是否可以执行，常用于UIButton的防重点
    public final var canClick: Bool {
        set {
            objc_setAssociatedObject(self, AssociateKeys.canClick, newValue, .OBJC_ASSOCIATION_ASSIGN)
        } get {
            if let canExe = objc_getAssociatedObject(self, AssociateKeys.canClick) as? Bool{
                return canExe
            } else{
                self.canClick = true
                return true
            }
        }
    }
}

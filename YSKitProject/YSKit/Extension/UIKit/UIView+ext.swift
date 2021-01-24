//
//  UIView+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/30.
//

import UIKit

// MARK: - 子视图管理
public extension YSOriginalObjectProtocol where OriginalObjectType: UIView{
    
    /// 批量添加子视图
    func addSubviews(_ subviews: UIView...){
        for subV in subviews{
            originalObject.addSubview(subV)
        }
    }
    
    /// 批量添加子视图
    func addSubviews(_ subviewList: [UIView]){
        for subV in subviewList{
            originalObject.addSubview(subV)
        }
    }
    
    /// 移除全部子视图
    func removeAllSubviews(){
        for subView in originalObject.subviews.reversed(){
            subView.removeFromSuperview()
        }
    }
    
    /// 移除部分子视图
    func removeSomeSubviews(tags: Int...){
        let subvs = originalObject.subviews.filter{ tags.contains($0.tag) }
        for subView in subvs.reversed(){
            subView.removeFromSuperview()
        }
    }
    
    /// 移除部分子视图
    func removeSomeSubviews(tagList: [Int]){
        let subvs = originalObject.subviews.filter{ tagList.contains($0.tag) }
        for subView in subvs.reversed(){
            subView.removeFromSuperview()
        }
    }
    
    /// 移除部分子视图
    func removeSomeSubviews(subviews: UIView...){
        let subvs = originalObject.subviews.filter{ subviews.contains($0) }
        for subView in subvs.reversed(){
            subView.removeFromSuperview()
        }
    }
    
    /// 移除部分子视图
    func removeSomeSubviews(subviewList: [UIView]){
        let subvs = originalObject.subviews.filter{ subviewList.contains($0) }
        for subView in subvs.reversed(){
            subView.removeFromSuperview()
        }
    }
}

public extension YSOriginalObjectProtocol where OriginalObjectType: UIView{
    
    /// 添加点击手势
    func addTapListener(target: Any, action: Selector){
        if let taps = originalObject.gestureRecognizers{
            let tapsfilter = taps.filter{ $0 is UITapGestureRecognizer }
            for tap in tapsfilter.reversed(){
                originalObject.removeGestureRecognizer(tap)
            }
        }
        originalObject.isUserInteractionEnabled = true
        originalObject.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
    }
    
    /// 快照
    func snapshot(complete: @escaping((UIImage?) -> ())){
        if originalObject.bounds.size.width <= 0 || originalObject.bounds.size.height <= 0{
            complete(nil)
        } else{
            UIGraphicsBeginImageContextWithOptions(originalObject.bounds.size, false, 0)
            originalObject.drawHierarchy(in: originalObject.bounds, afterScreenUpdates: true)
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
        originalObject.layer.mask = shapeLayer
    }
}

extension UIView{
    
    /// 是否可以执行，常用于UIButton的防重点
    public final var canExecute: Bool {
        set {
            objc_setAssociatedObject(self, AssociateKeys.canExecute, newValue, .OBJC_ASSOCIATION_ASSIGN)
        } get {
            if let canExe = objc_getAssociatedObject(self, AssociateKeys.canExecute) as? Bool{
                return canExe
            } else{
                self.canExecute = true
                return true
            }
        }
    }
}

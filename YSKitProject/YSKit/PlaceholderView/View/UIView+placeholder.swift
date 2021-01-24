//
//  UIView+placeholder.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/24.
//

import Foundation

// MARK: - 定义placeholderView的类型

private extension UIView{
    
    /// 当前view的子视图emptyV
    var emptyV:(UIView & YSPlaceholderProtocol)?{
        let firstV = subviews.first { (subv) -> Bool in
            if let phv = subv as? YSPlaceholderProtocol, phv.placeholderType == .empty{
                return true
            }
            return false
        }
        return firstV as? (UIView & YSPlaceholderProtocol)
    }
    
    /// 当前view的子视图loadingV
    var loadingV:(UIView & YSPlaceholderProtocol)?{
        let firstV = subviews.first { (subv) -> Bool in
            if let phv = subv as? YSPlaceholderProtocol, phv.placeholderType == .loading{
                return true
            }
            return false
        }
        return firstV as? (UIView & YSPlaceholderProtocol)
    }
    
    /// 当前view的子视图errorV
    var errorV:(UIView & YSPlaceholderProtocol)?{
        let firstV = subviews.first { (subv) -> Bool in
            if let phv = subv as? YSPlaceholderProtocol, phv.placeholderType == .error{
                return true
            }
            return false
        }
        return firstV as? (UIView & YSPlaceholderProtocol)
    }
    
    /// 当前view的子视图signInV
    var signInV:(UIView & YSPlaceholderProtocol)?{
        let firstV = subviews.first { (subv) -> Bool in
            if let phv = subv as? YSPlaceholderProtocol, phv.placeholderType == .signIn{
                return true
            }
            return false
        }
        return firstV as? (UIView & YSPlaceholderProtocol)
    }
}

// MARK: - 将当前view作为placeholderView添加到其他view的身上

private extension YSPlaceholderProtocol where Self: UIView {
    
    /// 将当前view作为placeholderView添加到其他view的身上
    func placeholder_addedToSuperView(superV: UIView) {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else{ return }
            for subv in superV.subviews{
                if let phv = subv as? YSPlaceholderProtocol, phv.placeholderType == self.placeholderType{
                    subv.removeFromSuperview()
                }
            }
            self.isHidden = true
            superV.insertSubview(self, at: 0)
            
            // 布局
            self.translatesAutoresizingMaskIntoConstraints = false
            superV.addConstraint(NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superV, attribute: .leading, multiplier: 1, constant: 0))
            superV.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superV, attribute: .trailing, multiplier: 1, constant: 0))
            superV.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superV, attribute: .top, multiplier: 1, constant: 0))
            superV.addConstraint(NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superV, attribute: .bottom, multiplier: 1, constant: 0))
            if superV.isKind(of: UIScrollView.self){
                superV.addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: superV, attribute: .width, multiplier: 1, constant: 0))
                superV.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: superV, attribute: .height, multiplier: 1, constant: 0))
            }
        }
    }
}

extension YSOriginalObjectProtocol where OriginalObjectType: UIView & YSPlaceholderProtocol{
    
    /// 将当前view作为placeholderView添加到其他view的身上
    public func placeholder_addedToSuperView(superV: UIView){
        originalObject.placeholder_addedToSuperView(superV: superV)
    }
}

// MARK: - 当前view添加其他的placeholderView作为自己的子视图

extension YSOriginalObjectProtocol where OriginalObjectType: UIView{
    
    /// 当前view添加其他的placeholderView作为自己的子视图
    public func placeholder_add(_ placeholderView: (UIView & YSPlaceholderProtocol)...){
        DispatchQueue.main.async { [weak originalObject] in
            guard let originalView = originalObject else{ return }
            for subv in placeholderView{
                subv.placeholder_addedToSuperView(superV: originalView)
            }
        }
    }
    
    /// 当前view添加其他的placeholderView作为自己的子视图
    public func placeholder_add(_ placeholderViewList: [UIView & YSPlaceholderProtocol]){
        DispatchQueue.main.async { [weak originalObject] in
            guard let originalView = originalObject else{ return }
            for subv in placeholderViewList{
                subv.placeholder_addedToSuperView(superV: originalView)
            }
        }
    }
}

// MARK: - 决定placeholderView是否显示

extension YSOriginalObjectProtocol where OriginalObjectType: UIView{
    
    /// 显示某种类型的placeholderView
    public func placeholder_show(type: YSPlaceholderType){
        DispatchQueue.main.async { [weak originalObject] in
            guard let originalView = originalObject else{ return }
            if let loadingView = originalView.loadingV, loadingView.placeholderType == type, loadingView.isHidden{
                originalView.bringSubviewToFront(loadingView)
                loadingView.isHidden = false
                loadingView.doSomeThingAfter(show: true)
            }
            if let errorView = originalView.errorV, errorView.placeholderType == type, errorView.isHidden{
                originalView.bringSubviewToFront(errorView)
                errorView.isHidden = false
                errorView.doSomeThingAfter(show: true)
            }
            if let emptyView = originalView.emptyV, emptyView.placeholderType == type, emptyView.isHidden{
                originalView.bringSubviewToFront(emptyView)
                emptyView.isHidden = false
                emptyView.doSomeThingAfter(show: true)
            }
            if let signInView = originalView.signInV, signInView.placeholderType == type, signInView.isHidden{
                originalView.bringSubviewToFront(signInView)
                signInView.isHidden = false
                signInView.doSomeThingAfter(show: true)
            }
        }
    }
    
    /// 隐藏所有的placeholderView
    public func placeholder_hide(){
        DispatchQueue.main.async { [weak originalObject] in
            guard let originalView = originalObject else{ return }
            if let loadingView = originalView.loadingV, !loadingView.isHidden{
                originalView.sendSubviewToBack(loadingView)
                loadingView.isHidden = true
                loadingView.doSomeThingAfter(show: false)
            }
            if let errorView = originalView.errorV, !errorView.isHidden{
                originalView.sendSubviewToBack(errorView)
                errorView.isHidden = true
                errorView.doSomeThingAfter(show: false)
            }
            if let emptyView = originalView.emptyV, !emptyView.isHidden{
                originalView.sendSubviewToBack(emptyView)
                emptyView.isHidden = true
                emptyView.doSomeThingAfter(show: false)
            }
            if let signInView = originalView.signInV, !signInView.isHidden{
                originalView.sendSubviewToBack(signInView)
                signInView.isHidden = true
                signInView.doSomeThingAfter(show: false)
            }
        }
    }
}

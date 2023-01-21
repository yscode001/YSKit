//
//  UIViewController+ext.swift
//  Pods
//
//  Created by yaoshuai on 2020/12/30.
//

import UIKit

// MARK: - push与pop
public extension YSOriginalProtocol where OriginalType: UIViewController{
    
    /// push
    func push(_ viewController: UIViewController, animated: Bool){
        if originalObj.isKind(of: UINavigationController.self){
            (originalObj as? UINavigationController)?.pushViewController(viewController, animated: animated)
        } else{
            originalObj.navigationController?.pushViewController(viewController, animated: animated)
        }
    }
    
    /// pop
    func pop(animated: Bool){
        if originalObj.isKind(of: UINavigationController.self){
            (originalObj as? UINavigationController)?.popViewController(animated: animated)
        } else{
            originalObj.navigationController?.popViewController(animated: animated)
        }
    }
    
    /// popTo
    func popTo(_ viewController: UIViewController, animated: Bool){
        if originalObj.isKind(of: UINavigationController.self){
            (originalObj as? UINavigationController)?.popToViewController(viewController, animated: animated)
        } else{
            originalObj.navigationController?.popToViewController(viewController, animated: animated)
        }
    }
    
    /// popToRoot
    func popToRoot(animated: Bool){
        if originalObj.isKind(of: UINavigationController.self){
            (originalObj as? UINavigationController)?.popToRootViewController(animated: animated)
        } else{
            originalObj.navigationController?.popToRootViewController(animated: animated)
        }
    }
}

// MARK: - 弹框
public extension YSOriginalProtocol where OriginalType: UIViewController{
    
    /// alert弹框
    @discardableResult func alert(title: String?, message: String?, actions: [UIAlertAction]) -> UIAlertController?{
        if actions.isEmpty{
            return nil
        }
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions{
            alertVC.addAction(action)
        }
        originalObj.present(alertVC, animated: true, completion: nil)
        return alertVC
    }
    
    /// actionSheet弹框
    @discardableResult func actionSheet(title: String?, message: String?, actions: [UIAlertAction]) -> UIAlertController?{
        if actions.isEmpty{
            return nil
        }
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for action in actions{
            alertVC.addAction(action)
        }
        originalObj.present(alertVC, animated: true, completion: nil)
        return alertVC
    }
}

// MARK: - 添加子控制器
public extension YSOriginalProtocol where OriginalType: UIViewController{
    
    /// 添加子控制器
    func addChildVC(_ childVC: UIViewController, intoView: UIView, childViewFrame: CGRect? = nil){
        if originalObj.children.contains(childVC){
            return
        }
        originalObj.addChild(childVC)
        childVC.view.frame = childViewFrame ?? intoView.bounds
        intoView.addSubview(childVC.view)
        childVC.didMove(toParent: originalObj)
    }
    
    /// 批量添加子控制器
    func addChildVCList(_ childVCList: [UIViewController], intoView: UIView, childViewFrame: CGRect? = nil){
        for childVC in childVCList{
            addChildVC(childVC, intoView: intoView, childViewFrame: childViewFrame)
        }
    }
}

// MARK: - UITabBarController添加子视图
public extension YSOriginalProtocol where OriginalType: UIViewController{
    
    /// UITabBarController添加子视图
    func tabBarCAddSubview(_ subview: UIView){
        assert(originalObj.isKind(of: UITabBarController.self), "这是UITabBarController及其子类的专用方法")
        let tabbarC = originalObj as! UITabBarController
        if tabbarC.view.subviews.contains(subview){
            return
        }
        tabbarC.view.addSubview(subview)
    }
    
    /// UITabBarController添加子视图
    func tabBarCAddSubview(_ subview: UIView, selectedIdx: Int){
        assert(originalObj.isKind(of: UITabBarController.self), "这是UITabBarController及其子类的专用方法")
        let tabbarC = originalObj as! UITabBarController
        if tabbarC.selectedIndex != selectedIdx{
            return
        }
        if tabbarC.view.subviews.contains(subview){
            return
        }
        tabbarC.view.addSubview(subview)
    }
}

// MARK: - 控制器类名
public extension YSOriginalProtocol where OriginalType: UIViewController{
    
    /// 控制器类名
    var className: String{
        // <YSKit.HomeVC: 0x7f818dc2b390>
        let descString = originalObj.description
        if let startRange = descString.range(of: "."), let endRange = descString.range(of: ":"){
            return String(descString[startRange.upperBound..<endRange.lowerBound])
        }
        return originalObj.description
    }
}

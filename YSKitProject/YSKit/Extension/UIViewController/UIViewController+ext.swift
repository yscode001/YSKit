//
//  UIViewController+ext.swift
//  Pods
//
//  Created by yaoshuai on 2020/12/30.
//

import UIKit

// MARK: - push与pop
public extension YSOriginalObjectProtocol where OriginalObjectType: UIViewController{
    
    /// push
    func push(_ viewController: UIViewController, animated: Bool){
        if originalObject.isKind(of: UINavigationController.self){
            (originalObject as? UINavigationController)?.pushViewController(viewController, animated: animated)
        } else{
            originalObject.navigationController?.pushViewController(viewController, animated: animated)
        }
    }
    
    /// pop
    func pop(animated: Bool){
        if originalObject.isKind(of: UINavigationController.self){
            (originalObject as? UINavigationController)?.popViewController(animated: animated)
        } else{
            originalObject.navigationController?.popViewController(animated: animated)
        }
    }
    
    /// popToVC
    func popToVC(_ viewController: UIViewController, animated: Bool){
        if originalObject.isKind(of: UINavigationController.self){
            (originalObject as? UINavigationController)?.popToViewController(viewController, animated: animated)
        } else{
            originalObject.navigationController?.popToViewController(viewController, animated: animated)
        }
    }
    
    /// popToRootVC
    func popToRootVC(animated: Bool){
        if originalObject.isKind(of: UINavigationController.self){
            (originalObject as? UINavigationController)?.popToRootViewController(animated: animated)
        } else{
            originalObject.navigationController?.popToRootViewController(animated: animated)
        }
    }
}

// MARK: - 弹框
public extension YSOriginalObjectProtocol where OriginalObjectType: UIViewController{
    
    /// alert弹框
    @discardableResult func alert(title: String?, message: String?, actions: [UIAlertAction]) -> UIAlertController?{
        if actions.isEmpty{
            return nil
        }
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions{
            alertVC.addAction(action)
        }
        originalObject.present(alertVC, animated: true, completion: nil)
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
        originalObject.present(alertVC, animated: true, completion: nil)
        return alertVC
    }
}

// MARK: - 添加子控制器
public extension YSOriginalObjectProtocol where OriginalObjectType: UIViewController{
    
    /// 添加子控制器
    func addChildVC(_ childVC: UIViewController, intoView: UIView, childViewFrame: CGRect? = nil){
        if originalObject.children.contains(childVC){
            return
        }
        originalObject.addChild(childVC)
        childVC.view.frame = childViewFrame ?? intoView.bounds
        intoView.addSubview(childVC.view)
        childVC.didMove(toParent: originalObject)
    }
    
    /// 批量添加子控制器
    func addChildVCList(_ childVCList: [UIViewController], intoView: UIView, childViewFrame: CGRect? = nil){
        for childVC in childVCList{
            addChildVC(childVC, intoView: intoView, childViewFrame: childViewFrame)
        }
    }
}

// MARK: - UITabBarController添加子视图
public extension YSOriginalObjectProtocol where OriginalObjectType: UIViewController{
    
    /// UITabBarController添加子视图
    func tabBarCAddSubview(_ subview: UIView){
        assert(originalObject.isKind(of: UITabBarController.self), "这是UITabBarController及其子类的专用方法")
        let tabbarC = originalObject as! UITabBarController
        if tabbarC.view.subviews.contains(subview){
            return
        }
        tabbarC.view.addSubview(subview)
    }
    
    /// UITabBarController添加子视图
    func tabBarCAddSubview(_ subview: UIView, selectedIdx: Int){
        assert(originalObject.isKind(of: UITabBarController.self), "这是UITabBarController及其子类的专用方法")
        let tabbarC = originalObject as! UITabBarController
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
public extension YSOriginalObjectProtocol where OriginalObjectType: UIViewController{
    
    /// 控制器类名
    var className: String{
        // <YSKit.HomeVC: 0x7f818dc2b390>
        let descString = originalObject.description
        if let startRange = descString.range(of: "."), let endRange = descString.range(of: ":"){
            return String(descString[startRange.upperBound..<endRange.lowerBound])
        }
        return originalObject.description
    }
}

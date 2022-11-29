//
//  YSNavC.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/27.
//

import Foundation

/// 自定义导航控制器，隐藏系统导航条，使用自定义的导航条，有侧滑返回手势(可选)
public class YSNavC: UINavigationController, UIGestureRecognizerDelegate{
    
    /// 是否允许边缘侧滑手势
    fileprivate lazy var allowNavEdgeGesture:Bool = true
    
    // 私有
    fileprivate override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    // 私有
    fileprivate override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        interactivePopGestureRecognizer?.delegate = self
    }
    
    /// 非rootVC隐藏bottomBar
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = viewControllers.count > 0
        super.pushViewController(viewController, animated: animated)
    }
    
    /// 非rootVC是否有侧滑返回手势
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return allowNavEdgeGesture && viewControllers.count > 1
    }
}

public extension YSOriginalProtocol where OriginalType == YSNavC{
    
    /// 创建自定义导航控制器
    /// - Parameters:
    ///   - allowNavEdgeGesture: 是否允许边缘侧滑手势
    ///   - rootVC: rootVC
    /// - Returns: 创建的自定义导航控制器
    static func create(allowNavEdgeGesture: Bool, rootVC: UIViewController) -> YSNavC{
        let navC = YSNavC(rootViewController: rootVC)
        navC.allowNavEdgeGesture = allowNavEdgeGesture
        return navC
    }
    
    /// 是否允许边缘侧滑手势
    /// - Parameter allowNavEdgeGesture: 是否允许边缘侧滑手势
    func setupData(allowNavEdgeGesture: Bool){
        originalObj.allowNavEdgeGesture = allowNavEdgeGesture
    }
}

//
//  YSNavC.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/27.
//

import Foundation

/// 自定义导航控制器，隐藏系统导航条，有边缘侧滑返回手势(可选)
open class YSNavC: UINavigationController, UIGestureRecognizerDelegate{
    
    /// 是否允许边缘侧滑手势
    fileprivate lazy var interactivePopGesture:Bool = true
    
    // 私有
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        modalPresentationStyle = .custom
        modalTransitionStyle = .crossDissolve
    }
    
    // 私有
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalPresentationStyle = .custom
        modalTransitionStyle = .crossDissolve
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .custom
        modalTransitionStyle = .crossDissolve
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
        return interactivePopGesture && viewControllers.count > 1
    }
    
    /// 是否允许边缘侧滑手势
    /// - Parameter interactivePopGesture: 是否允许边缘侧滑手势
    func setupData(interactivePopGesture: Bool){
        self.interactivePopGesture = interactivePopGesture
    }
}

public extension Ctor{
    
    /// 创建自定义导航控制器
    /// - Parameters:
    ///   - interactivePopGesture: 是否允许边缘侧滑手势
    ///   - rootVC: rootVC
    /// - Returns: 创建的自定义导航控制器
    static func navC(interactivePopGesture: Bool, rootVC: UIViewController) -> YSNavC{
        let navC = YSNavC(rootViewController: rootVC)
        navC.interactivePopGesture = interactivePopGesture
        return navC
    }
}

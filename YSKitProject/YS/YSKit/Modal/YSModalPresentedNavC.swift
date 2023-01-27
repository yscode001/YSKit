import UIKit

open class YSModalPresentedNavC: YSNavC {
    
    // transitioningDelegate为弱引用，所以这里要声明变量强引用
    private var modalAnimator: YSModalAnimator?
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setupModalStyle()
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupModalStyle()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupModalStyle()
    }
    
    private func setupModalStyle(){
        modalAnimator = YSModalAnimator()
        transitioningDelegate = modalAnimator
        modalPresentationStyle = .custom
        modalTransitionStyle = .coverVertical
    }
    
    /// 设置模态窗口类型
    /// - Returns: 模态窗口类型
    open func setupModalEnum() -> YSModalEnum{
        return .defaultDirectionModalEnum
    }
}

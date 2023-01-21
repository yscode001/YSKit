import UIKit

open class YSModal_presentedVC: UIViewController {
    
    // transitioningDelegate为弱引用，所以这里要声明变量强引用
    private var ys_modalAnimator:YSModal_animator?
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        ys_modalAnimator = YSModal_animator()
        transitioningDelegate = ys_modalAnimator
        modalPresentationStyle = .custom
        modalTransitionStyle = .coverVertical
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ys_modalAnimator = YSModal_animator()
        transitioningDelegate = ys_modalAnimator
        modalPresentationStyle = .custom
        modalTransitionStyle = .coverVertical
    }
    
    /// 设置方向和长度
    open func setupModalDirectionAndLength() -> (direction: YSModal_direction, length: CGFloat){
        return (.toTop, UIScreen.main.bounds.size.height * 0.5)
    }
    
    /// 设置遮罩视图的背景色和透明度
    open func setupModalMaskView() -> (bgC: UIColor, alpha: CGFloat){
        return (UIColor.black, 0.5)
    }
}

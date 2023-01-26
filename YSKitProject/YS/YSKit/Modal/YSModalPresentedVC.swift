import UIKit

open class YSModalPresentedVC: YSBaseVC {
    
    // transitioningDelegate为弱引用，所以这里要声明变量强引用
    private var modalAnimator: YSModalAnimator?
    
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
    
    /// 设置弹出方向和长度
    /// - Returns: 弹出方向和长度
    open func setupModalDirectionAndLength() -> (direction: YSModalType, length: CGFloat){
        return (.toTop, UIScreen.main.bounds.size.height * 0.5)
    }
    
    /// 设置遮罩视图的背景色和透明度
    /// - Returns: 遮罩视图的背景色和透明度
    open func setupModalMaskView() -> (maskViewBGC: UIColor, alpha: CGFloat){
        return (UIColor.black, 0.5)
    }
}

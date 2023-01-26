import UIKit

open class YSModalAnimator: NSObject, UIViewControllerTransitioningDelegate {
    
    private let sw = UIScreen.main.bounds.width
    private weak var presentedVC:YSModalPresentedVC?
    private weak var presentedNavC:YSModalPresentedNavC?
    
    // 展现or解除
    private var isPresent:Bool = false
    
    // 转场上下文，注意：会对展现的控制器强引用：控制器 -> 动画器 -> 转场上下文 -> 控制器，循环引用，所以这里用Weak修饰
    private weak var transitionContext:UIViewControllerContextTransitioning?
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        if let vc = presented as? YSModalPresentedVC{
            presentedVC = vc
            presentedNavC = nil
            return YSModalPresentingVC(presentedViewController: presented, presenting: presenting)
        }
        if let vc = presented as? YSModalPresentedNavC{
            presentedVC = nil
            presentedNavC = vc
            return YSModalPresentingVC(presentedViewController: presented, presenting: presenting)
        }
        return nil
    }
    
    // 告诉控制器谁来提供展现转场动画
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self
    }
    
    // 告诉控制器谁来提供解除转场动画
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        return self
    }
}

// MARK: - 转场动画
extension YSModalAnimator:UIViewControllerAnimatedTransitioning,CAAnimationDelegate{
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    // 转场动画核心方法
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        let containerV = transitionContext.containerView
        
        // 获取目标视图 - 展现取toView,解除取fromView
        let sourceV = transitionContext.view(forKey: .from)
        let destinationV = transitionContext.view(forKey: .to)
        
        if let v = isPresent ? destinationV : sourceV{
            if isPresent && !containerV.subviews.contains(v){
                containerV.addSubview(v)
            }
            animateAction(view: v)
        }
    }
    
    // 动画方法
    private func animateAction(view: UIView){
        if isPresent{
            animateAction_present(view: view)
        } else{
            animateAction_dismiss(view: view)
        }
    }
    
    private func presentedDirection() -> YSModalType{
        if let _ = presentedVC{
            return presentedVC?.setupModalDirectionAndLength().direction ?? .toTop
        }
        if let _ = presentedNavC{
            return presentedNavC?.setupModalDirectionAndLength().direction ?? .toTop
        }
        return .toTop
    }
    
    private func presentedLength() -> CGFloat{
        let sw = UIScreen.main.bounds.width
        let sh = UIScreen.main.bounds.height
        let direction = presentedDirection()
        if direction == .toTop || direction == .toBottom{ // 上下弹框
            var length = sh * 0.5
            if let _ = presentedVC{
                length = presentedVC?.setupModalDirectionAndLength().length ?? sh * 0.5
            }
            else if let _ = presentedNavC{
                length = presentedNavC?.setupModalDirectionAndLength().length ?? sh * 0.5
            }
            if length < 0{
                length = 0
            } else if length > sh{
                length = sh
            }
            return length
        } else{ // 左右弹框
            var length = sw * 0.5
            if let _ = presentedVC{
                length = presentedVC?.setupModalDirectionAndLength().length ?? sw * 0.5
            }
            else if let _ = presentedNavC{
                length = presentedNavC?.setupModalDirectionAndLength().length ?? sh * 0.5
            }
            if length < 0{
                length = 0
            } else if length > sw{
                length = sw
            }
            return length
        }
    }
    
    private func animateAction_present(view: UIView){
        let sw = UIScreen.main.bounds.width
        let sh = UIScreen.main.bounds.height
        var fromFrame:CGRect
        var toFrame:CGRect
        switch presentedDirection() {
        case .toTop:
            fromFrame = CGRect(x: 0, y: sh, width: sw, height: presentedLength())
            toFrame = CGRect(x: 0, y: sh - presentedLength(), width: sw, height: presentedLength())
        case .toBottom:
            fromFrame = CGRect(x: 0, y: -presentedLength(), width: sw, height: presentedLength())
            toFrame = CGRect(x: 0, y: 0, width: sw, height: presentedLength())
        case .toLeft:
            fromFrame = CGRect(x: sw, y: 0, width: presentedLength(), height: sh)
            toFrame = CGRect(x: sw - presentedLength(), y: 0, width: presentedLength(), height: sh)
        case .toRight:
            fromFrame = CGRect(x: -presentedLength(), y: 0, width: presentedLength(), height: sh)
            toFrame = CGRect(x: 0, y: 0, width: presentedLength(), height: sh)
        }
        view.frame = fromFrame
        UIView.animate(withDuration: 0.25, animations: {
            view.frame = toFrame
        }) { (_) in
            //一定要结束转场动画，否则视图不让交互
            self.transitionContext?.completeTransition(true)
        }
    }
    
    private func animateAction_dismiss(view: UIView){
        let sw = UIScreen.main.bounds.width
        let sh = UIScreen.main.bounds.height
        var fromFrame:CGRect
        var toFrame:CGRect
        switch presentedDirection() {
        case .toTop:
            toFrame = CGRect(x: 0, y: sh, width: sw, height: presentedLength())
            fromFrame = CGRect(x: 0, y: sh - presentedLength(), width: sw, height: presentedLength())
        case .toBottom:
            toFrame = CGRect(x: 0, y: -presentedLength(), width: sw, height: presentedLength())
            fromFrame = CGRect(x: 0, y: 0, width: sw, height: presentedLength())
        case .toLeft:
            toFrame = CGRect(x: sw, y: 0, width: presentedLength(), height: sh)
            fromFrame = CGRect(x: sw - presentedLength(), y: 0, width: presentedLength(), height: sh)
        case .toRight:
            toFrame = CGRect(x: -presentedLength(), y: 0, width: presentedLength(), height: sh)
            fromFrame = CGRect(x: 0, y: 0, width: presentedLength(), height: sh)
        }
        view.frame = fromFrame
        UIView.animate(withDuration: 0.25, animations: {
            view.frame = toFrame
        }) { (_) in
            //一定要结束转场动画，否则视图不让交互
            self.transitionContext?.completeTransition(true)
        }
    }
}

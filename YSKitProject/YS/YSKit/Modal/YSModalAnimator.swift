import UIKit

open class YSModalAnimator: NSObject, UIViewControllerTransitioningDelegate {
    
    private let animateDuration: TimeInterval = 0.25
    private weak var presentedVC: YSModalPresentedVC?
    private weak var presentedNavC: YSModalPresentedNavC?
    
    // 展现or解除
    private var isPresent: Bool = false
    
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
        presentedVC = nil
        presentedNavC = nil
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
        return animateDuration
    }
    
    // 转场动画核心方法
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        let containerV = transitionContext.containerView
        
        // 获取目标视图 - 展现取toView, 解除取fromView
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
    
    private func presentedModalEnum() -> YSModalEnum{
        if let vc = presentedVC{
            return vc.setupModalEnum()
        }
        if let vc = presentedNavC{
            return vc.setupModalEnum()
        }
        return .defaultDirectionModalEnum
    }
    
    private func presentedValues() -> (length: CGFloat, width: CGFloat, height: CGFloat){
        let directionTB = presentedModalEnum().isDirectionToTopOrBottomModal
        if directionTB.isDirectionToTopOrBottomModal{
            // 上下弹框
            return (directionTB.length.ys.clamp(0, UIScreen.ys.mainHeight), 0, 0)
        }
        let directionLR = presentedModalEnum().isDirectionToLeftOrRightModal
        if directionLR.isDirectionToLeftOrRightModal{
            // 左右弹框
            return (directionLR.length.ys.clamp(0, UIScreen.ys.mainWidth), 0, 0)
        }
        let middleCenterFadeIn = presentedModalEnum().isMiddleCenterFadeInModal
        if middleCenterFadeIn.isMiddleCenterFadeInModal{
            // 中心点淡入弹框
            return (0, middleCenterFadeIn.width.ys.clamp(0, UIScreen.ys.mainWidth), middleCenterFadeIn.height.ys.clamp(0, UIScreen.ys.mainHeight))
        }
        return (0, 0, 0)
    }
    
    private func animateAction_present(view: UIView){
        let sw = UIScreen.ys.mainWidth
        let sh = UIScreen.ys.mainHeight
        let values = presentedValues()
        let modalEnum = presentedModalEnum()
        if modalEnum.isDirectionModal.isDirectionModal{
            var fromFrame: CGRect = .zero
            var toFrame: CGRect = .zero
            switch modalEnum {
            case .toTop:
                fromFrame = CGRect(x: 0, y: sh, width: sw, height: values.length)
                toFrame = CGRect(x: 0, y: sh - values.length, width: sw, height: values.length)
            case .toBottom:
                fromFrame = CGRect(x: 0, y: -values.length, width: sw, height: values.length)
                toFrame = CGRect(x: 0, y: 0, width: sw, height: values.length)
            case .toLeft:
                fromFrame = CGRect(x: sw, y: 0, width: values.length, height: sh)
                toFrame = CGRect(x: sw - values.length, y: 0, width: values.length, height: sh)
            case .toRight:
                fromFrame = CGRect(x: -values.length, y: 0, width: values.length, height: sh)
                toFrame = CGRect(x: 0, y: 0, width: values.length, height: sh)
            default: break
            }
            animateAction_changeFrame(view: view, from: fromFrame, to: toFrame)
        }
        else if modalEnum.isMiddleCenterFadeInModal.isMiddleCenterFadeInModal{
            view.alpha = 0
            view.frame = CGRect(x: (sw - values.width) * 0.5, y: (sh - values.height) * 0.5, width: values.width, height: values.height)
            UIView.animate(withDuration: animateDuration, animations: {
                view.alpha = 1
            }) { (_) in
                // 一定要结束转场动画，否则视图不让交互
                self.transitionContext?.completeTransition(true)
            }
        }
    }
    
    private func animateAction_dismiss(view: UIView){
        let sw = UIScreen.ys.mainWidth
        let sh = UIScreen.ys.mainHeight
        let values = presentedValues()
        let modalEnum = presentedModalEnum()
        if modalEnum.isDirectionModal.isDirectionModal{
            var fromFrame:CGRect = .zero
            var toFrame:CGRect = .zero
            switch modalEnum {
            case .toTop:
                toFrame = CGRect(x: 0, y: sh, width: sw, height: values.length)
                fromFrame = CGRect(x: 0, y: sh - values.length, width: sw, height: values.length)
            case .toBottom:
                toFrame = CGRect(x: 0, y: -values.length, width: sw, height: values.length)
                fromFrame = CGRect(x: 0, y: 0, width: sw, height: values.length)
            case .toLeft:
                toFrame = CGRect(x: sw, y: 0, width: values.length, height: sh)
                fromFrame = CGRect(x: sw - values.length, y: 0, width: values.length, height: sh)
            case .toRight:
                toFrame = CGRect(x: -values.length, y: 0, width: values.length, height: sh)
                fromFrame = CGRect(x: 0, y: 0, width: values.length, height: sh)
            default: break
            }
            animateAction_changeFrame(view: view, from: fromFrame, to: toFrame)
        }
        else if modalEnum.isMiddleCenterFadeInModal.isMiddleCenterFadeInModal{
            UIView.animate(withDuration: animateDuration, animations: {
                view.alpha = 0
            }) { (_) in
                // 一定要结束转场动画，否则视图不让交互
                self.transitionContext?.completeTransition(true)
            }
        }
    }
    
    private func animateAction_changeFrame(view: UIView, from: CGRect, to: CGRect){
        view.frame = from
        UIView.animate(withDuration: animateDuration, animations: {
            view.frame = to
        }) { (_) in
            // 一定要结束转场动画，否则视图不让交互
            self.transitionContext?.completeTransition(true)
        }
    }
}

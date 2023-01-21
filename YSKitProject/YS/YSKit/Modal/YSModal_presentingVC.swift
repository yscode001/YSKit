import UIKit

public class YSModal_presentingVC: UIPresentationController {
    
    private var ys_maskView_alpha:CGFloat = 0
    private var ys_animateDuration:TimeInterval = 0.25
    private lazy var ys_maskView_modalCustomHeight: UIView = {
        let v = UIView()
        if let rect = self.containerView?.bounds {
            v.frame = rect
        }
        v.backgroundColor = UIColor.clear
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(maskViewClick))
        v.addGestureRecognizer(tap)
        
        return v
    }()
    
    public override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        if case let vc as YSModal_presentedVC = presentedViewController {
            ys_maskView_alpha = vc.setupModalMaskView().alpha
        }
    }
    
    // 即将弹框的时候执行
    public override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        // 容器视图
        guard let containerV = containerView else{
            return
        }
        if !containerV.subviews.contains(ys_maskView_modalCustomHeight){
            containerV.addSubview(ys_maskView_modalCustomHeight)
            if case let vc as YSModal_presentedVC = presentedViewController {
                ys_maskView_modalCustomHeight.backgroundColor = vc.setupModalMaskView().bgC
            }
        }
        ys_maskView_modalCustomHeight.alpha = 0
        UIView.animate(withDuration: ys_animateDuration) {[weak self] in
            guard let se = self else{
                return
            }
            se.ys_maskView_modalCustomHeight.alpha = se.ys_maskView_alpha
        }
    }
    
    // 弹框即将消失的时候执行
    public override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        UIView.animate(withDuration: ys_animateDuration) {[weak self] in
            guard let se = self else{
                return
            }
            se.ys_maskView_modalCustomHeight.alpha = 0
        }
    }
    
    // 弹框已经消失的时候执行
    public override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        
        if completed {
            ys_maskView_modalCustomHeight.removeFromSuperview()
        }
    }
    
    // 弹框控制器视图的frame
    public override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    }
    
    // 弹框控制器又执行了弹框操作，将会走这个方法，一定要写，否则上面的(frame方法)效果失效
    public override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        // 容器视图
        guard let containerV = containerView else{
            return
        }
        // 被展现的视图
        guard let presentedV = presentedView else{
            return
        }
        if containerV.subviews.contains(presentedV){
            return
        }
        containerV.addSubview(presentedV)
        presentedV.translatesAutoresizingMaskIntoConstraints = false
        containerV.addConstraint(NSLayoutConstraint(item: presentedV, attribute: .leading, relatedBy: .equal, toItem: containerV, attribute: .leading, multiplier: 1, constant: 0))
        containerV.addConstraint(NSLayoutConstraint(item: presentedV, attribute: .trailing, relatedBy: .equal, toItem: containerV, attribute: .trailing, multiplier: 1, constant: 0))
        containerV.addConstraint(NSLayoutConstraint(item: presentedV, attribute: .top, relatedBy: .equal, toItem: containerV, attribute: .top, multiplier: 1, constant: 0))
        containerV.addConstraint(NSLayoutConstraint(item: presentedV, attribute: .height, relatedBy: .equal, toItem: containerV, attribute: .height, multiplier: 0, constant: UIScreen.main.bounds.size.height))
    }
    
    @objc private func maskViewClick(){
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}

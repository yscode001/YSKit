//
//  BaseNavVC.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

class BaseNavVC: BaseVC{
    
    lazy var navBar: YSNavBar = Ctor.navBar()
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupNavBar()
    }
    
    private func setupNavBar(){
        view.ys.addSubviews(navBar)
        navBar.ys.setupNavItem { [weak self] item in
            guard let `self` = self else{ return }
            if let rootVC = self.navigationController?.children.first, rootVC == self{
                // 当前是rootVC，不设置《返回按钮》
            } else{
                let backItemContent = Ctor.barButtonItemContent(imageName: "chevron.backward", title: "", titleColor: UIColor.clear)
                item.leftBarButtonItem = Ctor.barButtonItem(alignment: .leading, style: .image, content: backItemContent, target: self, action: #selector(self.backItemClick))
            }
        }
    }
    
    /// 返回按钮点击事件
    @objc func backItemClick(){
        ys.pop(animated: true)
    }
}

// MARK: - 导航栏设置相关
extension BaseNavVC{
    
    /// 设置返回按钮icon
    /// - Parameter imgName: 返回按钮icon
    func nav_replaceBackItemImg(imgName: String){
        navBar.ys.setupNavItem { item in
            guard let btn = item.leftBarButtonItem?.customView as? UIButton else { return }
            btn.setImage(UIImage(named: imgName), for: .normal)
        }
    }
    
    /// 是否隐藏导航栏
    /// - Parameter hide: 是否隐藏
    func nav_hideOrShow(_ hide: Bool){
        navBar.isHidden = hide
    }
    
    /// 导航栏底部线是否显示
    /// - Parameter hidden: 是否显示
    func nav_hideOrShow_bottomLine(_ hidden: Bool){
        navBar.ys.setupNavBottomLine { bottomLine in
            bottomLine.isHidden = hidden
        }
    }
    
    /// 导航栏标题设置
    /// - Parameter attributes: 标题设置
    func nav_barTitleStyle(_ attributes: [NSAttributedString.Key: Any]){
        navBar.ys.setupNavBar { bar in
            bar.titleTextAttributes = attributes
        }
    }
    
    /// 导航栏颜色设置
    /// - Parameters:
    ///   - color: 颜色
    ///   - isTranslucent: 是否展示
    func nav_barTintColor(color: UIColor, isTranslucent: Bool){
        navBar.ys.setupNavBar { bar in
            bar.barTintColor = color
            bar.isTranslucent = isTranslucent
        }
    }
}

//
//  VC_base_nav.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

class VC_base_nav: VC_base{
    
    // MARK: - 自定义导航设置
    lazy var nav_bgV:UIView = Ctor.view(bgColor: .clear)
    lazy var nav_item:UINavigationItem = UINavigationItem().ys.then{
        if let rootVC = self.navigationController?.children.first, rootVC == self{
            // 当前是rootVC，不设置《返回按钮》
        } else{
            var cnt = Ctor.barButtonItemContent(imageName: "chevron.backward", title: "", titleColor: UIColor.clear)
            $0.leftBarButtonItem = Ctor.barButtonItem(alignment: .leading, style: .image, content: cnt, target: self, action: #selector(backItemClick))
        }
    }
    
    /// 设置bar
    private lazy var nav_bar: UINavigationBar = UINavigationBar().ys.then {
        $0.titleTextAttributes = [NSAttributedString.Key.font: UIFont.font(17)]
        $0.isTranslucent = false
        $0.barTintColor = UIColor.clear
        $0.items = [self.nav_item]
        $0.shadowImage = UIImage()
        $0.setBackgroundImage(UIImage(), for: .default)
    }
    
    private lazy var nav_bottomLine:UIView = Ctor.view(bgColor: Color.nav_bottomLine)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
    }
    
    /// 设置nav
    func setupNav(){
        view.ys.addSubviews(nav_bgV)
        nav_bgV.ys.addSubviews(nav_bar, nav_bottomLine)
        
        nav_bgV.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(0)
            make.height.equalTo(UIScreen.ys.statusBarFrame.height + UIScreen.ys.navigationBarHeight)
        }
        nav_bar.snp.makeConstraints { (make) in
            make.top.equalTo(UIScreen.ys.statusBarFrame.height)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(UIScreen.ys.navigationBarHeight)
        }
        nav_bottomLine.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalTo(0)
            make.height.equalTo(1)
        }
    }
}

// MARK: - 导航栏设置相关
extension VC_base_nav{
    
    /// 设置返回按钮icon
    /// - Parameter imgName: 返回按钮icon
    func nav_replaceBackItemImg(imgName: String){
        guard let btn = nav_item.leftBarButtonItem?.customView as? UIButton else { return }
        btn.setImage(UIImage(named: imgName), for: .normal)
    }
    
    /// 是否隐藏导航栏
    /// - Parameter hide: 是否隐藏
    func nav_hideOrShow(_ hide: Bool){
        nav_bgV.isHidden = hide
    }
    
    /// 导航栏底部线是否显示
    /// - Parameter hidden: 是否显示
    func nav_hideOrShow_bottomLine(_ hidden: Bool){
        nav_bottomLine.isHidden = hidden
    }
    
    /// 导航栏标题设置
    /// - Parameter attributes: 标题设置
    func nav_barTitleStyle(_ attributes: [NSAttributedString.Key: Any]){
        nav_bar.titleTextAttributes = attributes
    }
    
    /// 导航栏颜色设置
    /// - Parameters:
    ///   - color: 颜色
    ///   - isTranslucent: 是否展示
    func nav_barTintColor(color: UIColor, isTranslucent: Bool){
        nav_bar.barTintColor = color
        nav_bar.isTranslucent = isTranslucent
    }
}

// MARK: - pop返回操作
extension VC_base_nav{
    
    /// 返回按钮
    @objc func backItemClick(){
        ys.pop(animated: true)
    }
}

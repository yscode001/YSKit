//
//  TabC.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

class TabC: UITabBarController{
    
    private lazy var vc_home: VC_home = VC_home()
    private lazy var vc_square: VC_square = VC_square()
    private lazy var vc_msg: VC_msg = VC_msg()
    private lazy var vc_profile: VC_profile = VC_profile()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        addChildVC(childVC: vc_home, imgName: "tabbar_home" ,tabName: "首页")
        addChildVC(childVC: vc_square, imgName: "tabbar_square" ,tabName: "广场")
        addChildVC(childVC: vc_msg, imgName: "tabbar_msg" ,tabName: "消息")
        addChildVC(childVC: vc_profile, imgName: "tabbar_profile" ,tabName: "我的")
    }
    
    private func setupStyle(){
        view.backgroundColor = Color.vc_rootview
        
        // 去掉tabbar的线
        if #available(iOS 13.0, *) {
            let appearance = tabBar.standardAppearance.copy()
            appearance.backgroundImage = UIImage()
            appearance.shadowImage = UIImage()
            appearance.shadowColor = .clear
            tabBar.standardAppearance = appearance
            
            tabBar.tintColor = Color.tarbar_tint
            tabBar.unselectedItemTintColor = Color.tabbar_unselectedItemTint
        } else{
            tabBar.backgroundImage = UIImage()
            tabBar.shadowImage = UIImage()
        }
        
        // 设置tabbar背景色为白色
        let v = Ctor.view(bgColor: Color.tabbar_bg)
        v.frame = tabBar.bounds
        v.frame.size.height = tabBar.bounds.height + UIScreen.ys.safeArea.bottom
        tabBar.insertSubview(v, at: 0)
        
        // 手动添加阴影细线
        let separatorLine = Ctor.view(bgColor: Color.tabbar_topLine)
        separatorLine.frame = tabBar.bounds
        separatorLine.frame.size.height = 1
        
        separatorLine.layer.shadowColor = UIColor.black.cgColor
        separatorLine.layer.shadowOpacity = 0.1
        
        tabBar.insertSubview(separatorLine, at: 0)
    }
    
    private func addChildVC(childVC: UIViewController, imgName: String , tabName: String){
        // title
        childVC.tabBarItem.title = tabName
        childVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Color.tabbar_item_title_normal], for: .normal)
        childVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Color.tabbar_item_title_selected], for: .selected)
        
        // image
        childVC.tabBarItem.image = UIImage(named: imgName)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: imgName + "_sel")?.withRenderingMode(.alwaysOriginal)
        
        // 偏移量
        if #available(iOS 13.0, *) {
            
        } else{
            childVC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        }
        // 子控制器
        addChild(NavC(rootViewController: childVC))
    }
}

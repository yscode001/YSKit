/*
 自定义导航条
 对外提供属性控件：nav_item
 对外提供初始化方法：TCNavBar.create
 对外提供对象方法：见最下面MARK注释
 */

import UIKit

/// 自定义系统的导航条，直接加到view上，无需布局(内部已布局)
public class YSNavBar: UIView{
    
    // MARK: - 自定义导航子视图
    fileprivate lazy var nav_bgV:UIView = Ctor.view(bgColor: .clear)
    
    fileprivate lazy var nav_bar: UINavigationBar = UINavigationBar().ys.then {
        $0.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        $0.isTranslucent = false
        $0.items = [self.nav_item]
        $0.shadowImage = UIImage()
        $0.setBackgroundImage(UIImage(), for: .default)
    }
    
    fileprivate lazy var nav_item:UINavigationItem = UINavigationItem()
    
    fileprivate lazy var nav_bottomLine:UIView = Ctor.view(bgColor: Ctor.color(hex: 0xcccccc))
    
    convenience init(statusBarHeight: CGFloat = UIScreen.ys.statusBarFrame.height) {
        let rectt = CGRect(x: 0, y: 0, width: UIScreen.ys.mainWidth, height: statusBarHeight + InternalConst.navHeight)
        self.init(frame: rectt)
        setupUI()
    }
    
    private func setupUI(){
        nav_bgV.frame = bounds
        nav_bar.frame = CGRect(x: 0, y: bounds.height - InternalConst.navHeight, width: bounds.width, height: InternalConst.navHeight)
        nav_bottomLine.frame = CGRect(x: 0, y: bounds.height - 1, width: bounds.width, height: 1)
        
        ys.addSubviews(nav_bgV)
        nav_bgV.ys.addSubviews(nav_bar, nav_bottomLine)
    }
}

// MARK: - 创建导航条，外界VC只需要添加至View上而无需布局，因为frame在初始化时已指定
public extension YSOriginalProtocol where OriginalType == YSNavBar{
    
    /// 创建导航条，外界VC只需要添加至View上而无需布局，因为frame在初始化时已指定
    static func create(statusBarHeight: CGFloat = UIScreen.ys.statusBarFrame.height) -> YSNavBar{
        return YSNavBar(statusBarHeight: statusBarHeight)
    }
}

// MARK: - 对外提供API，导航栏样式设置相关
public extension YSOriginalProtocol where OriginalType == YSNavBar{
    
    /// 设置背景视图
    func setupNavBGView(setup: @escaping((UIView) -> ())){
        setup(originalObj.nav_bgV)
    }
    
    /// 设置UINavigationBar
    func setupNavBar(setup: @escaping(UINavigationBar) -> ()){
        setup(originalObj.nav_bar)
    }
    
    /// 设置UINavigationItem
    func setupNavItem(setup: @escaping(UINavigationItem) -> ()){
        setup(originalObj.nav_item)
    }
    
    /// 设置底部的分割线
    func setupNavBottomLine(setup: @escaping((UIView) -> ())){
        setup(originalObj.nav_bottomLine)
    }
}

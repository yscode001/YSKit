//
//  YSBaseVC.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/20.
//

import UIKit

/// 控制器基类
open class YSBaseVC: UIViewController {
    
    // MARK: - 方法执行次数
    private lazy var viewDidLoadTimes: Int = 0
    private lazy var viewWillAppearTimes: Int = 0
    private lazy var viewWillLayoutSubviewsTimes: Int = 0
    private lazy var viewDidLayoutSubviewsTimes: Int = 0
    private lazy var viewDidAppearTimes: Int = 0
    private lazy var viewWillDisappearTimes: Int = 0
    private lazy var viewDidDisappearTimes: Int = 0
    
    /// VC页面名字，默认description
    open var pageName:String{
        return description
    }
    
    // MARK: - 生命周期方法
    open override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoad(firstTime: viewDidLoadTimes == 0)
        viewDidLoadTimes += 1
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppear(animated, firstTime: viewWillAppearTimes == 0)
        viewWillAppearTimes += 1
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        viewWillLayoutSubviews(firstTime: viewWillLayoutSubviewsTimes == 0)
        viewWillLayoutSubviewsTimes += 1
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewDidLayoutSubviews(firstTime: viewDidLayoutSubviewsTimes == 0)
        viewDidLayoutSubviewsTimes += 1
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppear(animated, firstTime: viewDidAppearTimes == 0)
        viewDidAppearTimes += 1
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewWillDisappear(animated, firstTime: viewWillDisappearTimes == 0)
        viewWillDisappearTimes += 1
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewDidDisappear(animated, firstTime: viewDidDisappearTimes == 0)
        viewDidDisappearTimes += 1
    }
    
    // MARK: - 自定义方法
    
    /// 自定义viewDidLoad方法，在系统viewDidLoad方法里执行
    /// - Parameter firstTime: 是否是第一次执行此方法
    open func viewDidLoad(firstTime: Bool){ }
    
    /// 自定义viewWillAppear方法，在系统viewWillAppear方法里执行
    /// - Parameters:
    ///   - animated: animated
    ///   - firstTime: 是否是第一次执行此方法
    open func viewWillAppear(_ animated: Bool, firstTime: Bool){ }
    
    /// 自定义viewWillLayoutSubviews方法，在系统viewWillLayoutSubviews方法里执行
    /// - Parameter firstTime: 是否是第一次执行此方法
    open func viewWillLayoutSubviews(firstTime: Bool){ }
    
    /// 自定义viewDidLayoutSubviews方法，在系统viewDidLayoutSubviews方法里执行
    /// - Parameter firstTime: 是否是第一次执行此方法
    open func viewDidLayoutSubviews(firstTime: Bool){ }
    
    /// 自定义viewDidAppear方法，在系统viewDidAppear方法里执行
    /// - Parameters:
    ///   - animated: animated
    ///   - firstTime: 是否是第一次执行此方法
    open func viewDidAppear(_ animated: Bool, firstTime: Bool){ }
    
    /// 自定义viewWillDisappear方法，在系统viewWillDisappear方法里执行
    /// - Parameters:
    ///   - animated: animated
    ///   - firstTime: 是否是第一次执行此方法
    open func viewWillDisappear(_ animated: Bool, firstTime: Bool){ }
    
    /// 自定义viewDidDisappear方法，在系统viewDidDisappear方法里执行
    /// - Parameters:
    ///   - animated: animated
    ///   - firstTime: 是否是第一次执行此方法
    open func viewDidDisappear(_ animated: Bool, firstTime: Bool){ }
}

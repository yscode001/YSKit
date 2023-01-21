//
//  YSBaseVC.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/20.
//

import UIKit

/// 所有控制器的基类
open class YSBaseVC: UIViewController {
    
    // MARK: - 方法执行次数
    
    private lazy var viewDidLoad_times:Int = 0
    private lazy var viewWillAppear_times:Int = 0
    private lazy var viewWillLayoutSubviews_times:Int = 0
    private lazy var viewDidLayoutSubviews_times:Int = 0
    private lazy var viewDidAppear_times:Int = 0
    private lazy var viewWillDisappear_times:Int = 0
    private lazy var viewDidDisappear_times:Int = 0
    
    /// VC名字，默认description
    open var pageName:String{
        return description
    }
    
    // MARK: - 生命周期方法
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoad(firstTime: viewDidLoad_times == 0)
        viewDidLoad_times += 1
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppear(firstTime: viewWillAppear_times == 0)
        viewWillAppear_times += 1
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        viewWillLayoutSubviews(firstTime: viewWillLayoutSubviews_times == 0)
        viewWillLayoutSubviews_times += 1
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewDidLayoutSubviews(firstTime: viewDidLayoutSubviews_times == 0)
        viewDidLayoutSubviews_times += 1
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppear(firstTime: viewDidAppear_times == 0)
        viewDidAppear_times += 1
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewWillDisappear(firstTime: viewWillDisappear_times == 0)
        viewWillDisappear_times += 1
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewDidDisappear(firstTime: viewDidDisappear_times == 0)
        viewDidDisappear_times += 1
    }
    
    // MARK: - 自定义方法
    
    open func viewDidLoad(firstTime: Bool){ }
    
    open func viewWillAppear(firstTime: Bool){ }
    
    open func viewWillLayoutSubviews(firstTime: Bool){ }
    
    open func viewDidLayoutSubviews(firstTime: Bool){ }
    
    open func viewDidAppear(firstTime: Bool){ }
    
    open func viewWillDisappear(firstTime: Bool){ }
    
    open func viewDidDisappear(firstTime: Bool){ }
}

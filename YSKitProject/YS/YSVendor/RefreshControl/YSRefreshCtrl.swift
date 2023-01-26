//
//  YSRefreshCtrl.swift
//  YSVendor
//
//  Created by yaoshuai on 2023/1/1.
//

import Foundation
import MJRefresh
import YSKit

/// 基于MJRefresh的刷新控件
public class YSRefreshCtrl: YSCoreProtocol{
    
    // 上下拉闭包
    private var pulldownClosure:(() -> ())?
    private var pullupClosure:(() -> ())?
    
    /// 是否设置了上拉加载
    lazy var settedPullUpV:Bool = false
    
    /// 下拉次数(结束下拉后才会加1)
    lazy var pullDownTimes = 0
    
    /// 上拉次数(结束上拉后才会加1)
    lazy var pullupTimes = 0
    
    /// 下拉刷新、上拉加载控件
    lazy var pulldownV:MJRefreshNormalHeader = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(pullDownRefreshing))
    lazy var pullupV:MJRefreshBackNormalFooter = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: #selector(pullUpLoading))
    
    private init() {}
    convenience init(pulldownClosure:@escaping(() -> ())) {
        self.init()
        self.pulldownClosure = pulldownClosure
        self.settedPullUpV = false
        self.setupData(title: YSRefreshTitleInfo())
    }
    convenience init(pulldownClosure:@escaping(() -> ()), pullupClosure:@escaping(() -> ())) {
        self.init()
        self.pulldownClosure = pulldownClosure
        self.pullupClosure = pullupClosure
        self.settedPullUpV = true
        self.setupData(title: YSRefreshTitleInfo())
    }
    
    /// 设置刷新控件的标题属性
    internal func setupData(title: YSRefreshTitleInfo){
        pulldownV.setTitle(title.pulldown_idle, for: .idle)
        pulldownV.setTitle(title.pulldown_pulling, for: .pulling)
        pulldownV.setTitle(title.pulldown_willRefresh, for: .willRefresh)
        pulldownV.setTitle(title.pulldown_refreshing, for: .refreshing)
        
        if settedPullUpV{
            pullupV.setTitle(title.pullup_idle, for: .idle)
            pullupV.setTitle(title.pullup_pulling, for: .pulling)
            pullupV.setTitle(title.pullup_willRefresh, for: .willRefresh)
            pullupV.setTitle(title.pullup_refreshing, for: .refreshing)
            pullupV.setTitle(title.pullup_noMore, for: .noMoreData)
        }
    }
    
    /// 设置刷新控件的标题样色
    internal func setupData(style: YSRefreshStyle){
        pulldownV.lastUpdatedTimeLabel?.font = style.pulldown_font
        pulldownV.lastUpdatedTimeLabel?.textColor = style.pulldown_titleColor
        pulldownV.stateLabel?.font = style.pulldown_font
        pulldownV.stateLabel?.textColor = style.pulldown_titleColor
        
        if settedPullUpV{
            pullupV.stateLabel?.font = style.pullup_font
            pullupV.stateLabel?.textColor = style.pullup_titleColor
        }
    }
}

// MARK: - 具体的上下拉操作
extension YSRefreshCtrl{
    
    @objc private func pullDownRefreshing(){
        if pullupV.isRefreshing{
            pulldownV.endRefreshing()
            return
        }
        pulldownClosure?()
    }
    
    @objc private func pullUpLoading(){
        if pulldownV.isRefreshing{
            pullupV.endRefreshing()
            return
        }
        pullupClosure?()
    }
}

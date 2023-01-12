//
//  YSRefreshCtrl+ext.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation
import YSKit

// MARK: - 创建刷新控件对象

public extension YSOriginalProtocol where OriginalType == YSRefreshCtrl{
    
    /// 创建只有下拉刷新
    static func create(pulldown: @escaping(() -> ())) -> YSRefreshCtrl{
        return YSRefreshCtrl(pulldownClosure: pulldown)
    }
    
    /// 创建下拉刷新和上拉加载
    static func create(pulldown: @escaping(() -> ()), pullup: @escaping(() -> ())) -> YSRefreshCtrl{
        return YSRefreshCtrl(pulldownClosure: pulldown, pullupClosure: pullup)
    }
}

// MARK: - 扩展属性

public extension YSOriginalProtocol where OriginalType == YSRefreshCtrl{
    
    /// 是否正在下拉刷新
    var isPulldownRefreshing:Bool{
        return originalObj.pulldownV.isRefreshing
    }
    
    /// 是否正在上拉加载
    var isPullupRefreshing:Bool{
        return originalObj.pullupV.isRefreshing
    }
    
    /// 下拉次数(结束下拉后才会加1)
    var pullDownTimes:Int{
        return originalObj.pullDownTimes
    }
    
    /// 上拉次数(结束上拉后才会加1)
    var pullupTimes:Int{
        return originalObj.pullupTimes
    }
}

// MARK: - 设置给tableView

public extension YSOriginalProtocol where OriginalType == YSRefreshCtrl{
    
    /// 把刷新控件设置给tableView
    func setupToTableView(tbv: UITableView){
        if originalObj.settedPullUpV{
            tbv.mj_header = originalObj.pulldownV
            tbv.mj_footer = originalObj.pullupV
        } else{
            tbv.mj_header = originalObj.pulldownV
        }
    }
}

public extension YSOriginalProtocol where OriginalType: UITableView{
    
    /// 设置刷新控件
    @discardableResult func setupRefreshCtrl(ctrl: YSRefreshCtrl) -> OriginalType{
        ctrl.ys.setupToTableView(tbv: originalObj)
        return originalObj
    }
}

// MARK: - 自动刷新、结束刷新
public extension YSOriginalProtocol where OriginalType == YSRefreshCtrl{
    
    /// 自动刷新
    func autoPulldownRefresh(){
        if originalObj.pullupV.isRefreshing{
            originalObj.pulldownV.endRefreshing()
            return
        }
        originalObj.pulldownV.beginRefreshing()
    }
    
    /// 结束刷新
    func endRefresh(pulldown: Bool, hasMore: Bool = false){
        if pulldown{
            originalObj.pulldownV.endRefreshing()
            originalObj.pullDownTimes += 1
        } else{
            if originalObj.settedPullUpV{
                if hasMore{
                    originalObj.pullupV.endRefreshing()
                } else{
                    originalObj.pullupV.endRefreshingWithNoMoreData()
                }
                originalObj.pullupTimes += 1
            }
        }
    }
}

// MARK: - 设置标题
public extension YSOriginalProtocol where OriginalType == YSRefreshCtrl{
    
    /// 设置标题属性
    func setupData(title: YSRefreshTitleInfo){
        originalObj.setupData(title: title)
    }
    
    /// 设置标题样式
    func setupData(style: YSRefreshStyle){
        originalObj.setupData(style: style)
    }
}

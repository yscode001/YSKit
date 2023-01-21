//
//  YSRefreshTitleInfo.swift
//  YSVendor
//
//  Created by 姚帅 on 2021/1/23.
//

import Foundation

/// 刷新控件样式信息
public struct YSRefreshStyle{
    
    /// 下拉刷新文本字体
    public var pulldown_font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    
    /// 下拉刷新文本颜色
    public var pulldown_titleColor = UIColor.gray
    
    /// 上拉加载文本字体
    public var pullup_font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    
    /// 上拉加载文本颜色
    public var pullup_titleColor = UIColor.gray
    
    public init() {}
    
    /// 只有下拉刷新
    public init(pulldown_font: UIFont, pulldown_titleColor: UIColor){
        self.pulldown_font = pulldown_font
        self.pulldown_titleColor = pulldown_titleColor
    }
    
    /// 下拉刷新和上拉加载
    public init(pulldown_font: UIFont, pulldown_titleColor: UIColor, pullup_font: UIFont, pullup_titleColor: UIColor){
        self.pulldown_font = pulldown_font
        self.pulldown_titleColor = pulldown_titleColor
        self.pullup_font = pullup_font
        self.pullup_titleColor = pullup_titleColor
    }
}

/// 刷新控件标题信息
public struct YSRefreshTitleInfo {
    
    // MARK: - 下拉
    
    /// 下拉刷新
    public var pulldown_idle = "下拉刷新"
    
    /// 松手刷新
    public var pulldown_pulling = "松手刷新"
    
    /// 即将刷新
    public var pulldown_willRefresh = "即将刷新"
    
    /// 正在刷新
    public var pulldown_refreshing = "正在刷新..."
    
    // MARK: - 上拉
    
    /// 上拉加载更多
    public var pullup_idle = "上拉加载更多"
    
    /// 松手加载数据
    public var pullup_pulling = "松手加载数据"
    
    /// 即将加载数据
    public var pullup_willRefresh = "即将加载数据"
    
    /// 正在加载数据
    public var pullup_refreshing = "正在加载数据..."
    
    /// 没有更多了
    public var pullup_noMore = "没有更多了"
    
    // MARK: - 构造函数
    
    /// 初始化
    public init() {}
    
    /// 只有下拉刷新
    public init(pulldown_idle: String, pulldown_pulling: String, pulldown_willRefresh: String, pulldown_refreshing: String){
        self.pulldown_idle = pulldown_idle
        self.pulldown_pulling = pulldown_pulling
        self.pulldown_willRefresh = pulldown_willRefresh
        self.pulldown_refreshing = pulldown_refreshing
    }
    
    /// 下拉刷新和上拉加载
    public init(pulldown_idle: String, pulldown_pulling: String, pulldown_willRefresh: String, pulldown_refreshing: String, pullup_idle: String, pullup_pulling: String, pullup_willRefresh: String, pullup_refreshing: String, pullup_noMore: String){
        self.pulldown_idle = pulldown_idle
        self.pulldown_pulling = pulldown_pulling
        self.pulldown_willRefresh = pulldown_willRefresh
        self.pulldown_refreshing = pulldown_refreshing
        self.pullup_idle = pullup_idle
        self.pullup_pulling = pullup_pulling
        self.pullup_willRefresh = pullup_willRefresh
        self.pullup_refreshing = pullup_refreshing
        self.pullup_noMore = pullup_noMore
    }
}

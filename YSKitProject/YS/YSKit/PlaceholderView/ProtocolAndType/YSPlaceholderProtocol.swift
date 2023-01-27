//
//  YSPlaceholderProtocol.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/24.
//

/// 占位视图placeholderView需要遵守此协议
public protocol YSPlaceholderProtocol {
    
    /// 自己作为其他view的placeholderView时的类型
    var placeholderEnum: YSPlaceholderEnum { get }
    
    /// 展示，隐藏，状态"切换"之后执行
    func doSomeThingAfter(show: Bool)
}

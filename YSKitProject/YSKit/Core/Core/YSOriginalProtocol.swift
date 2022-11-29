//
//  YSOriginalProtocol.swift
//  Pods
//
//  Created by yaoshuai on 2020/12/20.
//

import Foundation

/// 原始对象协议
public protocol YSOriginalProtocol {
    
    /// 原始对象关联类型
    associatedtype OriginalType
    
    /// 原始对象
    var originalObj: OriginalType { get }
    
    /// 自定义构造函数，传入原始对象
    init(originalObj: OriginalType)
}

/// 原始对象类型
public struct YSOriginalObject<T>: YSOriginalProtocol {
    
    /// 原始对象
    public let originalObj: T
    
    /// 自定义构造函数，传入原始对象
    public init(originalObj: T) {
        self.originalObj = originalObj
    }
}

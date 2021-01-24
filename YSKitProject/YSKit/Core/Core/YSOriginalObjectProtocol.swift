//
//  YSOriginalObjectProtocol.swift
//  Pods
//
//  Created by yaoshuai on 2020/12/20.
//

import Foundation

/// 原始对象协议
public protocol YSOriginalObjectProtocol {
    
    /// 原始对象关联类型
    associatedtype OriginalObjectType
    
    /// 原始对象
    var originalObject: OriginalObjectType { get }
    
    /// 自定义构造函数，传入原始对象
    init(originalObject: OriginalObjectType)
}

/// 原始对象类型
public struct YSOriginalObject<T>: YSOriginalObjectProtocol {
    
    /// 原始对象
    public let originalObject: T
    
    /// 自定义构造函数，传入原始对象
    public init(originalObject: T) {
        self.originalObject = originalObject
    }
}

//
//  AssociateKeys.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

/// 关联属性keys
internal struct AssociateKeys {
    
    /// 是否可以执行，用于防重点
    static let canExecute = UnsafeRawPointer.init(bitPattern: "canExecute".hashValue)!
}

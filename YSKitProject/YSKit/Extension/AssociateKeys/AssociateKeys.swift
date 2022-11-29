//
//  AssociateKeys.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

/// 关联属性keys
internal struct AssociateKeys {
    
    /// 是否可以进行点击操作
    static let canClick = UnsafeRawPointer.init(bitPattern: "canClick".hashValue)!
}

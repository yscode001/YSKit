//
//  YSOriginalObjectThen.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/20.
//

import Foundation
#if !os(Linux)
import CoreGraphics
#endif
#if os(iOS) || os(tvOS)
import UIKit.UIGeometry
#endif

extension YSOriginalProtocol where OriginalType: Any {
    
    /// Makes it available to set properties with closures just after initializing and copying the value types.
    ///
    ///     let frame = CGRect().with {
    ///       $0.origin.x = 10
    ///       $0.size.width = 100
    ///     }
    @inlinable
    public func with(_ block: (inout OriginalType) throws -> Void) rethrows -> OriginalType {
        var copy = originalObj
        try block(&copy)
        return copy
    }
    
    /// Makes it available to execute something with closures.
    ///
    ///     UserDefaults.standard.do {
    ///       $0.set("devxoul", forKey: "username")
    ///       $0.set("devxoul@gmail.com", forKey: "email")
    ///       $0.synchronize()
    ///     }
    @inlinable
    public func `do`(_ block: (OriginalType) throws -> Void) rethrows {
        try block(originalObj)
    }
}

extension YSOriginalProtocol where OriginalType: AnyObject {
    
    /// Makes it available to set properties with closures just after initializing.
    ///
    ///     let label = UILabel().then {
    ///       $0.textAlignment = .center
    ///       $0.textColor = UIColor.black
    ///       $0.text = "Hello, World!"
    ///     }
    @inlinable
    public func then(_ block: (OriginalType) throws -> Void) rethrows -> OriginalType {
        try block(originalObj)
        return originalObj
    }
}

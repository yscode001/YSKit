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

extension YSOriginalObjectProtocol where OriginalObjectType: Any {
    
    /// Makes it available to set properties with closures just after initializing and copying the value types.
    ///
    ///     let frame = CGRect().with {
    ///       $0.origin.x = 10
    ///       $0.size.width = 100
    ///     }
    @inlinable
    public func with(_ block: (inout OriginalObjectType) throws -> Void) rethrows -> OriginalObjectType {
        var copy = originalObject
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
    public func `do`(_ block: (OriginalObjectType) throws -> Void) rethrows {
        try block(originalObject)
    }
}

extension YSOriginalObjectProtocol where OriginalObjectType: AnyObject {
    
    /// Makes it available to set properties with closures just after initializing.
    ///
    ///     let label = UILabel().then {
    ///       $0.textAlignment = .center
    ///       $0.textColor = UIColor.black
    ///       $0.text = "Hello, World!"
    ///     }
    @inlinable
    public func then(_ block: (OriginalObjectType) throws -> Void) rethrows -> OriginalObjectType {
        try block(originalObject)
        return originalObject
    }
}

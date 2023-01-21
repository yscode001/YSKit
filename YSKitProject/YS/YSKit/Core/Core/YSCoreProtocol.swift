//
//  YSCoreProtocol.swift
//  Pods
//
//  Created by yaoshuai on 2020/12/20.
//

import Foundation

/// YSKit核心组件协议
public protocol YSCoreProtocol {
    
    /// YSCore关联类型
    associatedtype CoreType
    
    var ys: CoreType { get }
    
    static var ys: CoreType.Type { get }
}

/// YSKit核心组件协议默认实现
extension YSCoreProtocol {
    
    public var ys: YSOriginalObject<Self> {
        return YSOriginalObject(originalObj: self)
    }
    
    public static var ys: YSOriginalObject<Self>.Type {
        return YSOriginalObject.self
    }
}

// MARK: - 默认遵守

extension YSCoreProtocol where Self: Any { }
extension YSCoreProtocol where Self: AnyObject { }

extension NSObject: YSCoreProtocol {}
extension Array: YSCoreProtocol {}
extension Dictionary: YSCoreProtocol {}
extension Set: YSCoreProtocol {}

#if !os(Linux)
extension CGPoint: YSCoreProtocol {}
extension CGRect: YSCoreProtocol {}
extension CGSize: YSCoreProtocol {}
extension CGVector: YSCoreProtocol {}
#endif

#if os(iOS) || os(tvOS)
extension URL: YSCoreProtocol{}
extension UIEdgeInsets: YSCoreProtocol {}
extension UIOffset: YSCoreProtocol {}
extension UIRectEdge: YSCoreProtocol {}
extension Int: YSCoreProtocol {}
extension Float: YSCoreProtocol {}
extension CGFloat: YSCoreProtocol {}
extension Double: YSCoreProtocol {}
extension Date: YSCoreProtocol {}
extension String: YSCoreProtocol {}
#endif

//
//  UIView+frame.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/1.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType: UIView{
    
    // MARK: - 位置
    
    var origin:CGPoint{ return originalObject.frame.origin }
    func origin_set(_ origin: CGPoint){ originalObject.frame.origin = origin }
    
    var x:CGFloat{ return originalObject.frame.origin.x }
    func x_set(_ x: CGFloat){ originalObject.frame.origin.x = x }
    
    var y:CGFloat{ return originalObject.frame.origin.y }
    func y_set(_ y: CGFloat){ originalObject.frame.origin.y = y }
    
    var centerX:CGFloat{ return originalObject.center.x }
    func centerX_set(_ x: CGFloat){ originalObject.center.x = x }
    
    var centerY:CGFloat{ return originalObject.center.y }
    func centerY_set(_ y: CGFloat){ originalObject.center.y = y }
    
    var center:CGPoint{ return originalObject.center }
    func center_set(_ center: CGPoint){ originalObject.center = center }
    
    // MARK: - 大小
    
    var size:CGSize{ return originalObject.frame.size }
    func size_set(_ size: CGSize){ originalObject.frame.size = size }
    
    var width:CGFloat{ return originalObject.frame.width }
    func width_set(_ width: CGFloat){ originalObject.frame.size.width = width }
    
    var height:CGFloat{ return originalObject.frame.height }
    func height_set(_ height: CGFloat){ originalObject.frame.size.height = height }
}

//
//  UIView+frame.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/1.
//

import UIKit

public extension YSOriginalProtocol where OriginalType: UIView{
    
    // MARK: - 位置
    
    var origin:CGPoint{ return originalObj.frame.origin }
    func origin_set(_ origin: CGPoint){ originalObj.frame.origin = origin }
    
    var x:CGFloat{ return originalObj.frame.origin.x }
    func x_set(_ x: CGFloat){ originalObj.frame.origin.x = x }
    
    var y:CGFloat{ return originalObj.frame.origin.y }
    func y_set(_ y: CGFloat){ originalObj.frame.origin.y = y }
    
    var centerX:CGFloat{ return originalObj.center.x }
    func centerX_set(_ x: CGFloat){ originalObj.center.x = x }
    
    var centerY:CGFloat{ return originalObj.center.y }
    func centerY_set(_ y: CGFloat){ originalObj.center.y = y }
    
    var center:CGPoint{ return originalObj.center }
    func center_set(_ center: CGPoint){ originalObj.center = center }
    
    // MARK: - 大小
    
    var size:CGSize{ return originalObj.frame.size }
    func size_set(_ size: CGSize){ originalObj.frame.size = size }
    
    var width:CGFloat{ return originalObj.frame.width }
    func width_set(_ width: CGFloat){ originalObj.frame.size.width = width }
    
    var height:CGFloat{ return originalObj.frame.height }
    func height_set(_ height: CGFloat){ originalObj.frame.size.height = height }
}

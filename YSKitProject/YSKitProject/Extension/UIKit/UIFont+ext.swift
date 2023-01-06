//
//  UIFont+ext.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

extension UIFont{
    static func font(_ ofSize: CGFloat, bold: Bool = false) -> UIFont{
        if bold{
            return UIFont.systemFont(ofSize: ofSize, weight: UIFont.Weight.bold)
        }
        return UIFont.systemFont(ofSize: ofSize)
    }
    
    static func font(_ ofSize: CGFloat, type: UIFont.Weight) -> UIFont{
        return UIFont.systemFont(ofSize: ofSize, weight: type)
    }
}

//
//  UIFont+ext.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

extension Ctor{
    
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

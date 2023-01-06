//
//  UIButton+ext.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

extension UIButton{
    @discardableResult func font(_ ofSize: CGFloat, bold: Bool = false) -> UIButton{
        self.titleLabel?.font = UIFont.font(ofSize, bold: bold)
        return self
    }
    
    @discardableResult func font(_ ofSize: CGFloat, type: UIFont.Weight) -> UIButton{
        self.titleLabel?.font = UIFont.font(ofSize, type: type)
        return self
    }
}

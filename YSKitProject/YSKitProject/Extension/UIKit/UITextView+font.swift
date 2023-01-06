//
//  UITextView+font.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

extension UITextView{
    @discardableResult func font(_ ofSize: CGFloat, bold: Bool = false) -> UITextView{
        self.font = UIFont.font(ofSize, bold: bold)
        return self
    }
    
    @discardableResult func font(_ ofSize: CGFloat, type: UIFont.Weight) -> UITextView{
        self.font = UIFont.font(ofSize, type: type)
        return self
    }
}

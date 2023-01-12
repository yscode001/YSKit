//
//  UIButton+font.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

public extension YSOriginalProtocol where OriginalType: UIButton{
    
    @discardableResult func font(_ ofSize: CGFloat, bold: Bool = false) -> OriginalType{
        originalObj.titleLabel?.font = Ctor.font(ofSize, bold: bold)
        return originalObj
    }
    
    @discardableResult func font(_ ofSize: CGFloat, type: UIFont.Weight) -> OriginalType{
        originalObj.titleLabel?.font = Ctor.font(ofSize, type: type)
        return originalObj
    }
}

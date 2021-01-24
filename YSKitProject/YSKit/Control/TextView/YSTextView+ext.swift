//
//  YSTextView+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/26.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType == YSTextView{
    
    static func create() -> YSTextView{
        return YSTextView()
    }
    
    /// 设置placeHolder
    /// - Parameters:
    ///   - placeHolder: 内容
    ///   - textColor: 颜色
    @discardableResult func setPlaceHolder(placeHolder: String?, textColor: UIColor?) -> OriginalObjectType{
        originalObject.setPlaceHolder(placeHolder: placeHolder, textColor: textColor)
        return originalObject
    }
    
    /// 高度随内容自适应，注意min一定要和约束高度相同
    /// - Parameters:
    ///   - minValue: 最小高度，一定要和约束高度相同
    ///   - maxValue: 最大高度
    @discardableResult func setHeight(min minValue: CGFloat, max maxValue: CGFloat) -> OriginalObjectType{
        originalObject.setHeight(min: minValue, max: maxValue)
        return originalObject
    }
    
    /// 高度随内容改变了，然后回调
    /// - Parameter complete: 回调闭包
    @discardableResult func setHeightChangedCallback(complete: @escaping((CGFloat) -> ())) -> OriginalObjectType{
        originalObject.setHeightChangedCallback(complete: complete)
        return originalObject
    }
}

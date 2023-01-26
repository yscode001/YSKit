//
//  YSTextView+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/26.
//

import Foundation

public extension Ctor{
    
    static func textViewCustom() -> YSTextView{
        return YSTextView()
    }
}

public extension YSOriginalProtocol where OriginalType == YSTextView{
    
    /// 设置placeHolder
    /// - Parameters:
    ///   - placeHolder: 内容
    ///   - textColor: 颜色
    @discardableResult func setPlaceHolder(placeHolder: String?, textColor: UIColor?) -> OriginalType{
        originalObj.setPlaceHolder(placeHolder: placeHolder, textColor: textColor)
        return originalObj
    }
    
    /// 高度随内容自适应，注意min一定要和约束高度相同
    /// - Parameters:
    ///   - minValue: 最小高度，一定要和约束高度相同
    ///   - maxValue: 最大高度
    @discardableResult func setHeight(min minValue: CGFloat, max maxValue: CGFloat) -> OriginalType{
        originalObj.setHeight(min: minValue, max: maxValue)
        return originalObj
    }
    
    /// 高度随内容改变了，然后回调
    /// - Parameter complete: 回调闭包
    @discardableResult func setHeightChangedCallback(complete: @escaping((CGFloat) -> ())) -> OriginalType{
        originalObj.setHeightChangedCallback(complete: complete)
        return originalObj
    }
}

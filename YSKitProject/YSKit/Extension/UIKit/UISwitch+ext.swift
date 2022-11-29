//
//  UISwitch+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/31.
//

import UIKit

public extension YSOriginalProtocol where OriginalType: UISwitch{
    
    @discardableResult func setColor(onTintColor: UIColor, tintColor: UIColor, thumbTintColor: UIColor) -> OriginalType{
        originalObj.onTintColor = onTintColor
        originalObj.tintColor = tintColor
        originalObj.thumbTintColor = thumbTintColor
        return originalObj
    }
    
    @discardableResult func setImage(onImage: UIImage?, offImage: UIImage?) -> OriginalType{
        originalObj.onImage = onImage
        originalObj.offImage = offImage
        return originalObj
    }
}

//
//  UISwitch+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/31.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType: UISwitch{
    
    @discardableResult func setColor(onTintColor: UIColor, tintColor: UIColor, thumbTintColor: UIColor) -> OriginalObjectType{
        originalObject.onTintColor = onTintColor
        originalObject.tintColor = tintColor
        originalObject.thumbTintColor = thumbTintColor
        return originalObject
    }
    
    @discardableResult func setImage(onImage: UIImage?, offImage: UIImage?) -> OriginalObjectType{
        originalObject.onImage = onImage
        originalObject.offImage = offImage
        return originalObject
    }
}

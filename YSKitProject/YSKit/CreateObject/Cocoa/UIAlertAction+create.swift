//
//  UIAlertAction+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType == UIAlertAction{
    
    static func create(style: UIAlertAction.Style, title: String, handler: ((UIAlertAction) -> Void)? = nil) -> OriginalObjectType{
        return UIAlertAction(title: title, style: style, handler: handler)
    }
}

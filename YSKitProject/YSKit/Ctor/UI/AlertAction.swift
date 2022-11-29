//
//  AlertAction.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    static func alertAction(style: UIAlertAction.Style, title: String) -> UIAlertAction{
        return UIAlertAction(title: title, style: style, handler: nil)
    }
    
    static func alertAction(style: UIAlertAction.Style, title: String, handler: @escaping ((UIAlertAction) -> Void)) -> UIAlertAction{
        return UIAlertAction(title: title, style: style, handler: handler)
    }
}

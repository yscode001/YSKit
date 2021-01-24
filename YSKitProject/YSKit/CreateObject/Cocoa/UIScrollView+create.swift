//
//  UIScrollView+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType == UIScrollView{
    
    static func create(bgc: UIColor) -> OriginalObjectType{
        return UIScrollView().ys.then{
            $0.backgroundColor = bgc
            $0.keyboardDismissMode = .onDrag
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
        }
    }
    
    static func create(bgc: UIColor, delegate: UIScrollViewDelegate) -> OriginalObjectType{
        return UIScrollView().ys.then{
            $0.backgroundColor = bgc
            $0.delegate = delegate
            $0.keyboardDismissMode = .onDrag
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
        }
    }
}

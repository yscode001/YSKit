//
//  ScrollView.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    static func scrollView(bgColor: UIColor) -> UIScrollView{
        return UIScrollView().ys.then{
            $0.backgroundColor = bgColor
            $0.keyboardDismissMode = .onDrag
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
        }
    }
    
    static func scrollView(bgColor: UIColor, isPagingEnabled: Bool) -> UIScrollView{
        return UIScrollView().ys.then{
            $0.backgroundColor = bgColor
            $0.isPagingEnabled = isPagingEnabled
            $0.keyboardDismissMode = .onDrag
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
        }
    }
    
    static func scrollView(bgColor: UIColor, delegate: UIScrollViewDelegate) -> UIScrollView{
        return UIScrollView().ys.then{
            $0.backgroundColor = bgColor
            $0.delegate = delegate
            $0.keyboardDismissMode = .onDrag
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
        }
    }
    
    static func scrollView(bgColor: UIColor, isPagingEnabled: Bool, delegate: UIScrollViewDelegate) -> UIScrollView{
        return UIScrollView().ys.then{
            $0.backgroundColor = bgColor
            $0.isPagingEnabled = isPagingEnabled
            $0.delegate = delegate
            $0.keyboardDismissMode = .onDrag
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
        }
    }
}

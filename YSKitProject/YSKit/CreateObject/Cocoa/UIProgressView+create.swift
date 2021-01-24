//
//  UIProgressView+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType == UIProgressView{
    
    /// 创建进度条
    ///
    /// - Parameters:
    ///   - progressTintColor: 已过进度部分的颜色
    ///   - trackTintColor: 未过进度部分的颜色
    /// - Returns: 返回进度条
    static func create(progressTintColor: UIColor, trackTintColor: UIColor) -> OriginalObjectType{
        return UIProgressView().ys.then{
            $0.progressTintColor = progressTintColor
            $0.trackTintColor = trackTintColor
        }
    }
    
    /// 创建进度条
    ///
    /// - Parameters:
    ///   - progressTintColor: 已过进度部分的颜色
    ///   - trackTintColor: 未过进度部分的颜色
    ///   - style: 风格
    /// - Returns: 返回进度条
    static func create(progressTintColor: UIColor, trackTintColor: UIColor, style: UIProgressView.Style) -> OriginalObjectType{
        return UIProgressView(progressViewStyle: style).ys.then{
            $0.progressTintColor = progressTintColor
            $0.trackTintColor = trackTintColor
        }
    }
}

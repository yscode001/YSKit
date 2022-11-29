//
//  ProgressView.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    /// 创建进度条
    ///
    /// - Parameters:
    ///   - progressTintColor: 已过进度部分的颜色
    ///   - trackTintColor: 未过进度部分的颜色
    /// - Returns: 返回进度条
    static func progressView(progressTintColor: UIColor, trackTintColor: UIColor) -> UIProgressView{
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
    static func progressView(progressTintColor: UIColor, trackTintColor: UIColor, style: UIProgressView.Style) -> UIProgressView{
        return UIProgressView(progressViewStyle: style).ys.then{
            $0.progressTintColor = progressTintColor
            $0.trackTintColor = trackTintColor
        }
    }
}

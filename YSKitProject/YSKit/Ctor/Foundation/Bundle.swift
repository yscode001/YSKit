//
//  Bundle.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import Foundation

public extension Ctor{
    
    /// 获取指定语言所在的bundle包
    ///
    /// - Parameter language: 语言
    /// - Returns: bundle包
    static func bundle(language: String) -> Bundle{
        if let path = Bundle.main.path(forResource: language, ofType: "lproj"), let bd = Bundle(path: path){
            return bd
        }
        return Bundle.main
    }
}

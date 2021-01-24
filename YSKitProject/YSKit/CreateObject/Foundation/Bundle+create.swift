//
//  Bundle+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType == Bundle{
    
    /// 获取指定语言所在的bundle包
    ///
    /// - Parameter language: 语言
    /// - Returns: bundle包
    static func create(language: String) -> OriginalObjectType{
        var bundle = Bundle.main
        if let path = Bundle.main.path(forResource: language, ofType: "lproj"), let b = Bundle(path: path){
            bundle = b
        }
        return bundle
    }
}

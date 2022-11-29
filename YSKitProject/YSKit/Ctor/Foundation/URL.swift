//
//  URL.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import Foundation

public extension Ctor{
    
    static func url(string: String?) -> URL?{
        guard let str = string else{
            return nil
        }
        return URL(string: str)
    }
}

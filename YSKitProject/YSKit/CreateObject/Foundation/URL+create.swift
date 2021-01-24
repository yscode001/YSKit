//
//  URL+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType == URL{
    
    static func create(string: String?) -> OriginalObjectType?{
        guard let str = string else{
            return nil
        }
        return URL(string: str)
    }
}

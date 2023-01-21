//
//  NSString+path.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

public extension YSOriginalProtocol where OriginalType == NSString{
    
    /// 沙盒路径home
    static var sandbox_home:NSString{return NSHomeDirectory() as NSString}
    
    /// 沙盒路径temporary
    static var sandbox_tmp:NSString{return NSTemporaryDirectory() as NSString}
    
    /// 沙盒路径document
    static var sandbox_document:NSString{return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as NSString}
    
    /// 沙盒路径library
    static var sandbox_library:NSString{return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).last! as NSString}
    
    /// 沙盒路径cache
    static var sandbox_cache:NSString{return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last! as NSString}
}

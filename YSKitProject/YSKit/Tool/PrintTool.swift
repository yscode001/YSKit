//
//  PrintTool.swift
//  YSKit
//
//  Created by 姚帅 on 2023/1/20.
//

/// 打印工具
public class PrintTool{
    
    private static var enable:Bool = true
    
    /// 是否启用打印日志的功能
    /// - Parameter enable: 是否启用
    public class func enable(enable: Bool){
        PrintTool.enable = enable
    }
    
    /// 打印日志
    /// - Parameter item: 打印的内容
    public class func print(_ item: Any){
        if enable{
            Swift.print(item)
        }
    }
}

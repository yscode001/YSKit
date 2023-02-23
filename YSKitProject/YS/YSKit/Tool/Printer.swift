//
//  Printer.swift
//  YSKit
//
//  Created by 姚帅 on 2023/1/20.
//

/// 打印工具
public class Printer{
    
    private static var enable:Bool = true
    
    /// 是否启用打印日志的功能
    /// - Parameter enable: 是否启用
    public class func enable(enable: Bool){
        Printer.enable = enable
    }
    
    /// 打印日志
    /// - Parameters:
    ///   - item: 打印的内容
    ///   - alsoPrintCurrentThread: 打印时是否带上当前线程
    public class func printItem(_ item: Any, _ alsoPrintCurrentThread: Bool = false){
        if enable{
            if alsoPrintCurrentThread{
                Swift.print(Thread.current, item, separator: " ", terminator: "\n")
            } else{
                Swift.print(item)
            }
        }
    }
    
    /// 打印日志
    /// - Parameters:
    ///   - _items: 打印的内容
    ///   - separator: separator
    ///   - terminator: terminator
    public class func printItems(_ items: Any..., separator: String = " ", terminator: String = "\n"){
        if enable{
            Swift.print(items, separator, terminator)
        }
    }
}

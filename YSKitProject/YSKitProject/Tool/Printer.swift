//
//  Printer.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

/// 调试打印工具
class Printer{
    
    class func print(_ item: Any){
        if EnvCfg.isDevelop{
            Swift.print(item)
        }
    }
}

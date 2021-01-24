//
//  UIPasteboard+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

/*
 + (UIPasteboard *)generalPasteboard;系统级别的剪切板在整个设备中共享，即使应用程序被删掉，其向系统级的剪切板中写入的数据依然在。
 
 + (nullable UIPasteboard *)pasteboardWithName:(NSString *)pasteboardName create:(BOOL)create;自定义的剪切板通过一个特定的名称字符串进行创建，它在应用程序内或者同一开发者开发的其他应用程序中可以进行数据共享。举个例子：比如你开发了多款应用，用户全部下载了，在A应用中用户拷贝了一些数据（为了数据安全，不用系统级别的Pasteboard），在打开B应用时就会自动识别，提高用户体验。
 
 + (UIPasteboard *)pasteboardWithUniqueName;第3个方法创建的剪切板等价为使用第2个方法创建的剪切板，只是其名称字符串为nil，它通常用于当前应用内部。（当然也可以跨应用使用，但必须Bundle Identifier 例com.maoshaoqian.** 星号前部一样）
 
 注意：使用第3个方法创建的剪切板默认是不进行数据持久化的，及当应用程序退出后，剪切板中内容将别抹去。若要实现持久化，需要设置persistent属性为YES
 */

import UIKit

/// 剪切板类型
public enum YSUIPasteboardType{
    
    /// 系统级别：整个设备共享，即使应用被删除，其向系统级的剪切板中写入的数据依然在
    case system
    
    /// 自定义剪切板：它在应用程序内或者同一开发者开发的其他应用程序中可以进行数据共享
    case acount
    
    /// 只可在APP内部使用
    case app
}

public extension YSOriginalObjectProtocol where OriginalObjectType == UIPasteboard{
    
    static func create(_ type: YSUIPasteboardType) -> OriginalObjectType?{
        switch type {
        case .system:
            return UIPasteboard.general
        case .acount:
            return UIPasteboard(name: UIPasteboard.Name("sf_pasteboard"), create: true)
        case .app:
            return UIPasteboard.withUniqueName()
        }
    }
    
    static func create(_ type: YSUIPasteboardType, string: String) -> OriginalObjectType?{
        return UIPasteboard.ys.create(type)?.ys.then{
            $0.string = string
        }
    }
}

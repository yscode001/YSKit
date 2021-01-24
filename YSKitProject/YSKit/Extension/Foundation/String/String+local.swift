//
//  String+local.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation

// MARK: - 不带参数，取得local的原始值
public extension YSOriginalObjectProtocol where OriginalObjectType == String{
    
    var local:String{
        return NSLocalizedString(originalObject, comment: "")
    }
    
    func local(tableName: String) -> String{
        return NSLocalizedString(originalObject, tableName: tableName, bundle: Bundle.main, value: "", comment: "")
    }
    
    func local(bundle: Bundle) -> String{
        return NSLocalizedString(originalObject, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
    func local(bundle: Bundle, tableName: String) -> String{
        return NSLocalizedString(originalObject, tableName: tableName, bundle: bundle, value: "", comment: "")
    }
    
    func local(language: String) -> String{
        let bundle = Bundle.ys.create(language: language)
        return NSLocalizedString(originalObject, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
    func local(language: String, tableName: String) -> String{
        let bundle = Bundle.ys.create(language: language)
        return NSLocalizedString(originalObject, tableName: tableName, bundle: bundle, value: "", comment: "")
    }
}

// MARK: - 取得local作为format，后面拼接参数
public extension YSOriginalObjectProtocol where OriginalObjectType == String{
    
    func local(arguments: [CVarArg]) -> String{
        let format = NSLocalizedString(originalObject, comment: "")
        return arguments.isEmpty ? format : String(format: format, arguments: arguments)
    }
    
    func local(tableName: String, arguments: [CVarArg]) -> String{
        let format = NSLocalizedString(originalObject, tableName: tableName, bundle: Bundle.main, value: "", comment: "")
        return arguments.isEmpty ? format : String(format: format, arguments: arguments)
    }
    
    func local(bundle: Bundle, arguments: [CVarArg]) -> String{
        let format = NSLocalizedString(originalObject, tableName: nil, bundle: bundle, value: "", comment: "")
        return arguments.isEmpty ? format : String(format: format, arguments: arguments)
    }
    
    func local(bundle: Bundle, tableName: String, arguments: [CVarArg]) -> String{
        let format = NSLocalizedString(originalObject, tableName: tableName, bundle: bundle, value: "", comment: "")
        return arguments.isEmpty ? format : String(format: format, arguments: arguments)
    }
    
    func local(language: String, arguments: [CVarArg]) -> String{
        let bundle = Bundle.ys.create(language: language)
        let format = NSLocalizedString(originalObject, tableName: nil, bundle: bundle, value: "", comment: "")
        return arguments.isEmpty ? format : String(format: format, arguments: arguments)
    }
    
    func local(language: String, tableName: String, arguments: [CVarArg]) -> String{
        let bundle = Bundle.ys.create(language: language)
        let format = NSLocalizedString(originalObject, tableName: tableName, bundle: bundle, value: "", comment: "")
        return arguments.isEmpty ? format : String(format: format, arguments: arguments)
    }
}

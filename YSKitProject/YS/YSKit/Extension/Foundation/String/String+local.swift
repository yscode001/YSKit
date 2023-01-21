//
//  String+local.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation

// MARK: - 不带参数，取得local的原始值
public extension YSOriginalProtocol where OriginalType == String{
    
    var local:String{
        return NSLocalizedString(originalObj, comment: "")
    }
    
    func local(tableName: String) -> String{
        return NSLocalizedString(originalObj, tableName: tableName, bundle: Bundle.main, value: "", comment: "")
    }
    
    func local(bundle: Bundle) -> String{
        return NSLocalizedString(originalObj, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
    func local(bundle: Bundle, tableName: String) -> String{
        return NSLocalizedString(originalObj, tableName: tableName, bundle: bundle, value: "", comment: "")
    }
    
    func local(language: String) -> String{
        let bundle = Ctor.bundle(language: language)
        return NSLocalizedString(originalObj, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
    func local(language: String, tableName: String) -> String{
        let bundle = Ctor.bundle(language: language)
        return NSLocalizedString(originalObj, tableName: tableName, bundle: bundle, value: "", comment: "")
    }
}

// MARK: - 取得local作为format，后面拼接参数
public extension YSOriginalProtocol where OriginalType == String{
    
    func local(arguments: [CVarArg]) -> String{
        let format = NSLocalizedString(originalObj, comment: "")
        return arguments.isEmpty ? format : String(format: format, arguments: arguments)
    }
    
    func local(tableName: String, arguments: [CVarArg]) -> String{
        let format = NSLocalizedString(originalObj, tableName: tableName, bundle: Bundle.main, value: "", comment: "")
        return arguments.isEmpty ? format : String(format: format, arguments: arguments)
    }
    
    func local(bundle: Bundle, arguments: [CVarArg]) -> String{
        let format = NSLocalizedString(originalObj, tableName: nil, bundle: bundle, value: "", comment: "")
        return arguments.isEmpty ? format : String(format: format, arguments: arguments)
    }
    
    func local(bundle: Bundle, tableName: String, arguments: [CVarArg]) -> String{
        let format = NSLocalizedString(originalObj, tableName: tableName, bundle: bundle, value: "", comment: "")
        return arguments.isEmpty ? format : String(format: format, arguments: arguments)
    }
    
    func local(language: String, arguments: [CVarArg]) -> String{
        let bundle = Ctor.bundle(language: language)
        let format = NSLocalizedString(originalObj, tableName: nil, bundle: bundle, value: "", comment: "")
        return arguments.isEmpty ? format : String(format: format, arguments: arguments)
    }
    
    func local(language: String, tableName: String, arguments: [CVarArg]) -> String{
        let bundle = Ctor.bundle(language: language)
        let format = NSLocalizedString(originalObj, tableName: tableName, bundle: bundle, value: "", comment: "")
        return arguments.isEmpty ? format : String(format: format, arguments: arguments)
    }
}

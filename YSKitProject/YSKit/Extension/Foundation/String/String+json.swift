//
//  String+json.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/31.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType == String{
    
    /// 对象->json字符串,obj的约束条件见JSONSerialization
    static func jsonString(_ obj: Any, encoding: String.Encoding? = .utf8) -> String?{
        if JSONSerialization.isValidJSONObject(obj){
            guard let data = try? JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted) else{
                return nil
            }
            return String(data: data, encoding: encoding!)
        } else{
            return nil
        }
    }
}

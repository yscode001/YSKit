//
//  String+url.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/31.
//

import Foundation

public extension YSOriginalProtocol where OriginalType == String{
    
    /// 给URL添加参数
    @discardableResult func url_add_parm(_ parm: [String: Any]) -> String{
        var str = originalObj
        var parmStr = ""
        if parm.count > 0{
            for (key, value) in parm{
                if !key.isEmpty, let val = "\(value)".removingPercentEncoding{
                    parmStr += "\(key)=\(val)&"
                }
            }
        }
        if !parmStr.isEmpty{
            if parmStr.hasSuffix("&"){
                parmStr = parmStr.ys.removeLastCharacter()
            }
            if str.contains("?"){
                str += "&\(parmStr)"
            } else{
                str += "?\(parmStr)"
            }
        }
        return str
    }
    
    /// 获取URL的全部参数
    @discardableResult func url_get_parm() -> [String: String]{
        var dict = [String: String]()
        let startRange = nsstring.range(of: "?")
        if startRange.length == 0{
            return dict
        }
        let parmString = nsstring.substring(from: startRange.upperBound)
        let urlComponents = parmString.components(separatedBy: "&")
        for keyValuePair in urlComponents{
            let pairComponents = keyValuePair.components(separatedBy: "=")
            if pairComponents.count > 1{
                if let key = pairComponents.first?.removingPercentEncoding,!key.isEmpty{
                    let value = keyValuePair.ys.removeFirstString("\(key)=")
                    dict[key] = value.removingPercentEncoding
                }
            }
        }
        return dict
    }
    
    /// 移除URL的全部参数
    @discardableResult func url_remove_all_parms() -> String{
        let str = originalObj
        if !str.contains("?"){
            return str
        }
        let range = nsstring.range(of: "?")
        return nsstring.substring(to: range.lowerBound)
    }
    
    /// 移除URL的部分参数
    @discardableResult func url_remove_some_parms(_ keyArray: [String]) -> String{
        let parms = url_get_parm()
        let host = url_remove_all_parms()
        
        var p = [String: String]()
        for (key, value) in parms{
            if !keyArray.contains(key){
                p[key] = value
            }
        }
        
        return host.ys.url_add_parm(p)
    }
}

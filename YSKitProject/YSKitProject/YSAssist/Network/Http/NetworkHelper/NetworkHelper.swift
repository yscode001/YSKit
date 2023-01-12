//
//  NetworkHelper.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation
import Alamofire

internal class NetworkHelper {
    
    private init() {}
    
    /// 默认错误信息
    class var defaultErrorMessage:String{ return "网络请求失败" }
    
    /// BaseHeader
    private class var baseHeader:[String: String]{
        return [String: String]()
    }
    
    /// BaseParms
    private class var baseParms:[String: Any]{
        return [String: Any]()
    }
}

// MARK: - 处理url/header/parms，主要是为了方便扩展

extension NetworkHelper{
    
    // 根据传入的具体的业务route，处理成请求的完整URL
    static func handleURL(method: Alamofire.HTTPMethod, baseUrlType: NetworkBaseUrlType, route: String) -> String{
        return NetworkBaseUrl.getBaseURL(baseUrlType: baseUrlType) + route
    }
    
    // 处理请求Header
    static func handleHeader(method: Alamofire.HTTPMethod, header: [String: String]) -> [String: String]{
        var head = baseHeader
        for item in header{
            head[item.key] = item.value
        }
        return head
    }
    
    
    // 处理请求参数
    static func handleParms(method: Alamofire.HTTPMethod, parms: [String: Any]) -> [String: Any]{
        var parm = baseParms
        for item in parms{
            parm[item.key] = item.value
        }
        return parm
    }
}

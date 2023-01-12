//
//  NetworkRequestObject.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation
import Alamofire

/// 网络请求对象
struct NetworkRequestObject {
    
    /// 方法类型
    private(set) var method:Alamofire.HTTPMethod = .get
    
    /// 具体的业务路由
    private(set) var route:String = ""
    
    /// 请求参数
    private(set) var parms:[String: Any] = [String: Any]()
    
    /// baseURL类型
    private(set) var baseURLType:NetworkBaseUrlType = .main
    
    /// header
    private(set) var header:[String: String] = [String: String]()
    
    /// 参数编码
    private(set) var parmsEncoding:ParameterEncoding = URLEncoding.default
    
    private init() {}
    
    init(method: Alamofire.HTTPMethod, route: String, parms: [String: Any]) {
        self.method = method
        self.route = route
        self.parms = parms
        self.baseURLType = .main
        self.header = appendHeader(headers: [:])
        self.parmsEncoding = method == .get ? URLEncoding.default : JSONEncoding.default
    }
    
    init(method: Alamofire.HTTPMethod, route: String, parms: [String: Any], baseURLType: NetworkBaseUrlType, header: [String: String], parmsEncoding: ParameterEncoding) {
        self.method = method
        self.route = route
        self.parms = parms
        self.baseURLType = baseURLType
        self.header = appendHeader(headers: header)
        self.parmsEncoding = parmsEncoding
    }
}

extension NetworkRequestObject{
    
    fileprivate var baseHeader:[String: String]{
        let header = [String: String]()
        /*
        if !CurrentUserVM.shared.token.value.ys.isEmptyOrWhiteSpace{
            header["x-access-token"] = CurrentUserVM.shared.token.value
        }
 */
        return header
    }
    
    fileprivate func appendHeader(headers: [String: String]) -> [String: String]{
        var head = baseHeader
        for item in headers{
            head[item.key] = item.value
        }
        return head
    }
}

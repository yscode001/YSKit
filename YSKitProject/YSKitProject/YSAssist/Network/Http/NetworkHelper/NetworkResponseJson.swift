//
//  NetworkResponseJson.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation
import SwiftyJSON

/// 网络请求响应数据
enum NetworkResponseJson {
    
    /// 网络请求出错
    case networkError(errorCode: Int, errorMessage: String)
    
    /// 网络请求成功，但服务器返回错误信息
    case serverError(errorCode: Int, errorMessage: String)
    
    /// 一切正常，客户端初步处理数据后，回调字典
    case data(rootJson: JSON)
}

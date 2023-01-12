//
//  NetworkBaseUrl.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation

// MARK: - Baseurl类型(主要是为了方便扩展)

/// Baseurl类型
enum NetworkBaseUrlType {
    
    case main
    
    // MARK: - baseURL的值
    
    /// baseURL的值
    fileprivate var baseURL:String{
        switch self {
        case .main:
            return mainURL
        }
    }
    
    // MARK: - item对应的baseURL
    
    private var mainURL:String{
        return "https://bs0.xiaobanhui.com"
    }
}

// MARK: - BaseUrl获取

internal class NetworkBaseUrl {
    
    private init() {}
    
    // MARK: - 外界使用这个方法获取BaseURL
    
    class func getBaseURL(baseUrlType: NetworkBaseUrlType) -> String{
        return baseUrlType.baseURL
    }
}

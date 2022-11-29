//
//  WKWebView+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/30.
//

import WebKit

public extension YSOriginalProtocol where OriginalType: WKWebView{
    
    /// 加载网页
    @discardableResult func load(_ urlString: String?, cachePolicy: URLRequest.CachePolicy? = .returnCacheDataElseLoad, timeoutInterval: TimeInterval? = 10) -> OriginalType{
        guard let str = urlString, let url = URL(string: str) else{
            return originalObj
        }
        originalObj.load(URLRequest(url: url, cachePolicy: cachePolicy!, timeoutInterval: timeoutInterval!))
        return originalObj
    }
    
    /// 设置滚动条是否显示
    @discardableResult func setIndicator(_ horizontal: Bool, _ vertical: Bool) -> OriginalType{
        originalObj.scrollView.showsVerticalScrollIndicator = horizontal
        originalObj.scrollView.showsHorizontalScrollIndicator = vertical
        return originalObj
    }
}

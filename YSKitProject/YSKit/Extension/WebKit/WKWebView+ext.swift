//
//  WKWebView+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/30.
//

import WebKit

public extension YSOriginalObjectProtocol where OriginalObjectType: WKWebView{
    
    /// 加载网页
    @discardableResult func load(_ urlString: String?, cachePolicy: URLRequest.CachePolicy? = .returnCacheDataElseLoad, timeoutInterval: TimeInterval? = 10) -> OriginalObjectType{
        guard let str = urlString, let url = URL(string: str) else{
            return originalObject
        }
        originalObject.load(URLRequest(url: url, cachePolicy: cachePolicy!, timeoutInterval: timeoutInterval!))
        return originalObject
    }
    
    /// 设置滚动条是否显示
    @discardableResult func setIndicator(_ horizontal: Bool, _ vertical: Bool) -> OriginalObjectType{
        originalObject.scrollView.showsVerticalScrollIndicator = horizontal
        originalObject.scrollView.showsHorizontalScrollIndicator = vertical
        return originalObject
    }
}

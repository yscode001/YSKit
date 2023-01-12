## 使用说明：

- Network：基于Alamofire的网络库封装。

~~~swift
// 开始监听网络状态
NetworkManager.shared.startListeningNetworkReachability()
        
// 结束监听网络状态
NetworkManager.shared.stopListeningNetworkReachability()
        
// 请求网络数据
NetworkManager.shared.request(requestObject: NetworkRequestObject(method: .get, route: "", parms: [:]))
~~~
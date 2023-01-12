//
//  NetworkManager.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire
import SwiftyJSON

/// Http网络请求管理
class NetworkManager {
    
    private init(){}
    static let shared:NetworkManager = NetworkManager()
    
    //    private lazy var manager:SessionManager = {
    //        let config = URLSessionConfiguration.default
    //        config.timeoutIntervalForRequest = 15
    //        config.timeoutIntervalForResource = 15
    //        return Alamofire.SessionManager(configuration: config)
    //    }()
    
    /// 网络状态监听者
    private var reachabilityManager:NetworkReachabilityManager?
    
    /// 开始监听网络状态
    func startListeningNetworkReachability() {
        if reachabilityManager == nil{
            reachabilityManager = NetworkReachabilityManager()
        }
        reachabilityManager?.startListening(onUpdatePerforming: { [weak self] (status) in
            guard let _ = self else{ return }
            switch status {
            case .notReachable:
                print("网络状况：notReachable，当前网络不可用")
            case .reachable(.cellular):
                print("网络状况：reachable(.cellular)，蜂窝网络连接")
            case .reachable(.ethernetOrWiFi):
                print("网络状况：reachable(.ethernetOrWiFi)，以太网或wifi连接")
            case .unknown :
                print("网络状况：unknown，网络状态未知")
            }
        })
    }
    
    /// 结束监听网络状态
    func stopListeningNetworkReachability(){
        reachabilityManager?.stopListening()
    }
}

// MARK: - 具体的请求操作，供外界使用
extension NetworkManager{
    
    /// 请求网络数据，每次请求都会创建observable，发送数据后会自动complete
    @discardableResult func request(requestObject: NetworkRequestObject) -> Observable<NetworkResponseJson>{
        let requestURL = NetworkHelper.handleURL(method: requestObject.method, baseUrlType: requestObject.baseURLType, route: requestObject.route)
        let requestHeader = NetworkHelper.handleHeader(method: requestObject.method, header: requestObject.header)
        let requestParms = NetworkHelper.handleParms(method: requestObject.method, parms: requestObject.parms)
        let encoding = requestObject.parmsEncoding
        
        /*
         return Observable<NetworkResponseJson>.create { [weak self] (observer) -> Disposable in
         guard let `self` = self else{
         observer.onCompleted()
         return Disposables.create()
         }
         self.manager.request(requestURL, method: requestObject.method, parameters: requestParms, encoding: encoding, headers: requestHeader).responseData { [weak self] (response) in
         guard let _ = self else{
         observer.onCompleted()
         return
         }
         
         var result:NetworkResponseJson
         switch response.result {
         case .success(let resp):
         let rootJson = JSON(resp)
         let serverCode = rootJson["code"].intValue
         if serverCode == NetworkServerCode.correct.rawValue{ // 服务器返回正确信息
         result = NetworkResponseJson.data(rootJson: rootJson)
         } else{ // 服务器返回错误信息
         if serverCode == NetworkServerCode.insufficient.rawValue{
         // 余额不足，原来的逻辑发通知了，所以为了不影响原来的逻辑，这里也发一下通知
         // NotificationCenter.default.post(name: giftView.InsufficientBalanceNotification, object: nil)
         }
         let serverErrorMessage = rootJson["message"].string ?? NetworkHelper.defaultErrorMessage
         result = NetworkResponseJson.serverError(errorCode: serverCode, errorMessage: serverErrorMessage)
         }
         case .failure(let error):
         let statusCode = response.response?.statusCode ?? 0
         result = NetworkResponseJson.networkError(errorCode: statusCode, errorMessage: error.localizedDescription)
         }
         observer.onNext(result)
         observer.onCompleted()
         }
         return Disposables.create()
         
         }
         */
        return Observable<NetworkResponseJson>.create { [weak self] (observer) -> Disposable in
            return Disposables.create()
        }
    }
}

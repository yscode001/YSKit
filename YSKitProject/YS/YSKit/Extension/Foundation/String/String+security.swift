//
//  String+security.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

public extension YSOriginalProtocol where OriginalType == String{
    
    /// base64编码
    @discardableResult func base64Encode(using:String.Encoding? = nil) -> String{
        if isEmptyOrWhiteSpace{
            return ""
        }
        let encoding = using == nil ? .utf8 : using!
        guard let data = originalObj.data(using: encoding) else{
            return ""
        }
        return data.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
    
    /// base64解码
    @discardableResult func base64Decode(using:String.Encoding? = nil) -> String{
        if isEmptyOrWhiteSpace{
            return ""
        }
        guard let data = Data(base64Encoded: originalObj, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) else{
            return ""
        }
        let encoding = using == nil ? .utf8 : using!
        guard let str = String(data: data, encoding: encoding) else{
            return ""
        }
        return str
    }
}

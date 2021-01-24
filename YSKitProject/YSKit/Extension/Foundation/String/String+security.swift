//
//  String+security.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType == String{
    
    /// base64编码
    @discardableResult func base64Encode(using:String.Encoding? = nil) -> String{
        if isEmptyOrWhiteSpace{
            return ""
        }
        let encoding = using == nil ? .utf8 : using!
        guard let data = originalObject.data(using: encoding) else{
            return ""
        }
        return data.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
    
    /// base64解码
    @discardableResult func base64Decode(using:String.Encoding? = nil) -> String{
        if isEmptyOrWhiteSpace{
            return ""
        }
        guard let data = Data(base64Encoded: originalObject, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) else{
            return ""
        }
        let encoding = using == nil ? .utf8 : using!
        guard let str = String(data: data, encoding: encoding) else{
            return ""
        }
        return str
    }
}

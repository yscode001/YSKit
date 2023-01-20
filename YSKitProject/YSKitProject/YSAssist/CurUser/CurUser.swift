//
//  CurUser.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import YSKit
import Foundation
import UIKit

/// 当前用户信息
class CurUser: NSObject, NSSecureCoding, Codable{
    
    // MARK: - 属性
    
    /// 唯一标识ID
    private(set) var id = ""
    
    /// 短ID显示给用户看
    private(set) var uid = ""
    
    /// token
    private(set) var token = ""
    
    var avatar = ""
    
    var name = ""
    
    var age = 18
    
    /// 0女，1男
    var gender = 0
    
    /// 信息改变，供外界监听
    static private(set) var infoChanged:BehaviorRelay<Void> = BehaviorRelay(value: ())
    
    // MARK: - 单例
    
    private override init() {
        super.init()
    }
    static let shared:CurUser = {
        if let url = CurUser.localFullPath,
           let data = try? Data(contentsOf: url),
           let user = try? NSKeyedUnarchiver.unarchivedObject(ofClass: CurUser.self, from: data){
            return user
        } else{
            let user = CurUser()
            user.save(sendInfoChangedEvent: true)
            return user
        }
    }()
    
    // MARK: - 归档编解码
    static var supportsSecureCoding: Bool = true
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(token, forKey: "token")
        aCoder.encode(avatar, forKey: "avatar")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(age, forKey: "age")
        aCoder.encode(gender, forKey: "gender")
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.ys.decodeString(forKey: "id")
        uid = aDecoder.ys.decodeString(forKey: "uid")
        token = aDecoder.ys.decodeString(forKey: "token")
        avatar = aDecoder.ys.decodeString(forKey: "avatar")
        name = aDecoder.ys.decodeString(forKey: "name")
        age = aDecoder.ys.decodeInteger(forKey: "age")
        gender = aDecoder.ys.decodeInteger(forKey: "gender")
    }
    
    // MARK: - 反序列化解码
    required init(from decoder: Decoder) throws {
        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else{
            return
        }
        id = container.ys_decodeString(forKey: .id)
        uid = container.ys_decodeString(forKey: .uid)
        token = container.ys_decodeString(forKey: .token)
        avatar = container.ys_decodeString(forKey: .avatar)
        name = container.ys_decodeString(forKey: .name)
        age = container.ys_decodeInt(forKey: .age)
        gender = container.ys_decodeInt(forKey: .gender)
    }
}

extension CurUser{
    
    /// 本地归档的完整路径
    private static var localFullPath: URL?{
        let directory = String.ys.sandbox_document.appendingPathComponent("CurUser")
        if !FileManager.default.fileExists(atPath: directory){
            try? FileManager.default.createDirectory(atPath: directory, withIntermediateDirectories: true, attributes: nil)
        }
        return URL(fileURLWithPath: directory.ys.nsstring.appendingPathComponent("CurUserInfo.archiver"))
    }
}

extension CurUser{
    
    /// 是否为空
    var isEmpty:Bool{
        return id.ys.isEmptyOrWhiteSpace || token.ys.isEmptyOrWhiteSpace
    }
}

extension CurUser{
    
    /// 持久化，会发送infoChanged
    func save(sendInfoChangedEvent: Bool){
        if let data = try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: true),
           let url = CurUser.localFullPath{
            try! data.write(to: url)
            if sendInfoChangedEvent{
                CurUser.infoChanged.accept(())
            }
            PrintTool.print("当前用户信息保存成功")
        }else{
            PrintTool.print("当前用户信息保存失败")
        }
    }
}

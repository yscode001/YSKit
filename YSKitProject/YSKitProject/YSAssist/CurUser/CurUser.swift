//
//  CurrentUser.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

/// 当前用户信息
class CurUser: NSObject, NSCoding, Codable{

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
        if let user = NSKeyedUnarchiver.unarchiveObject(withFile: CurUser.localFullPath) as? CurUser{
            return user
        } else{
            let user = CurUser()
            user.save()
            return user
        }
    }()
    
    // MARK: - 归档编解码
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
        id = (aDecoder.decodeObject(forKey: "id") as? String) ?? ""
        uid = (aDecoder.decodeObject(forKey: "uid") as? String) ?? ""
        token = (aDecoder.decodeObject(forKey: "token") as? String) ?? ""
        avatar = (aDecoder.decodeObject(forKey: "avatar") as? String) ?? ""
        name = (aDecoder.decodeObject(forKey: "name") as? String) ?? ""
        age = (aDecoder.decodeInteger(forKey: "age"))
        gender = (aDecoder.decodeInteger(forKey: "gender"))
    }
    
    // MARK: - 反序列化解码
    required init(from decoder: Decoder) throws {
        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else{
            return
        }
        id = container.ys_decode(String.self, forKey: .id)
        uid = container.ys_decode(String.self, forKey: .uid)
        token = container.ys_decode(String.self, forKey: .token)
        avatar = container.ys_decode(String.self, forKey: .avatar)
        name = container.ys_decode(String.self, forKey: .name)
        age = container.ys_decode(Int.self, forKey: .age)
        gender = container.ys_decode(Int.self, forKey: .gender)
    }
}

extension CurUser{
    
    /// 本地归档的完整路径
    private static var localFullPath:String{
        let directory = String.ys.sandbox_document.appendingPathComponent("CurrentUser")
        if !FileManager.default.fileExists(atPath: directory){
            try? FileManager.default.createDirectory(atPath: directory, withIntermediateDirectories: true, attributes: nil)
        }
        return directory.ys.nsstring.appendingPathComponent("CurrentUserInfo.archiver")
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
    func save(){
        if NSKeyedArchiver.archiveRootObject(self, toFile: CurUser.localFullPath) {
            CurUser.infoChanged.accept(())
            print("当前用户信息保存成功")
        }else{
            print("当前用户信息保存失败")
        }
    }
    
    /// 从网络更新数据，会发送infoChanged
    func update(){
        save()
    }
    
    /// 登录，会发送infoChanged
    func login(complete: @escaping(() -> ())){
        id = "sdfjkksdflkfjlkdfsjkldfkrtsfyrsd"
        uid = "35001100"
        token = "vcjkdlkewnsdfklksdfkksdlfjkuigfg"
        avatar = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201312%2F05%2F20131205172025_iwRF4.thumb.700_0.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1613983919&t=166382ee95f063ab9e2dcf631d800530"
        name = "哪吒"
        age = 20
        gender = 1
        save()
        complete()
    }
    
    /// 退出，不会发送infoChanged
    func logout(){
        id = ""
        uid = ""
        token = ""
        avatar = ""
        name = ""
        age = 18
        gender = 0
        if NSKeyedArchiver.archiveRootObject(self, toFile: CurUser.localFullPath) {
            print("退出--当前用户信息重置后保存--成功")
        }else{
            print("退出--当前用户信息重置后保存--失败")
        }
    }
}

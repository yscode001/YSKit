//
//  People.swift
//  YSKitProject
//
//  Created by 姚帅 on 2021/3/9.
//

/**
 解析失败：1、json中key不存在；2、其他原因解析失败
 解析失败将使用默认值
 */

class People: Codable, YSCoreProtocol{
    
    @Default.Int_0 var id:Int
    
    @Default.EmptyString var name:String
    
    @Default.True var isMale:Bool
    
    @Default.now var birthday:Date
    
    // 4、使用自定义类型的默认值
    @Default.AA_default var aa:AA
    
    func encode(to encoder: Encoder) throws {}
}

// MARK: - 自定义类型的默认值
// 1、定义类型，遵守Codable
struct AA:Codable {
    var aa = 0
}
// 2、扩展自定义类型，以这种形式提供默认值
extension AA{
    enum defaultVal: DefaultValueProtocol{ static let defaultValue = AA(aa: 123) }
}
// 3、扩展default，使其提供AA类型的默认值
extension Default{
    typealias AA_default = Default<AA.defaultVal>
}

// MARK: - 测试
// let p = People.ys.deserialize(dict: [:])
// print(p)

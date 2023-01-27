//
//  GenderEnum.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/27.
//

/// 性别
enum GenderEnum: Int{
    
    /// 还未选择性别
    case unknown = -1
    
    /// 女
    case female = 0
    
    /// 男
    case male = 1
    
    public static func GetGender(_ value: Int) -> GenderEnum{
        switch value{
        case GenderEnum.female.rawValue: return .female
        case GenderEnum.male.rawValue: return .male
        default: return .unknown
        }
    }
}

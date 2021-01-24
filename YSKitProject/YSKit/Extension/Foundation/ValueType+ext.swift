//
//  ValueType+ext.swift
//  Pods
//
//  Created by yaoshuai on 2020/12/30.
//

import Foundation

// MARK: - CGSize
public extension YSOriginalObjectProtocol where OriginalObjectType == CGSize{
    
    /// 宽或高小于等于0返回true
    var isEmpty:Bool{
        return originalObject.width <= 0 || originalObject.height <= 0
    }
}

// MARK: - 数值类型：Int、Float、CGFloat、Double
public extension YSOriginalObjectProtocol where OriginalObjectType == Int{
    
    /// 在范围内，直接返回，否则返回边界值
    func rangeVal(_ min: Int, _ max: Int) -> Int{
        if min <= originalObject && originalObject <= max{
            return originalObject
        } else if originalObject < min{
            return min
        } else{
            return max
        }
    }
}

public extension YSOriginalObjectProtocol where OriginalObjectType == Float{
    
    /// 在范围内，直接返回，否则返回边界值
    func rangeVal(_ min: Float, _ max: Float) -> Float{
        if min <= originalObject && originalObject <= max{
            return originalObject
        } else if originalObject < min{
            return min
        } else{
            return max
        }
    }
}

public extension YSOriginalObjectProtocol where OriginalObjectType == CGFloat{
    
    /// 在范围内，直接返回，否则返回边界值
    func rangeVal(_ min: CGFloat, _ max: CGFloat) -> CGFloat{
        if min <= originalObject && originalObject <= max{
            return originalObject
        } else if originalObject < min{
            return min
        } else{
            return max
        }
    }
}

public extension YSOriginalObjectProtocol where OriginalObjectType == Double{
    
    /// 在范围内，直接返回，否则返回边界值
    func rangeVal(_ min: Double, _ max: Double) -> Double{
        if min <= originalObject && originalObject <= max{
            return originalObject
        } else if originalObject < min{
            return min
        } else{
            return max
        }
    }
}

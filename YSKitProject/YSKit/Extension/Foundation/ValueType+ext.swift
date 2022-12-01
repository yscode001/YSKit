//
//  ValueType+ext.swift
//  Pods
//
//  Created by yaoshuai on 2020/12/30.
//

import Foundation

// MARK: - CGSize
public extension YSOriginalProtocol where OriginalType == CGSize{
    
    /// 宽或高小于等于0返回true
    var isEmpty:Bool{
        return originalObj.width <= 0 || originalObj.height <= 0
    }
}

// MARK: - 数值类型：Int、Float、CGFloat、Double
public extension YSOriginalProtocol where OriginalType == Int{
    
    /// 在范围内，直接返回，否则返回边界值
    func clamp(_ min: Int, _ max: Int) -> Int{
        if min <= originalObj && originalObj <= max{
            return originalObj
        } else if originalObj < min{
            return min
        } else{
            return max
        }
    }
}

public extension YSOriginalProtocol where OriginalType == Float{
    
    /// 在范围内，直接返回，否则返回边界值
    func clamp(_ min: Float, _ max: Float) -> Float{
        if min <= originalObj && originalObj <= max{
            return originalObj
        } else if originalObj < min{
            return min
        } else{
            return max
        }
    }
}

public extension YSOriginalProtocol where OriginalType == CGFloat{
    
    /// 在范围内，直接返回，否则返回边界值
    func clamp(_ min: CGFloat, _ max: CGFloat) -> CGFloat{
        if min <= originalObj && originalObj <= max{
            return originalObj
        } else if originalObj < min{
            return min
        } else{
            return max
        }
    }
}

public extension YSOriginalProtocol where OriginalType == Double{
    
    /// 在范围内，直接返回，否则返回边界值
    func clamp(_ min: Double, _ max: Double) -> Double{
        if min <= originalObj && originalObj <= max{
            return originalObj
        } else if originalObj < min{
            return min
        } else{
            return max
        }
    }
}

//
//  Array+ext.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

public extension Array{
    
    /// 是否包含指定下标，常用于做数组越界判断
    func contains(subscript subscriptValue: Int) -> Bool{
        return !isEmpty && -1 < subscriptValue && subscriptValue < count
    }
    
    /// 数组去重
    mutating func filterDuplicates<E: Equatable>(_ filter: (Element) -> E){
        var result = [Element]()
        for (idx,value) in self.enumerated().reversed() {
            let key = filter(value)
            if !result.map({filter($0)}).contains(key) {
                result.append(value)
            } else{
                remove(at: idx)
            }
        }
    }
    
    /// 删除下标 >= fromSubscript
    ///
    /// - Parameter fromSubscript: 删除的起始索引(包括)
    /// - Returns: 删除的条数
    @discardableResult mutating func delete(fromSubscript: Int) -> Int{
        if fromSubscript < 0 || fromSubscript >= count{
            return 0
        }
        let delCount = count - fromSubscript
        self.removeLast(delCount)
        return delCount
    }
    
    /// 删除下标 >= fromSubscript
    ///
    /// - Parameter fromSubscript: 删除的起始索引(包括)
    /// - Returns: 删除的条数
    @discardableResult mutating func remove(fromSubscript: Int) -> Int{
        return delete(fromSubscript: fromSubscript)
    }
}

//
//  Date+dayCount.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

public extension YSOriginalProtocol where OriginalType == Date{
    
    /// 当前日期所在月份的天数
    func dayCount_thisMonth(calendar: Calendar? = nil) -> Int{
        let cal = Calendar.getCalendar(calendar)
        let range = cal.range(of: .day, in: .month, for: originalObj)!
        return range.count
    }
    
    /// 当前日期减去(-)指定(参数)日期的天数
    func dayCount(date: Date?, calendar: Calendar? = nil) -> Int{
        guard let d = date else{
            return 0
        }
        let cal = Calendar.getCalendar(calendar)
        let coms = cal.dateComponents([.day], from: d.ys.start_day(calendar: calendar), to: start_day(calendar: calendar))
        return coms.day ?? 0
    }
}

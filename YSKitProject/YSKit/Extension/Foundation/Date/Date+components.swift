//
//  Date+components.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

public extension YSOriginalObjectProtocol where OriginalObjectType == Date{
    
    /// 组件集合
    func components(calendar: Calendar? = nil) -> DateComponents{
        let cal = Calendar.getCalendar(calendar)
        return cal.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday, .era, .quarter, .timeZone, .weekdayOrdinal, .weekOfMonth, .weekOfYear, .yearForWeekOfYear, .calendar], from: originalObject)
    }
}

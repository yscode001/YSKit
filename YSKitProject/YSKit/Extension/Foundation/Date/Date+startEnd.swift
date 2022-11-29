//
//  Date+startEnd.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

public extension YSOriginalProtocol where OriginalType == Date{
    
    /// 某一天的开始时间，如：2019-06-18 00:00:00
    func start_day(calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        return cal.startOfDay(for: originalObj)
    }
    
    /// 某一天的结束时间，如：2019-06-18 23:59:59
    func end_day(calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        var coms = DateComponents()
        coms.day = 1
        coms.second = -1
        return cal.date(byAdding: coms, to: start_day(calendar: calendar))!
    }
    
    /// 某一天所在月份的开始时间，如：2019-06-01 00:00:00
    func start_month(calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        var start = originalObj
        var interval:TimeInterval = 0
        let _ = cal.dateInterval(of: .month, start: &start, interval: &interval, for: originalObj)
        return start
    }
    
    /// 某一天所在月份的结束时间，如：2019-06-30 23:59:59
    func end_month(calendar: Calendar? = nil) ->Date{
        let cal = Calendar.getCalendar(calendar)
        var coms = DateComponents()
        coms.month = 1
        coms.second = -1
        return cal.date(byAdding: coms, to: start_month(calendar: calendar))!
    }
    
    /// 某一天所在年份的开始时间，如：2019-01-01 00:00:00
    func start_year(calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        var start = originalObj
        var interval:TimeInterval = 0
        let _ = cal.dateInterval(of: .year, start: &start, interval: &interval, for: originalObj)
        return start
    }
    
    /// 某一天所在年份的结束时间，如：2019-12-31 23:59:59
    func end_year(calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        var coms = DateComponents()
        coms.year = 1
        coms.second = -1
        return cal.date(byAdding: coms, to: start_year(calendar: calendar))!
    }
}

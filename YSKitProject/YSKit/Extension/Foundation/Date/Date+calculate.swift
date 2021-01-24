//
//  Date+calculate.swift
//  Pods
//
//  Created by yaoshuai on 2020/12/30.
//

import Foundation

// MARK: - 日期计算
public extension YSOriginalObjectProtocol where OriginalObjectType == Date{
    
    /// 添加秒
    func addSecond(_ second: Int, calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        var coms = DateComponents()
        coms.second = second
        return cal.date(byAdding: coms, to: originalObject)!
    }
    
    /// 添加分钟
    func addMinute(_ minute: Int, calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        var coms = DateComponents()
        coms.minute = minute
        return cal.date(byAdding: coms, to: originalObject)!
    }
    
    /// 添加小时
    func addHour(_ hour: Int, calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        var coms = DateComponents()
        coms.hour = hour
        return cal.date(byAdding: coms, to: originalObject)!
    }
    
    /// 添加天数
    func addDay(_ day: Int, calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        var coms = DateComponents()
        coms.day = day
        return cal.date(byAdding: coms, to: originalObject)!
    }
    
    /// 添加月份
    func addMonth(_ month: Int, calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        var coms = DateComponents()
        coms.month = month
        return cal.date(byAdding: coms, to: originalObject)!
    }
    
    /// 添加年数
    func addYear(_ year: Int, calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        var coms = DateComponents()
        coms.year = year
        return cal.date(byAdding: coms, to: originalObject)!
    }
    
    /// 计算日期
    func add(year: Int?, month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?, calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        var coms = DateComponents()
        coms.year = year
        coms.month = month
        coms.day = day
        coms.hour = hour
        coms.minute = minute
        coms.second = second
        return cal.date(byAdding: coms, to: originalObject)!
    }
    
    /// 重置时分秒
    func reset(hour: Int, minute: Int, second: Int, calendar: Calendar? = nil) -> Date{
        let cal = Calendar.getCalendar(calendar)
        return cal.date(bySettingHour: hour % 24, minute: minute % 60, second: second % 60, of: originalObject)!
    }
}

//
//  Date+compare.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

public extension YSOriginalProtocol where OriginalType == Date{
    
    /// 当前日期和指定日期(参数的日期)是否为同一天
    func isSameDay(_ date: Date?, calendar: Calendar? = nil) -> Bool{
        guard let d = date else{
            return false
        }
        let cal = Calendar.getCalendar(calendar)
        return cal.isDate(originalObj, inSameDayAs: d)
    }
    
    /// 当前日期是否在指定日期(参数的日期)的前一天
    func isPriorDay(_ date: Date?, calendar: Calendar? = nil) -> Bool{
        guard let d = date else{
            return false
        }
        let cal = Calendar.getCalendar(calendar)
        let previousDay = d.ys.addDay(-1)
        return cal.isDate(originalObj, inSameDayAs: previousDay)
    }
    
    /// 当前日期是否在指定日期(参数的日期)的后一天
    func isNextDay(_ date: Date?, calendar: Calendar? = nil) -> Bool{
        guard let d = date else{
            return false
        }
        let cal = Calendar.getCalendar(calendar)
        let nextDay = d.ys.addDay(1)
        return cal.isDate(originalObj, inSameDayAs: nextDay)
    }
    
    /// 当前日期和指定日期(参数的日期)是否在同一月
    func isInSameMonth(_ date: Date?, calendar: Calendar? = nil) -> Bool{
        guard let d = date else{
            return false
        }
        let thisC = originalObj.ys.components(calendar: calendar)
        let dC = d.ys.components(calendar: calendar)
        return thisC.year == dC.year && thisC.month == dC.month
    }
    
    /// 当前日期和指定日期(参数的日期)是否在同一年
    func isInSameYear(_ date: Date?, calendar: Calendar? = nil) -> Bool{
        guard let d = date else{
            return false
        }
        let thisC = originalObj.ys.components(calendar: calendar)
        let dC = d.ys.components(calendar: calendar)
        return thisC.year == dC.year
    }
}

public extension YSOriginalProtocol where OriginalType == Date{
    
    /// 当前日期是否是今天
    func isToday(calendar: Calendar? = nil) -> Bool{
        let cal = Calendar.getCalendar(calendar)
        return cal.isDateInToday(originalObj)
    }
    
    /// 当前日期是否是明天
    func isTomorrow(calendar: Calendar? = nil) -> Bool{
        let cal = Calendar.getCalendar(calendar)
        return cal.isDateInTomorrow(originalObj)
    }
    
    /// 当前日期是否是昨天
    func isYesterday(calendar: Calendar? = nil) -> Bool{
        let cal = Calendar.getCalendar(calendar)
        return cal.isDateInYesterday(originalObj)
    }
}

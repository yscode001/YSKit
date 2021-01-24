//
//  Locale+ext.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/31.
//

import Foundation

extension Locale{
    
    internal static func getLocale(_ locale: Locale?) -> Locale{
        return locale ?? Locale.current
    }
}

extension Calendar{
    
    internal static func getCalendar(_ calendar: Calendar?) -> Calendar{
        return calendar ?? Calendar.current
    }
}

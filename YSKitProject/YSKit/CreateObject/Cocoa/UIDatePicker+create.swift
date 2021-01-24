//
//  UIDatePicker+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType == UIDatePicker{
    
    static func create(mode: UIDatePicker.Mode, date: Date?, min: Date?, max: Date?) -> OriginalObjectType{
        return UIDatePicker().ys.then{
            $0.datePickerMode = mode
            $0.minimumDate = min
            $0.maximumDate = max
            guard let selD = date else{
                return
            }
            if let minD = min, selD < minD{
                // 选中日期比最小日期小，重置最小日期
                $0.minimumDate = selD
            }
            if let maxD = max, selD > maxD{
                // 选中日期比最大日期大，重置最大日期
                $0.maximumDate = selD
            }
            $0.date = selD
        }
    }
}

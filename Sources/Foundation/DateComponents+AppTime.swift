//
//  DateComponents+AppTime.swift
//  DATE
//
//  Created by jinfeng.peng on 2019/4/15.
//  Copyright © 2019 jinfeng.peng. All rights reserved.
//

import Foundation

public extension DateComponents {
    
    /// 过去
    var ago:Date? {
        return Calendar.current.date(byAdding: -self, to: Date())
    }
    
    /// 将来
    var future:Date? {
        return Calendar.current.date(byAdding: self, to: Date())
    }
    
    /// 字符串时间组件
    ///
    /// - Parameter unitsStyle: 字符串时间组件的样式
    /// - Returns: 字符串
    func string(of unitsStyle:DateComponentsFormatter.UnitsStyle) -> String? {
        let formatter = DateComponentsFormatter.init()
        formatter.unitsStyle = unitsStyle
        formatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
        return formatter.string(from: self)
    }
}

/// MARK: 时间组件运算符
public extension DateComponents {
    
    /// 时间组件自减运算
    static prefix func -(comps:DateComponents) -> DateComponents {
        var dateComps = DateComponents.init()
        
        if let year = comps.year {
            dateComps.year = -year
        }
        if let month = comps.month {
            dateComps.month = -month
        }
        if let day = comps.day {
            dateComps.day = -day
        }
        if let hour = comps.hour {
            dateComps.hour = -hour
        }
        if let minute = comps.minute {
            dateComps.minute = -minute
        }
        if let second = comps.second {
            dateComps.second = -second
        }
        if let nanosecond = comps.nanosecond {
            dateComps.nanosecond = -nanosecond
        }
        return dateComps
    }
    
    /// 时间组件加运算
    static func +(left:DateComponents,right:DateComponents) ->DateComponents {
        var dateComps = left
        
        if let year = right.year {
            dateComps.year = (dateComps.year ?? 0) + year
        }
        if let month = right.month {
            dateComps.month = (dateComps.month ?? 0) + month
        }
        if let day = right.day {
            dateComps.day = (dateComps.day ?? 0) + day
        }
        if let hour = right.hour {
            dateComps.hour = (dateComps.hour ?? 0) + hour
        }
        if let minute = right.minute {
            dateComps.minute = (dateComps.minute ?? 0) + minute
        }
        if let second = right.second {
            dateComps.second = (dateComps.second ?? 0) + second
        }
        if let nanosecond = right.nanosecond {
            dateComps.nanosecond = (dateComps.nanosecond ?? 0) + nanosecond
        }
        return dateComps
    }
    
    /// 时间组件减运算
    static func -(left:DateComponents,right:DateComponents) -> DateComponents {
        return left + (-right)
    }
}

//
//  Date+AppTime.swift
//  DATE
//
//  Created by jinfeng.peng on 2019/4/15.
//  Copyright © 2019 jinfeng.peng. All rights reserved.
//

import Foundation

public extension Date {
    
    /// 时代
    var era:Int? {
        return dateComponents.era
    }
    /// 年
    var year:Int? {
        return dateComponents.year
    }
    /// 月
    var month:Int? {
        return dateComponents.month
    }
    /// 日
    var day:Int? {
        return dateComponents.day
    }
    /// 小时
    var hour: Int? {
        return dateComponents.hour
    }
    /// 分
    var minute: Int? {
        return dateComponents.minute
    }
    /// 秒
    var second: Int? {
        return dateComponents.second
    }
    /// 毫秒
    var nanosecond: Int? {
        return dateComponents.nanosecond
    }
    /// 星期
    var weekday: Int? {
        return dateComponents.weekday
    }
    
    /// 日期组件
    private var dateComponents:DateComponents {
        return calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday], from: self)
    }
    
    /// 日历对象
    private var calendar:Calendar {
        return .current
    }
    
    /// 根据年月日时分秒来创建日期
    ///
    /// - Parameters:
    ///   - era: 时代
    ///   - year: 年
    ///   - month: 月
    ///   - day: 日
    ///   - hour: 时
    ///   - minute: 分
    ///   - second: 秒
    ///   - nanosecond: 纳秒
    ///   - calendar: 日历对象
    init(era: Int?, year: Int?, month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?, nanosecond: Int?, on calendar: Calendar = Calendar.init(identifier: .gregorian)) {
        let now = Date()
        var comps = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond], from: now)
        comps.era = era
        comps.year = year
        comps.month = month
        comps.day = day
        comps.hour = hour
        comps.minute = minute
        comps.second = second
        comps.nanosecond = nanosecond

        let date = calendar.date(from: comps)
        self.init(timeInterval: 0, since: date!)
    }
    
    /// 根据年月日时分秒来创建日期
    init(year:Int?,month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?, nanosecond: Int = 0) {
        self.init(era: nil, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond)
    }
    
    /// 根据年月日来创建日期
    init(year:Int?,month: Int?, day: Int?) {
        self.init(era: nil, year: year, month: month, day: day, hour: 0, minute: 0, second: 0, nanosecond: 0)
    }
    
    /// 获取今天的日期
    ///
    /// - Returns: 今天的日期
    static func today() -> Date {
        let now = Date()
        return Date.init(year: now.year, month: now.month, day: now.day)
    }
    
    /// 获取昨天的日期
    ///
    /// - Returns: 昨天的日期
    static func yesterday() -> Date? {
        return today() - 1.day
    }
    
    /// 获取明天的q日期
    ///
    /// - Returns: 明天的日期
    static func tomorrow() ->Date? {
        return today() + 1.day
    }
}

///MARK: 时间的运算

public extension Date {
    
    static func +(left: Date, right: DateComponents) -> Date? {
       return Calendar.current.date(byAdding: right, to: left)
    }
    static func -(left: Date, right: DateComponents) -> Date? {
        return Calendar.current.date(byAdding: -right, to: left)
    }
}

/// MARK: 修改时间

public extension Date {
    
    /// 根据年月日时分秒来修改日期
    ///
    /// - Parameters:
    ///   - year: 年
    ///   - month: 月
    ///   - day: 日
    ///   - hour: 时
    ///   - minute: 分
    ///   - second: 秒
    ///   - nanosecond: 纳秒
    /// - Returns: 修改后的日期
    func change(year: Int?, month: Int?, day: Int? , hour: Int?, minute: Int? , second: Int?, nanosecond: Int?) -> Date? {
        var comps = self.dateComponents
        comps.year = year ?? self.year
        comps.month = month ?? self.month
        comps.day = day ?? self.day
        comps.hour = hour ?? self.hour
        comps.minute = minute ?? self.minute
        comps.second = second ?? self.second
        comps.nanosecond = nanosecond ?? self.nanosecond
        
        return calendar.date(from: comps)
    }
    
    /// 根据年来调整日期
    ///
    /// - Parameter year: 年
    /// - Returns: 调整后的日期
    func change(year: Int) -> Date? {
        return change(year: year, month: nil, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nil)
    }

    /// 根据月来调整日期
    ///
    /// - Parameter month: 月
    /// - Returns: 调整后的日期
    func change(month: Int) -> Date? {
        return change(year: nil, month: month, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nil)
    }
    
    /// 根据日来调整日期
    ///
    /// - Parameter day: 日
    /// - Returns: 调整后的日期
    func change(day: Int) -> Date? {
        return change(year: nil, month: nil, day: day, hour: nil, minute: nil, second: nil, nanosecond: nil)
    }
    
    /// 根据时来调整日期
    ///
    /// - Parameter hour: 时
    /// - Returns: 调整后的日期
    func change(hour: Int) -> Date? {
        return change(year: nil, month: nil, day: nil, hour: hour, minute: nil, second: nil, nanosecond: nil)
    }
    
    /// 根据分来调整日期
    ///
    /// - Parameter minute: 分
    /// - Returns: 调整后的日期
    func change(minute: Int) -> Date? {
        return change(year: nil, month: nil, day: nil, hour: nil, minute: minute, second: nil, nanosecond: nil)
    }
    
    /// 根据秒来调整日期
    ///
    /// - Parameter second: 秒
    /// - Returns: 调整后的日期
    func change(second: Int) -> Date? {
        return change(year: nil, month: nil, day: nil, hour: nil, minute: nil, second: second, nanosecond: nil)
    }
    
    /// 根据纳秒来调整日期
    ///
    /// - Parameter nanosecond: 纳秒
    /// - Returns: 调整后的日期
    func change(nanosecond: Int) -> Date? {
        return change(year: nil, month: nil, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nanosecond)
    }
    
    /// 根据周来调整日期
    ///
    /// - Parameter weekday: 周
    /// - Returns: 调整后的日期
    func change(weekday: Int) -> Date? {
        return self - (self.weekday! - weekday).day
    }
}

/// MARK: 截断时间

public extension Date {
    
    /// 截断一个日期
    ///
    /// - Parameter comps: 日期对应的组件段
    /// - Returns: 截断后的日期
    func truncated(_ comps:[Calendar.Component]) -> Date? {
        var dateComponents = self.dateComponents
        
        for component in comps {
            switch component {
            case .month:
                dateComponents.month = 1
            case .day:
                dateComponents.day = 1
            case .hour:
                dateComponents.hour = 0
            case .minute:
                dateComponents.minute = 0
            case .second:
                dateComponents.second = 0
            case .nanosecond:
                dateComponents.nanosecond = 0
            default:
                continue
            }
        }
        
        return calendar.date(from: dateComponents)
    }
    
    /// 截断一个日期
    ///
    /// - Parameter component: 从某个组件段开始截断
    /// - Returns: 截断后的日期
    func truncated(from component: Calendar.Component) -> Date? {
        switch component {
        case .month:
            return truncated([.month, .day, .hour, .minute, .second, .nanosecond])
        case .day:
            return truncated([.day, .hour, .minute, .second, .nanosecond])
        case .hour:
            return truncated([.hour, .minute, .second, .nanosecond])
        case .minute:
            return truncated([.minute, .second, .nanosecond])
        case .second:
            return truncated([.second, .nanosecond])
        case .nanosecond:
            return truncated([.nanosecond])
        default:
            return self
        }
    }
}
/// MARK: 字符串时间

public extension Date {
    
    /// 输出日期字符串
    ///
    /// - Parameters:
    ///   - dateStyle: 日期格式样式
    ///   - timeStyle: 时间格式样式
    /// - Returns: 格式化后的字符串
    func string(with dateStyle:DateFormatter.Style,timeStyle:DateFormatter.Style) -> String {
        let formatter = DateFormatter.init()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        
        return formatter.string(from: self)
    }
    
    /// 输出日期字符串
    ///
    /// - Parameter dateStyle: 日期格式
    /// - Returns: 格式化后的字符串
    func dateString(in dateStyle: DateFormatter.Style) -> String {
        return string(with: dateStyle, timeStyle: .none)
    }
    
    /// 输出时间字符串
    ///
    /// - Parameter timeStyle: 时间格式
    /// - Returns: 格式化后的字符串
    func timeString(in timeStyle: DateFormatter.Style) -> String {
        return string(with: .none, timeStyle: timeStyle)
    }
}


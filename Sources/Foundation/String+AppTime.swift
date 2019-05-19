//
//  String+AppTime.swift
//  DATE
//
//  Created by jinfeng.peng on 2019/4/15.
//  Copyright © 2019 jinfeng.peng. All rights reserved.
//

import Foundation

public extension String {

    /// 时间格式字符串
    
    enum DateHelpFormatter : String{
        case fullDateTime           = "MMM d, yyyy h:mm a"
        case fullDate               = "MMM d, yyyy"
        case shortDateTime          = "MMM d h:mm a"
        case shortDate              = "MMM d"
        case weekday                = "EEEE"
        case weekdayTime            = "EEEE h:mm a"
        case time                   = "h:mm a"
        case prefixTime             = "'at' h:mm a"
        case SQLDate                = "yyyy-MM-dd"
        case SQLTime                = "HH:mm:ss"
        case SQLDateTruncatedMonth  = "yyyy-MM"
        case SQLDateTruncatedSecond = "yyyy-MM-dd HH:mm"
        case SQLDateTime            = "yyyy-MM-dd HH:mm:ss"
    }
    
    /// 将时间字符串按照对应的格式转化为日期
    ///
    /// - Parameter format: 时间格式字符串
    /// - Returns: 转化后的日期
    func date(using format: DateHelpFormatter) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = Locale.current.calendar.timeZone
        
        return dateFormatter.date(from: self)
    }
}

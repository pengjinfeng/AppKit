//
//  Int+AppTime.swift
//  DATE
//
//  Created by jinfeng.peng on 2019/4/15.
//  Copyright © 2019 jinfeng.peng. All rights reserved.
//

import Foundation

public extension Int {
    
    /// 年
    var year: DateComponents {
        return DateComponents(year: self)
    }
    
    /// 月
    var month: DateComponents {
        return DateComponents(month: self)
    }
    
    /// 周
    var week: DateComponents {
        return DateComponents(day: 7 * self)
    }
    
    /// 日
    var day: DateComponents {
        return DateComponents(day: self)
    }
    
    /// 时
    var hour: DateComponents {
        return DateComponents(hour: self)
    }
    
    /// 分
    var minute: DateComponents {
        return DateComponents(minute: self)
    }
    
    /// 秒
    var second: DateComponents {
        return DateComponents(second: self)
    }
 
    /// 纳秒
    var nanosecond: DateComponents {
        return DateComponents(nanosecond: self)
    }
}

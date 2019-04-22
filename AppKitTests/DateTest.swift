//
//  DateTest.swift
//  DATETests
//
//  Created by jinfeng.peng on 2019/4/22.
//  Copyright © 2019 jinfeng.peng. All rights reserved.
//

import XCTest
@testable import AppKit

class DateTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntDate() {
        XCTAssertEqual(1.year.year, 1)
        XCTAssertEqual(1.month.month, 1)
        XCTAssertEqual(1.day.day, 1)
        XCTAssertEqual(1.hour.hour, 1)
        XCTAssertEqual(1.second.second, 1)
        XCTAssertEqual(1.minute.minute, 1)
        XCTAssertEqual(1.nanosecond.nanosecond, 1)
    }
    
    func testStringDate() {
        let date = "2019-8-21 10:22:21".date(using: .SQLDateTime)
        XCTAssertEqual(date?.year, 2019)
        XCTAssertEqual(date?.month, 8)
        XCTAssertEqual(date?.day, 21)
        XCTAssertEqual(date?.hour, 10)
        XCTAssertEqual(date?.minute, 22)
        XCTAssertEqual(date?.second, 21)
    }
    
    func testDateComponents() {
        testAgoYear()
        testAgoMonth()
        testFutureYear()
        testFutureMonth()
        testStringCompenents()
    }
    func testAgoYear() {
         // 当前时间 Date() 2019-04-22 13:48:50
        var comps = DateComponents.init()
        comps.year = 1
        XCTAssertEqual(comps.ago?.year, Date().year! - 1)
    }
    
    func testAgoMonth() {
        // 当前时间 Date() 2019-04-22 13:48:50
        var comps = DateComponents.init()
        comps.month = 4
        // 时间低于1月，会自动将年份减一，时分秒类似
        XCTAssertEqual(comps.ago?.month, 12)
    }

    func testFutureYear() {
        var comps = DateComponents.init()
        comps.year = 1
        XCTAssertEqual(comps.future?.year, Date().year! + 1)
    }
    func testFutureMonth() {
         // 当前时间 Date() 2019-04-22 13:48:50
        var comps = DateComponents.init()
        comps.month = 13
        // 时间超过12月，会自动将年份加一，时分秒类似
        XCTAssertEqual(comps.future?.month, 5)
    }
    
    func testStringCompenents() {
        var comps = DateComponents.init()
        comps.year = 2019
        comps.month = 4
        comps.day = 21
        let str = comps.string(of: .full)
        XCTAssertEqual(str, "2,019 years, 4 months, 3 weeks")
    }
    
    func testDate() {
        testDateChange()
        testDateString()
        testDateProperty()
        testDateTruncated()
    }
    
    func testDateProperty() {
        let date = Date.init()
        XCTAssert(date.year == 2019, "属性获取的时间与实际不符")
        
        let today = Date.today()
        XCTAssertEqual(today.day, date.day)
        
        let yesterday = Date.yesterday()
        XCTAssertEqual(yesterday?.day, date.day! - 1)
        
        let tomorrow = Date.tomorrow()
        XCTAssertEqual(tomorrow?.day, date.day! + 1)
    }
    
    func testDateChange() {
        let date = Date.init()
        let d = date.change(year: 10)
        XCTAssert(d?.year == 10, "修改的时间与实际不符")
    }
    
    func testDateTruncated() {
        let date = Date.init()
        let d = date.truncated([.year,.month,.day,.hour,.minute,.second])
        XCTAssertEqual(d?.year, 2019)
        XCTAssertEqual(d?.month, 1)
        XCTAssertEqual(d?.day, 1)
        XCTAssertEqual(d?.hour, 0)
        XCTAssertEqual(d?.minute, 0)
        XCTAssertEqual(d?.second, 0)
    }
    func testDateString() {
        let date = Date.init()
        let str = date.string(with: .short, timeStyle: .none)
        // 过了今天这个测试用例就失败
        XCTAssertEqual(str, "4/22/19")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

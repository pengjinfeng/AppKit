//
//  SecretTest.swift
//  AppKitTests
//
//  Created by jinfeng.peng on 2019/5/21.
//  Copyright © 2019 jinfeng. All rights reserved.
//

import XCTest
import AppKit

class SecretTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        testBase64()
        testMd5()
        testSha1()
    }
    func testBase64() {
        let str = "unicode"
        let base64Str = str.base64Encoding()
        XCTAssert(base64Str == "dW5pY29kZQ==")
        let decodedStr = base64Str?.base64Decoded()
        XCTAssert(str == decodedStr)
    }
    
    func testMd5()  {
        let str = "unicode"
        let md5 = str.md5()
        XCTAssertNotNil(md5)
        
    }
    
    func testSha1()  {
        let str = "unicode"
        let sha1 = str.sha1()
        XCTAssertNotNil(sha1)
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

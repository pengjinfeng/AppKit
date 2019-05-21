//
//  String+Secret.swift
//  AppKit
//
//  Created by jinfeng.peng on 2019/5/20.
//  Copyright © 2019 jinfeng. All rights reserved.
//

import Foundation
import CommonCrypto

public extension String {
    
    /// base64编码
    func base64Encoding() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
    
    /// base64解码
    func base64Decoded() -> String? {
        if let data = Data.init(base64Encoded: self) {
            return String.init(data: data, encoding: .utf8)
        }
        return nil
    }
    
    /// md5加密
    func md5() -> String {
        let str = self.cString(using: .utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    /// md5加密
    func sha1() -> String {
        let data = self.data(using: .utf8)
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        let newData = NSData.init(data: data!)
        CC_SHA1(newData.bytes, CC_LONG(data!.count), &digest)
        let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        for byte in digest {
            output.appendFormat("%02x", byte)
        }
        return output as String
    }
  
}

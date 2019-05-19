//
//  Device.swift
//  Prompt
//
//  Created by jinfeng on 2019/4/17.
//  Copyright © 2019 jinfeng. All rights reserved.
//  如果有新的机型加入及时维护

import Foundation
import UIKit

public enum Device {
    case iPodTouch5
    case iPodTouch6
    case iPhone4
    case iPhone4s
    case iPhone5
    case iPhone5c
    case iPhone5s
    case iPhone6
    case iPhone6Plus
    case iPhone6s
    case iPhone6sPlus
    case iPhone7
    case iPhone7Plus
    case iPhoneSE
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPhoneXS
    case iPhoneXSMax
    case iPhoneXR
    case iPad2
    case iPad3
    case iPad4
    case iPadAir
    case iPadAir2
    case iPad5
    case iPad6
    case iPadAir3
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadMini5
    case iPadPro9Inch
    case iPadPro12Inch
    case iPadPro12Inch2
    case iPadPro10Inch
    case iPadPro11Inch
    case iPadPro12Inch3
    indirect case simulator(Device)
    case unknown(String)
}

//MARK: -- 基本信息
public extension Device {
    static var current:Device {
        return Device.mapToDevice(identifier: identifier)
    }
    // 手机的标识 eg："iPod5,1"
    static var identifier:String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror.init(reflecting: systemInfo.machine)
        let identifier = mirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }()
    
    // 将标识转变为对应的类型
    static func mapToDevice(identifier:String) -> Device {
        switch identifier {
        case "iPod5,1": return .iPodTouch5
        case "iPod7,1": return .iPodTouch6
        case "iPhone3,1", "iPhone3,2", "iPhone3,3": return .iPhone4
        case "iPhone4,1": return .iPhone4s
        case "iPhone5,1", "iPhone5,2": return .iPhone5
        case "iPhone5,3", "iPhone5,4": return .iPhone5c
        case "iPhone6,1", "iPhone6,2": return .iPhone5s
        case "iPhone7,2": return .iPhone6
        case "iPhone7,1": return .iPhone6Plus
        case "iPhone8,1": return .iPhone6s
        case "iPhone8,2": return .iPhone6sPlus
        case "iPhone9,1", "iPhone9,3": return .iPhone7
        case "iPhone9,2", "iPhone9,4": return .iPhone7Plus
        case "iPhone8,4": return .iPhoneSE
        case "iPhone10,1", "iPhone10,4": return .iPhone8
        case "iPhone10,2", "iPhone10,5": return .iPhone8Plus
        case "iPhone10,3", "iPhone10,6": return .iPhoneX
        case "iPhone11,2": return .iPhoneXS
        case "iPhone11,4", "iPhone11,6": return .iPhoneXSMax
        case "iPhone11,8": return .iPhoneXR
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return .iPad2
        case "iPad3,1", "iPad3,2", "iPad3,3": return .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6": return .iPad4
        case "iPad4,1", "iPad4,2", "iPad4,3": return .iPadAir
        case "iPad5,3", "iPad5,4": return .iPadAir2
        case "iPad6,11", "iPad6,12": return .iPad5
        case "iPad7,5", "iPad7,6": return .iPad6
        case "iPad11,3", "iPad11,4": return .iPadAir3
        case "iPad2,5", "iPad2,6", "iPad2,7": return .iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6": return .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9": return .iPadMini3
        case "iPad5,1", "iPad5,2": return .iPadMini4
        case "iPad11,1", "iPad11,2": return .iPadMini5
        case "iPad6,3", "iPad6,4": return .iPadPro9Inch
        case "iPad6,7", "iPad6,8": return .iPadPro12Inch
        case "iPad7,1", "iPad7,2": return .iPadPro12Inch2
        case "iPad7,3", "iPad7,4": return .iPadPro10Inch
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": return .iPadPro11Inch
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8": return .iPadPro12Inch3
        case "i386", "x86_64": return .simulator(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))
        default: return .unknown(identifier)
        }
    }
    // 屏幕尺寸
    var screenSize:Double {
        switch self {
        case .iPodTouch5: return 4
        case .iPodTouch6: return 4
        case .iPhone4: return 3.5
        case .iPhone4s: return 3.5
        case .iPhone5: return 4
        case .iPhone5c: return 4
        case .iPhone5s: return 4
        case .iPhone6: return 4.7
        case .iPhone6Plus: return 5.5
        case .iPhone6s: return 4.7
        case .iPhone6sPlus: return 5.5
        case .iPhone7: return 4.7
        case .iPhone7Plus: return 5.5
        case .iPhoneSE: return 4
        case .iPhone8: return 4.7
        case .iPhone8Plus: return 5.5
        case .iPhoneX: return 5.8
        case .iPhoneXS: return 5.8
        case .iPhoneXSMax: return 6.5
        case .iPhoneXR: return 6.1
        case .iPad2: return 9.7
        case .iPad3: return 9.7
        case .iPad4: return 9.7
        case .iPadAir: return 9.7
        case .iPadAir2: return 9.7
        case .iPad5: return 9.7
        case .iPad6: return 9.7
        case .iPadAir3: return 10.5
        case .iPadMini: return 7.9
        case .iPadMini2: return 7.9
        case .iPadMini3: return 7.9
        case .iPadMini4: return 7.9
        case .iPadMini5: return 7.9
        case .iPadPro9Inch: return 9.7
        case .iPadPro12Inch: return 12.9
        case .iPadPro12Inch2: return 12.9
        case .iPadPro10Inch: return 10.5
        case .iPadPro11Inch: return 11.0
        case .iPadPro12Inch3: return 12.9
        case .simulator(let device): return device.screenSize
        case .unknown: return -1
        }
    }
    
    // 是否是当前机型
    private var isCurrent: Bool {
        return self == Device.current
    }
    // e.g. @"iPhone", @"iPod touch"
    var model:String? {
        guard isCurrent else {
            return nil
        }
        return UIDevice.current.model
    }
    // 名字 eg：“Jinfeng”
    var name:String? {
        guard isCurrent else {
            return nil
        }
        return UIDevice.current.name
    }
    // eg:"iOS"
    var systemName:String? {
        guard isCurrent else {
            return nil
        }
        return UIDevice.current.systemName
    }
    // e.g. @"8.0"
    var systemVersion:String? {
        guard isCurrent else {
            return nil
        }
        return UIDevice.current.systemVersion
    }
    // localized version of model
    var localizedModel:String? {
        guard isCurrent else {
            return nil
        }
        return UIDevice.current.localizedModel
    }
    // 每单位像素个数
    var ppi:Int? {
        switch self {
        case .iPodTouch5: return 326
        case .iPodTouch6: return 326
        case .iPhone4: return 326
        case .iPhone4s: return 326
        case .iPhone5: return 326
        case .iPhone5c: return 326
        case .iPhone5s: return 326
        case .iPhone6: return 326
        case .iPhone6Plus: return 401
        case .iPhone6s: return 326
        case .iPhone6sPlus: return 401
        case .iPhone7: return 326
        case .iPhone7Plus: return 401
        case .iPhoneSE: return 326
        case .iPhone8: return 326
        case .iPhone8Plus: return 401
        case .iPhoneX: return 458
        case .iPhoneXS: return 458
        case .iPhoneXSMax: return 458
        case .iPhoneXR: return 326
        case .iPad2: return 132
        case .iPad3: return 264
        case .iPad4: return 264
        case .iPadAir: return 264
        case .iPadAir2: return 264
        case .iPad5: return 264
        case .iPad6: return 264
        case .iPadAir3: return 264
        case .iPadMini: return 163
        case .iPadMini2: return 326
        case .iPadMini3: return 326
        case .iPadMini4: return 326
        case .iPadMini5: return 326
        case .iPadPro9Inch: return 264
        case .iPadPro12Inch: return 264
        case .iPadPro12Inch2: return 264
        case .iPadPro10Inch: return 264
        case .iPadPro11Inch: return 264
        case .iPadPro12Inch3: return 264
        case .simulator(let device): return device.ppi
        case .unknown: return nil
        }
    }
    // 手机屏幕亮度 0~1
    var screenBrightness:Int {
        return Int(UIScreen.main.brightness)
    }
}

//MARK: -- 机器描述
extension Device:Equatable {
    
    public var description: String {
        switch self {
        case .iPodTouch5: return "iPod Touch 5"
        case .iPodTouch6: return "iPod Touch 6"
        case .iPhone4: return "iPhone 4"
        case .iPhone4s: return "iPhone 4s"
        case .iPhone5: return "iPhone 5"
        case .iPhone5c: return "iPhone 5c"
        case .iPhone5s: return "iPhone 5s"
        case .iPhone6: return "iPhone 6"
        case .iPhone6Plus: return "iPhone 6 Plus"
        case .iPhone6s: return "iPhone 6s"
        case .iPhone6sPlus: return "iPhone 6s Plus"
        case .iPhone7: return "iPhone 7"
        case .iPhone7Plus: return "iPhone 7 Plus"
        case .iPhoneSE: return "iPhone SE"
        case .iPhone8: return "iPhone 8"
        case .iPhone8Plus: return "iPhone 8 Plus"
        case .iPhoneX: return "iPhone X"
        case .iPhoneXS: return "iPhone Xs"
        case .iPhoneXSMax: return "iPhone Xs Max"
        case .iPhoneXR: return "iPhone Xʀ"
        case .iPad2: return "iPad 2"
        case .iPad3: return "iPad (3rd generation)"
        case .iPad4: return "iPad (4th generation)"
        case .iPadAir: return "iPad Air"
        case .iPadAir2: return "iPad Air 2"
        case .iPad5: return "iPad (5th generation)"
        case .iPad6: return "iPad (6th generation)"
        case .iPadAir3: return "iPad Air (3rd generation)"
        case .iPadMini: return "iPad Mini"
        case .iPadMini2: return "iPad Mini 2"
        case .iPadMini3: return "iPad Mini 3"
        case .iPadMini4: return "iPad Mini 4"
        case .iPadMini5: return "iPad Mini (5th generation)"
        case .iPadPro9Inch: return "iPad Pro (9.7-inch)"
        case .iPadPro12Inch: return "iPad Pro (12.9-inch)"
        case .iPadPro12Inch2: return "iPad Pro (12.9-inch) (2nd generation)"
        case .iPadPro10Inch: return "iPad Pro (10.5-inch)"
        case .iPadPro11Inch: return "iPad Pro (11-inch)"
        case .iPadPro12Inch3: return "iPad Pro (12.9-inch) (3rd generation)"
        case .simulator(let model): return "Simulator (\(model))"
        case .unknown(let identifier): return identifier
        }
    }
    
    /// 自定义运算符
    ///
    /// - Parameters:
    ///   - lhs: 比较的机型
    ///   - rhs: 比较的机型
    /// - Returns: 比较的结果
    public static func ==(lhs:Device,rhs:Device) -> Bool {
        return lhs.description == rhs.description
    }
}

//MARK: -- 横竖屏
public extension Device {
    enum Orientation {
        case landscape  //横屏
        case portrait   //竖屏
    }
    var orientation :Orientation {
        if UIDevice.current.orientation.isLandscape {
            return .landscape
        }else {
            return .portrait
        }
    }
    
}

//MARK: -- 机型、模拟器
public extension Device {
    
    /// 所有的pod
    static var allPods: [Device] {
        return [.iPodTouch5, .iPodTouch6]
    }
    
    /// 所有的iphone
    static var allPhones: [Device] {
        return [.iPhone4, .iPhone4s, .iPhone5, .iPhone5c, .iPhone5s, .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus, .iPhone7, .iPhone7Plus, .iPhoneSE, .iPhone8, .iPhone8Plus, .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR]
    }
    
    /// 所有的ipad
    static var allPads: [Device] {
        return [.iPad2, .iPad3, .iPad4, .iPadAir, .iPadAir2, .iPad5, .iPad6, .iPadAir3, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadMini5, .iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2, .iPadPro10Inch, .iPadPro11Inch, .iPadPro12Inch3]
    }
    
    /// X系列机型
    static var allXSeriesDevices: [Device] {
        return [.iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR]
    }
    
    /// 所有Plus系列机型
    static var allPlusSizedDevices: [Device] {
        return [.iPhone6Plus, .iPhone6sPlus, .iPhone7Plus, .iPhone8Plus]
    }
    
    /// 所有pro机型
    static var allProDevices: [Device] {
        return [.iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2, .iPadPro10Inch, .iPadPro11Inch, .iPadPro12Inch3]
    }
    
    /// 所有nimi机型
    static var allMiniDevices: [Device] {
        return [.iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadMini5]
    }
    
    /// 所有pod模拟器
    static var allSimulatorPods: [Device] {
        return allPods.map(Device.simulator)
    }
    
    /// 所有iphone模拟器
    static var allSimulatorPhones: [Device] {
        return allPhones.map(Device.simulator)
    }
    
    /// 所有ipad模拟器
    static var allSimulatorPads: [Device] {
        return allPads.map(Device.simulator)
    }
    
    /// 所有ipad mini模拟器
    static var allSimulatorMiniDevices: [Device] {
        return allMiniDevices.map(Device.simulator)
    }
    
    /// 所有X系列模拟器
    static var allSimulatorXSeriesDevices: [Device] {
        return allXSeriesDevices.map(Device.simulator)
    }
    
    /// 所有plus系列模拟器
    static var allSimulatorPlusSizedDevices: [Device] {
        return allPlusSizedDevices.map(Device.simulator)
    }
    
    /// 所有pro系列模拟器
    static var allSimulatorProDevices: [Device] {
        return allProDevices.map(Device.simulator)
    }
    
    /// 是否是pod机器
    var isPod: Bool {
        return isOneOf(Device.allPods) || isOneOf(Device.allSimulatorPods)
    }
    
    /// 是否是iphone机器
    var isPhone: Bool {
        return (isOneOf(Device.allPhones)
            || isOneOf(Device.allSimulatorPhones)
            || (UIDevice.current.userInterfaceIdiom == .phone && isCurrent)) && !isPod
    }
    
    /// 是否是pad机器
    var isPad: Bool {
        return isOneOf(Device.allPads)
            || isOneOf(Device.allSimulatorPads)
            || (UIDevice.current.userInterfaceIdiom == .pad && isCurrent)
    }
    
    /// 是否是模拟器
    var isSimulator: Bool {
        return isOneOf(Device.allSimulators)
    }

    
    /// 所有支持touchID的机器
    static var allTouchIDCapableDevices: [Device] {
        return [.iPhone5s, .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus, .iPhone7, .iPhone7Plus, .iPhoneSE, .iPhone8, .iPhone8Plus, .iPadAir2, .iPad5, .iPad6, .iPadAir3, .iPadMini3, .iPadMini4, .iPadMini5, .iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2, .iPadPro10Inch]
    }
    
    /// 所有支持faceID的机器
    static var allFaceIDCapableDevices: [Device] {
        return [.iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, .iPadPro11Inch, .iPadPro12Inch3]
    }
    
    /// 该机器是否支持touchID
    var isTouchIDCapable: Bool {
        return isOneOf(Device.allTouchIDCapableDevices)
    }
    
    /// 该机器是否支持faceID
    var isFaceIDCapable: Bool {
        return isOneOf(Device.allFaceIDCapableDevices)
    }
    
    /// 是否有传感器(eg：Touch ID 、 Face ID)
    var hasBiometricSensor: Bool {
        return isTouchIDCapable || isFaceIDCapable
    }

    /// 所有模拟器
    static var allSimulators: [Device] {
        return allRealDevices.map(Device.simulator)
    }
    /// 所有机型
    static var allRealDevices: [Device] {
        return allPods + allPhones + allPads
    }
    
    /// device是否是该类型中的一种
    ///
    /// - Parameter devices: 判定类型
    /// - Returns: 是、否
    func isOneOf(_ devices: [Device]) -> Bool {
        return devices.contains(self)
    }

}


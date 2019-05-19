//
//  ListData.swift
//  ListView
//
//  Created by jinfeng.peng on 2019/4/28.
//  Copyright © 2019 jinfeng.peng. All rights reserved.
//

import UIKit

public class SectionData: NSObject {
    
    internal var mRows:[CellModelProtocol] = []
    public var mHeaderClass:AnyClass?
    public var mFooterClass:AnyClass?
}

/// Mark:

public extension SectionData {
    // 区数据源个数
    func count() -> Int{
        return self.mRows.count
    }
    // 获取区对应的行数据源
    func get(data index:Int) -> CellModelProtocol? {
        guard index >= 0 else {
            return nil
        }
        guard index < self.mRows.count else {
            return nil
        }
        return self.mRows[index];
    }
     // 添加区对应的数据源
    func add(data model:CellModelProtocol) {
        self.mRows.append(model)
    }
    // 移除对应区的数据源
    func remove(data index:Int) -> Bool {
        guard self.mRows.count > 0 else {
            return false
        }
        guard index >= 0 else {
            return false
        }
        guard index < self.mRows.count else {
            return false
        }
        self.mRows.remove(at: index)
        return true
    }
    // 移除所有数据源
    func removeAll(){
        self.mRows.removeAll()
    }
}

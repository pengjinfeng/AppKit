//
//  ListData.swift
//  ListView
//
//  Created by jinfeng.peng on 2019/4/28.
//  Copyright © 2019 jinfeng.peng. All rights reserved.
//

import UIKit

public class SectionData: NSObject {
    
    internal var mDataList:[CellModelProtocol] = []
    var mHeaderClass:AnyClass?
    var mFooterClass:AnyClass?
    
    /// Mark:
    func count() -> Int{
        return self.mDataList.count
    }
    func get(data index:Int) -> CellModelProtocol {
        return self.mDataList[index];
    }
    func add(data model:CellModelProtocol) {
        self.mDataList.append(model)
    }

}

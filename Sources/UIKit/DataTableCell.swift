//
//  DataTableCellTableViewCell.swift
//  AppKit
//
//  Created by jinfeng.peng on 2018/12/28.
//  Copyright © 2018 jinfeng.peng. All rights reserved.
//

import UIKit

public class DataTableCell: UITableViewCell ,TableCellProtocol{
    
    public var tableView: UITableView?
    
    public var indexPath: IndexPath?
    
    
    public func bind(data model: CellModelProtocol) {
        assert(false, "you must handel data in your cell")
    }
    
    public class func fetchHeight(cellModel model: CellModelProtocol) -> CGFloat {
        // 这个地方给一个提示，由于你没有实现此方法，所有cell高度为48.0的默认高度
        print("Since you did not implement this method, all cells default to a height of 48.0")
        return 48.0
    }

}

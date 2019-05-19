//
//  TableViewProtocol.swift
//  ListView
//
//  Created by jinfeng.peng on 2019/4/29.
//  Copyright © 2019 jinfeng.peng. All rights reserved.
//
import UIKit
import Foundation


public protocol TableCellProtocol {
    
    var tableView:UITableView? { get set}
    var indexPath:IndexPath? { get set}
    // 每个cell的数据源
    func bind(data model:CellModelProtocol)
    // 每个cell的高度
    static func fetchHeight(cellModel model:CellModelProtocol) -> CGFloat
}

public protocol CellModelProtocol {
    
    var cellClass:AnyClass {get set}
}

/// Mark:这里面将tableView的Datasources代理方法整理进来

@objc public protocol TableViewDelegate: UITableViewDelegate {
    
    @objc optional func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    @objc optional func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?
    @objc optional func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    @objc optional func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    @objc optional func sectionIndexTitles(for tableView: UITableView) -> [String]?
    @objc optional func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int
    @objc optional func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    @objc optional func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
}

//
//  ListData.swift
//  ListView
//
//  Created by jinfeng.peng on 2019/5/17.
//  Copyright © 2019 jinfeng.peng. All rights reserved.
//

import UIKit

public class ListData: NSObject {

    public weak var listView:UITableView?
    public weak var delegate:TableViewDelegate?
    private var mSections:[SectionData] = []

    public override init() {
        super.init()
    }
    public convenience init(bind listView:UITableView,listDeleagte:TableViewDelegate) {
        self.init()
        self.listView = listView
        self.delegate = listDeleagte
        self.listView?.delegate = self
        self.listView?.dataSource = self
    }
    
    public static func initListData(bind listView:UITableView,deleagte:TableViewDelegate) -> ListData {
        let listData = ListData.init(bind: listView, listDeleagte: deleagte)
        return listData
    }

}
/// Mark:消息转发、类似多代理模式
extension ListData {
    
    public override func responds(to aSelector: Selector!) -> Bool {
        // 内部实现的方法列表
        let selectors = [#selector(tableView(_:heightForRowAt:)),
                         #selector(tableView(_:numberOfRowsInSection:)),
                         #selector(tableView(_:cellForRowAt:)),
                         #selector(numberOfSections(in:)),
                         #selector(tableView(_:viewForFooterInSection:)),
                         #selector(tableView(_:viewForFooterInSection:))]
        // 当前方法包含在方法列表中、一定会实现
        if selectors.contains(aSelector) {
            return true
        }
        // 不在方法列表中的话、delegate是否实现了此方法，实现了返回true
        if self.delegate?.responds(to: aSelector) ?? false {
            return true
        }
        return super.responds(to: aSelector)
    }
    public override func forwardingTarget(for aSelector: Selector!) -> Any? {
        // 能走到这一步的一定是respondsSelector方法返回True的但是却没有找到对应的实现IMP，面对这种情况一定是delegate实现了这个方法，否则respondsSelector不会返回true，也不会进入到这个方法
        let delegateHasResponde = self.delegate?.responds(to: aSelector) ?? false
        // 再次确认是否响应到此方法，相应得到就消息转发给delegate
        if(delegateHasResponde) {
            return self.delegate
        }
        // 如果进入了此方法、但是delegate无法响应，就走正常的消息转发流程
        return super.forwardingTarget(for: aSelector)
    }
}

/// Mark: listData操作

extension ListData {
    
    private func registerCellClass(sectionData:SectionData) {
        //注册sectionHeader   ps:这里的headerfooterview需继承UItableviewheaderfooterview
        self.listView?.register(sectionData.mHeaderClass, forHeaderFooterViewReuseIdentifier:"header_\(String(describing: sectionData.mHeaderClass))")
        // 注册sectionFooter  ps:这里的headerfooterview需继承UItableviewheaderfooterview
        self.listView?.register(sectionData.mHeaderClass, forHeaderFooterViewReuseIdentifier:"footer_\(String(describing: sectionData.mHeaderClass))")
        // 注册cell
        for row in sectionData.mDataList {
            self.listView?.register(row.cellClass, forCellReuseIdentifier: "cell_\(String(describing: row.cellClass))")
        }
    }
    
    // ListData 的数据个数
    public func count() -> Int {
        return self.mSections.count
    }
    
    /// 获取对应区的数据
   public func get(sectionData index:Int) -> SectionData? {
        guard index >= 0 else {
            return nil
        }
        guard index < self.mSections.count else {
            return nil
        }
        return self.mSections[index]
    }
    
    /// 添加对应区的数据
   public func add(sectionData data:SectionData) {
        self.registerCellClass(sectionData: data)
        self.mSections.append(data)
    }
    
    /// 插入数据到对应的区
    public func insert(sectionData data:SectionData, at index:Int) -> Bool {
        guard index >= 0 else {
            return false
        }
        guard index <= self.mSections.count else {
            return false
        }
        self.mSections.insert(data, at: index)
        return true
    }
    
    /// 移除对应区的数据
    public func remove(sectionData data:SectionData) {
        for (i,item) in self.mSections.enumerated() {
            if item === data {
                self.mSections.remove(at: i)
                break;
            }
        }
    }
    
    /// 移除对应区的数据
    public func remove(section:Int) {
        guard section < self.mSections.count else {
            return
        }
        self.mSections.remove(at: section)
    }
    
    /// 移除所有的数据
    public func removeAll() {
        self.mSections.removeAll()
    }
}

/// MARK:UITableViewDataSource

extension ListData: UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.count()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionData = self.get(sectionData: section)
        return sectionData?.count() ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionData = self.get(sectionData: indexPath.section)
        guard sectionData != nil else {
            return UITableViewCell.init()
        }
        let model:CellModelProtocol = (sectionData?.get(data: indexPath.row))!
        let identifier = "cell_\(String(describing: model.cellClass))"
        
        var cell:TableCellProtocol = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TableCellProtocol
        cell.tableView = tableView
        cell.indexPath = indexPath
        cell.bind(data: model)
        return cell as! UITableViewCell
    }
    
    // fixed font style. use custom view (UILabel) if you want something different
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return self.delegate?.tableView?(tableView, titleForHeaderInSection: section)
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?{
        return self.delegate?.tableView?(tableView, titleForFooterInSection: section)
    }
    
    
    // Editing
    
    // Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return self.delegate?.tableView?(tableView, canEditRowAt: indexPath) ?? false
    }
    
    
    // Moving/reordering
    
    // Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.delegate?.tableView?(tableView, canMoveRowAt: indexPath) ?? false
    }
    
    // Index
    // return list of section titles to display in section index view (e.g. "ABCD...Z#")
    @available(iOS 2.0, *)
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
       return self.delegate?.sectionIndexTitles?(for: tableView)
    }
    // tell table which section corresponds to section title/index (e.g. "B",1))
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return (self.delegate?.tableView?(tableView, sectionForSectionIndexTitle: title, at: index))!
    }
    
    // Data manipulation - insert and delete support
    
    // After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
    // Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.delegate?.tableView?(tableView, commit: editingStyle, forRowAt: indexPath)
    }
    
    // Data manipulation - reorder / moving support
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.delegate?.tableView?(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath)
    }
   
}
extension ListData: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionData = self.get(sectionData: indexPath.section)
        guard sectionData != nil else {
            return 48.0
        }
        let model:CellModelProtocol = (sectionData?.get(data: indexPath.row))!
        let cellClass = model.cellClass as! DataTableCell.Type
        return cellClass.fetchHeight(cellModel: model)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionData = self.get(sectionData: section)
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "header_\(String(describing: sectionData?.mHeaderClass))")
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionData = self.get(sectionData: section)
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer_\(String(describing: sectionData?.mFooterClass))")
    }

}

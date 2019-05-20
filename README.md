# AppKit
AppKit是一个全面的框架，将会包含网络、数据库、UI、图片工具、布局工具、系统空间操作的便捷方法。后期会不断的更新。高质量的代码为app保证性能。

* ListData简单的使用:  使用数据驱动的方式去构建一个tableview、后期还会支持构建collectionView

  1. 创建数据管理ListData、数据展示列表table 
  
  ```
    lazy var table:UITableView = {
        let table = UITableView.init(frame: self.view.bounds, style: .plain)
        return table
    }()
    // 关联tableview
    lazy var listData:ListData = {
        let listData = ListData.init(bind: self.table, listDeleagte: self)
        return listData
    }()
  ```
  
  2. 创建数据源
  
  ```
    let sectionData1 = SectionData.init()
    sectionData1.mHeaderClass = TitleView.self
    sectionData1.add(data: Model.init())
    sectionData1.add(data: Model.init())
    sectionData1.add(data: Model.init())

    let sectionData2 = SectionData.init()
    sectionData2.mHeaderClass = TitleView.self
    sectionData2.add(data: Model.init())
    sectionData2.add(data: Model.init())
    sectionData2.add(data: Model.init())
    self.listData.add(sectionData: sectionData1)
    self.listData.add(sectionData: sectionData2)
   ```
   3. 实现对应的代理
   
   ```
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click")
    }
    // 此代理测试高度，内部已经实现，外部重新实现无效
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    // datasources代理的实现
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["1","2","2","2","2","2","2","2","2"]
    }
   ```
   4. cell、model要实现对应的协议
   
   ```
   class Model: NSObject,CellModelProtocol {
    var cellClass: AnyClass =  FTCell.self
    var name = "joker" 
  }
  ```
  ```
  class FTCell: DataTableCell {
    override func bind(data model: CellModelProtocol) {
        self.textLabel?.text = "joker"
    }
    override class func fetchHeight(cellModel model: CellModelProtocol) -> CGFloat {
        return 50;
      }
   }
   ```

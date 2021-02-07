//
//  ContentView.swift
//  SwiftPro
//
//  Created by Wang Jie on 2021/02/07.
//

import Foundation
import UIKit
import SnapKit

class ContentViewCell: UITableViewCell {
    
    var item: ContentModel?
    
    required  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let view = UIView(frame: CGRect(x:0, y:0, width: 240, height: 150))
        view.backgroundColor = UIColor.init(code: "#4A6572")
        self.contentView.addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol ContentViewDelegate:AnyObject {
    func didSelectItem<Item>(_ item: Item)
}


class ContentView: UIView,UITableViewDataSource,UITableViewDelegate {
   
    var tableView: UITableView
    var items: [ContentModel]! = []{
        didSet {
            self.tableView.reloadData()
            
        }
    }
    
    weak var delegate: ContentViewDelegate?
    
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero, style: .plain)
//        items = []
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.tableFooterView = UIView()
        tableView.register(ContentViewCell.self, forCellReuseIdentifier: "contentCellId")
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "contentCellId") as? ContentViewCell else {
        return ContentViewCell()
      }
    
      cell.item = items[indexPath.row]
      return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem(items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

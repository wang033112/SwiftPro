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
    
    var icon: UIImageView
    var title: UILabel
    var labelA: PaddingLabel
    var labelB: PaddingLabel
    var total: PaddingLabel
    
    var item: ContentModel? {
        didSet {
            print("Item didset ")
            icon.image = UIImage(named: item?.imageUrl ?? "James")
            title.text = item?.name
            labelA.text = "TYPEA"
            labelB.text = "TYPEB"
            total.text = "220k Views"
        }
    }
    
    
    required  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        icon = UIImageView()
        title = UILabel()
        labelA = PaddingLabel()
        labelB = PaddingLabel()
        total = PaddingLabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let view = UIView(frame: CGRect(x:0, y:0, width: 240, height: 150))
        view.backgroundColor = UIColor.init(code: "#4A6572")
        
        self.contentView.addSubview(icon)
        icon.layer.cornerRadius = 5
        icon.layer.masksToBounds = true
        icon.snp.makeConstraints({ (make) in
            make.width.height.equalTo(80)
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        })
        
        self.contentView.addSubview(title)
        title.font = UIFont.systemFont(ofSize: 15)
        title.textColor = UIColor.black
        title.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(icon.snp.right).offset(15)
            make.height.equalTo(20)
        })
        
        self.contentView.addSubview(labelA)
        labelA.font = UIFont.systemFont(ofSize: 10)
        labelA.textColor = UIColor.init(code: "#E64A19")
        labelA.backgroundColor = UIColor.init(code: "#FFAB91")
        labelA.layer.cornerRadius = 10
        labelA.layer.masksToBounds = true
        labelA.snp.makeConstraints({ (make) in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.left.equalTo(icon.snp.right).offset(15)
            make.height.equalTo(20)
        })
        
        self.contentView.addSubview(labelB)
        labelB.font = UIFont.systemFont(ofSize: 10)
        labelB.textColor = UIColor.init(code: "#00838F")
        labelB.backgroundColor = UIColor.init(code: "#80DEEA")
        labelB.layer.cornerRadius = 10
        labelB.layer.masksToBounds = true
        labelB.snp.makeConstraints({ (make) in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.left.equalTo(labelA.snp.right).offset(15)
            make.height.equalTo(20)
        })
        
        self.contentView.addSubview(total)
        total.font = UIFont.systemFont(ofSize: 12)
        total.textColor = UIColor.lightGray
        total.snp.makeConstraints({ (make) in
            make.top.equalTo(labelA.snp.bottom).offset(10)
            make.left.equalTo(icon.snp.right).offset(15)
            make.height.equalTo(20)
        })
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
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem(items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

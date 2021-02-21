//
//  TabChildViewController.swift
//  SwiftPro
//
//  Created by Wang Jie on 2021/02/21.
//

import UIKit
import SnapKit

class HomeChildViewController: UIViewController, TabScrollViewSyncable {
    var scrollableContainer: TabSubScrollViewSyncable? {
        return tableView
    }
    
    var tableView: ScrollContentView!
    var items: [ContentModel]! = []{
        didSet {
            self.tableView.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = ScrollContentView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(HomeContentViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        items = DammyData.createProducts()
    }
}

extension HomeChildViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") as? HomeContentViewCell else {
          return HomeContentViewCell()
        }

        cell.contentView.backgroundColor = UIColor.white
        cell.item = items[indexPath.row]
        return cell
    }
}

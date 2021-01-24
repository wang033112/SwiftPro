//
//  ViewController.swift
//  SwiftPro
//
//  Created by Wang Jie on 2021/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        setupNav()
    }
    
    private func setupNav() {
        self.title = "ホーム"
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = .darkGray
        let nextItem = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(nextPage));
        self.navigationItem.rightBarButtonItem = nextItem
    }
    
    @objc func nextPage() {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }

}


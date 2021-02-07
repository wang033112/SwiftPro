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
        view.backgroundColor = .white
        setupNav()
        self.navigationController?.delegate = self
    }
    
    private func setupNav() {
        let imagesURL = ["AllStar", "Kobe", "Champion"]
        //let imagesURL = ["home", "mine"]
        let homeScroll = ScrollImageView(CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 230), images: imagesURL)
        self.view.addSubview(homeScroll)
//        self.title = "ホーム"
//        self.navigationController?.navigationBar.barTintColor = .white
//        self.navigationController?.navigationBar.tintColor = .darkGray
//        let nextItem = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(nextPage));
//        self.navigationItem.rightBarButtonItem = nextItem
    }
    
    @objc func nextPage() {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }

}

extension HomeViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}


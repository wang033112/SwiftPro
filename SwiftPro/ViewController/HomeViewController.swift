//
//  ViewController.swift
//  SwiftPro
//
//  Created by Wang Jie on 2021/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    var tabScrollView: HomeScrollView!
    var childVCDic: [Int: HomeChildViewController] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupNav()
        self.navigationController?.delegate = self
    }
    
    private func setupNav() {
        tabScrollView = {
            let tabScrollView = HomeScrollView(frame: view.bounds)
            tabScrollView.vcDelegate = self
            view.addSubview(tabScrollView)
            return tabScrollView
        }()
        
        let imagesURL = ["AllStar", "Kobe", "Champion"]
        let homeScrollHeader = ScrollImageView(CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 180), images: imagesURL)
        tabScrollView.headerView = homeScrollHeader
        tabScrollView.tabBarView = tabBarView()
        
        tabScrollView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(30)
            maker.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    private func tabBarView()-> HomeTabBarView {
        let tabBarView = HomeTabBarView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 50), titles: ["ホーム","ニュース","動画","画像","日程"])
        return tabBarView
        
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


extension HomeViewController: TabScrollViewViewControllerDelegate {
    
    func childViewController(atIndex index: Int) -> UIViewController & TabScrollViewSyncable {
        if let vc = childVCDic[index] {
            return vc
        } else {
            let vc: HomeChildViewController = HomeChildViewController()
            childVCDic[index] = vc
            return vc
        }
    }
    
    func parentViewController() -> UIViewController {
        return self
    }
}


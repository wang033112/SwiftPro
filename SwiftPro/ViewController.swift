//
//  ViewController.swift
//  SwiftPro
//
//  Created by Wang Jie on 2021/01/23.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
        
        let home = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: home)
        
        homeNavi.tabBarItem.image = UIImage(named: "home")
        homeNavi.tabBarItem.selectedImage = UIImage(named: "home_selected")
        homeNavi.title = "Home"
        addChild(homeNavi)
        
        //homeNavi.navigationBar.isHidden = true;
    
        let add = AddViewController()
        add.tabBarItem.image = UIImage(systemName: "heart")
        add.title = "Add"
        addChild(add)
        
        let schedule = ScheduleViewController()
        schedule.tabBarItem.image = UIImage(named: "mine")
        schedule.tabBarItem.selectedImage = UIImage(named: "mine_selected")
        schedule.title = "Schedule"
        addChild(schedule)
        
        let tabBar = TabBarView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        self.setValue(tabBar, forKey: "tabBar")
    }
}


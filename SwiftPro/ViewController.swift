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
        home.tabBarItem.image = UIImage(named: "home")
        home.tabBarItem.selectedImage = UIImage(named: "home_selected")
        home.title = "Home"
        addChild(home)
    
        
        let schedule = ScheduleViewController()
        schedule.tabBarItem.image = UIImage(named: "mine")
        schedule.tabBarItem.selectedImage = UIImage(named: "mine_selected")
        schedule.title = "Schedule"
        addChild(schedule)
        
        let tabBar = TabBarView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        self.setValue(tabBar, forKey: "tabBar")
        //self.setRootTabbarConntroller()
        //self.tabBarItem = TabBarView()
    }
}


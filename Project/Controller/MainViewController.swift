//
//  MainViewController.swift
//  Project
//
//  Created by Ebpearls on 19/06/2022.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: PartnersViewController())
        let vc3 = UINavigationController(rootViewController: FundraiserViewController())
        let vc4 = UINavigationController(rootViewController: NotificationsViewController())
        let vc5 = UINavigationController(rootViewController: ProfileUIViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "person.3")
        vc3.tabBarItem.image = UIImage(systemName: "chart.bar.doc.horizontal")
        vc4.tabBarItem.image = UIImage(systemName: "bell")
        vc5.tabBarItem.image = UIImage(systemName: "person")
        
        vc1.title = "Home"
        vc2.title = "Partners"
        vc3.title = "Fundraisers"
        vc4.title = "Notifications"
        vc5.title = "Profile"
        
        tabBar.tintColor = .label
        tabBar.isTranslucent = false
        
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }


}

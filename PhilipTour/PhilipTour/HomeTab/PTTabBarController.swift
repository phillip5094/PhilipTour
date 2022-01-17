//
//  PTTabBarController.swift
//  PhilipTour
//
//  Created by NHN on 2021/01/30.
//

import UIKit

class PTTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.unselectedItemTintColor = UIColor(red: 82 / 255.0, green: 182 / 255.0, blue: 105 / 255.0, alpha: 1.0)
        
        if let tbItems = self.tabBar.items {
            tbItems[0].image = UIImage(named: "Home.png")
            tbItems[0].title = "Home"
            
            tbItems[1].image = UIImage(named: "Schedule.png")
            tbItems[1].title = "Schedule"
            
            tbItems[2].image = UIImage(named: "Map.png")
            tbItems[2].title = "Map"
            
            tbItems[3].image = UIImage(named: "Message.png")
            tbItems[3].title = "Message"
            
            tbItems[4].image = UIImage(named: "Setting.png")
            tbItems[4].title = "Setting"
        }
    }
}

//
//  HomeNavigationController.swift
//  PhilipTour
//
//  Created by NHN on 2021/01/31.
//

import UIKit
import Foundation

class HomeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.layer.masksToBounds = true
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.layer.borderColor = .none
    
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "NanumGothicCoding", size: 20)!]
    }
}

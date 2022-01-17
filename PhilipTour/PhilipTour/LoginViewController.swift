//
//  LoginViewController.swift
//  PhilipTour
//
//  Created by NHN on 2021/01/08.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션바 bottom line 지우기
        self.navigationBar.setValue(true, forKey: "hidesShadow")

    }

}

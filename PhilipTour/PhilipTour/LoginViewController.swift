//
//  LoginViewController.swift
//  PhilipTour
//
//  Created by NHN on 2021/01/08.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var okButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        self.navigationItem.title = "로그인"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "NanumGothicCoding-Bold", size: 26)!]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        let backIcon = UIImage(named: "back_icon.png")
        let leftItem = UIBarButtonItem(image: backIcon, style: .plain, target: self, action: #selector(back(_:)))
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationController?.navigationBar.isHidden = false
        
        okButton.layer.cornerRadius = 13
        
    }
    
    @objc func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

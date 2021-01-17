//
//  MainViewController.swift
//  PhilipTour
//
//  Created by NHN on 2021/01/08.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    let buttonCornerRadius: CGFloat = 16
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func onClickLogin(_ sender: Any) {
        print("[PhilipTour] onClickLogin Event occured")
        
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
        loginVC?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(loginVC!, animated: true)
    }
    
    @IBAction func onClickRegister(_ sender: Any) {
        print("[PhilipTour] onClickRegister Event occured")
        
        let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterView")
        registerVC?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(registerVC!, animated: true)
    }
    
    func setupView() {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.loginButton.layer.cornerRadius = self.buttonCornerRadius
        self.registerButton.layer.cornerRadius = self.buttonCornerRadius
    }
}

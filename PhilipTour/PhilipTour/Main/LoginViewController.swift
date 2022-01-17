//
//  LoginViewController.swift
//  PhilipTour
//
//  Created by NHN on 2021/01/08.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    //MARK: properties
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var okButton: UIButton!
    
    
    @IBOutlet weak var userIDUnderLine: UIView!
    @IBOutlet weak var passwordUnderLine: UIView!
    
    @IBOutlet weak var invalidUserID: UILabel!
    @IBOutlet weak var invalidPassword: UILabel!
    
    //MARK: - Setup View
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
        
        self.userID.autocorrectionType = .no
        self.userID.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        self.password.autocorrectionType = .no
        self.password.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        self.invalidUserID.isHidden = true
        self.invalidPassword.isHidden = true
        
        setupValidView()
    }
    
    func setupValidView() {
        self.userID.textColor = .white
        self.password.textColor = .white
        self.userIDUnderLine.backgroundColor = .white
        self.passwordUnderLine.backgroundColor = .white
        self.invalidUserID.isHidden = true
        self.invalidPassword.isHidden = true
        self.userID.attributedPlaceholder = NSAttributedString(string: "UserID", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        self.password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    func setupInvalidView() {
        self.userID.textColor = .red
        self.password.textColor = .red
        self.userIDUnderLine.backgroundColor = .red
        self.passwordUnderLine.backgroundColor = .red
        self.invalidUserID.isHidden = false
        self.invalidPassword.isHidden = false
        self.userID.attributedPlaceholder = NSAttributedString(string: "UserID", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        self.password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
    }
    
    //MARK: Button Action
    @objc func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func findPassword(_ sender: Any) {
        let findPasswordVC = self.storyboard?.instantiateViewController(withIdentifier: "FindPassword")
        findPasswordVC?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(findPasswordVC!, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func ok(_ sender: Any) {
        let userID = self.userID.text
        let password = self.password.text
        
        if userID?.isEmpty == true || password?.isEmpty == true {
            setupInvalidView()
        } else {
            let serverURL = Bundle.main.infoDictionary!["ServerURL"] as! String
            let requestURL = "\(serverURL)/user/login?userid=\(userID!)&userpw=\(password!)"
            debugPrint("[PhilipTour][Login] requestURL => \(requestURL)");
            
            AF.request(requestURL).responseJSON { (response) in
                switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        debugPrint("[PhilipTour][Login] response value => \(json)");
                        let resultCode = json["resultCode"].intValue
                        let resultMessage = json["resultMessage"].stringValue
                        
                        if resultCode == PT_SUCCESS {
//                            PTUtility.showAlertMessage(viewController: self, title: "Login Success", message: resultMessage)
                            
                            guard let keyWindow = UIApplication.shared.windows.first else { return }
                            
                            let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "PTTabBarController")
                            
                            UIView.transition(with: keyWindow, duration: 0.5, options: .transitionCrossDissolve, animations: {
                                let oldState = UIView.areAnimationsEnabled
                                UIView.setAnimationsEnabled(false)
                                keyWindow.rootViewController = tabBarController
                                UIView.setAnimationsEnabled(oldState)
                            }, completion: nil)
                            
                            PTUserDefaultManager().isLoggedIn = true
                            
                        } else {
                            PTUtility.showAlertMessage(viewController: self, title: "Login Fail", message: resultMessage)
                        }
                        
                    default:
                        break;
                }
            }
        }
    }
    
    //MARK: TextField Event
    @objc func textFieldDidChange(textField: UITextField) {
        setupValidView()
    }

}

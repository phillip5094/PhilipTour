//
//  RegisterViewController.swift
//  PhilipTour
//
//  Created by NHN on 2021/01/09.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var userIDUnderLine: UIView!
    @IBOutlet weak var invalidUserID: UILabel!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordUnderLine: UIView!
    @IBOutlet weak var invalidPassword: UILabel!
    
    
    @IBOutlet weak var passwordConfir: UITextField!
    @IBOutlet weak var passwordConfirUnderLine: UIView!
    @IBOutlet weak var invalidPasswordConfir: UILabel!
    
    @IBOutlet weak var okButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        self.okButton.layer.cornerRadius = 13
        
        self.navigationItem.title = "회원가입"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "NanumGothicCoding-Bold", size: 26)!]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        let backIcon = UIImage(named: "back_icon.png")
        let leftItem = UIBarButtonItem(image: backIcon, style: .plain, target: self, action: #selector(back(_:)))
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationController?.navigationBar.isHidden = false
        
        self.userID.autocorrectionType = .no
        self.userID.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        self.password.autocorrectionType = .no
        self.password.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        self.passwordConfir.autocorrectionType = .no
        self.passwordConfir.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        self.invalidUserID.isHidden = true
        self.invalidPassword.isHidden = true
        self.invalidPasswordConfir.isHidden = true
        
        setupValidView()
        
    }
    
    func setupValidView() {
        self.userID.textColor = .white
        self.password.textColor = .white
        self.passwordConfir.textColor = .white
        
        self.userIDUnderLine.backgroundColor = .white
        self.passwordUnderLine.backgroundColor = .white
        self.passwordConfirUnderLine.backgroundColor = .white
        
        self.invalidUserID.isHidden = true
        self.invalidPassword.isHidden = true
        self.invalidPasswordConfir.isHidden = true
        self.userID.attributedPlaceholder = NSAttributedString(string: "UserID", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        self.password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        self.passwordConfir.attributedPlaceholder = NSAttributedString(string: "PasswordConfir", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    func setupInvalidView() {
        setupInvalidUserID()
        setupInvalidPassword()
        setupInvalidPasswordConfir()
    }
    
    @objc func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupInvalidUserID() {
        self.userID.textColor = .red
        self.userIDUnderLine.backgroundColor = .red
        self.invalidUserID.isHidden = false
        self.userID.attributedPlaceholder = NSAttributedString(string: "UserID", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
    }
    
    func setupInvalidPassword() {
        self.password.textColor = .red
        self.passwordUnderLine.backgroundColor = .red
        self.invalidPassword.isHidden = false
        self.password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
    }
    
    func setupInvalidPasswordConfir() {
        self.passwordConfir.textColor = .red
        self.passwordConfirUnderLine.backgroundColor = .red
        self.invalidPasswordConfir.isHidden = false
        self.passwordConfir.attributedPlaceholder = NSAttributedString(string: "PasswordConfir", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
    }
    
    @IBAction func ok(_ sender: Any) {
        let userID = self.userID.text
        let password = self.password.text
        let passwordConfir = self.passwordConfir.text
        
        if userID?.isEmpty == true || password?.isEmpty == true || passwordConfir?.isEmpty == true{
            setupInvalidView()
        } else if password != passwordConfir {
            setupInvalidPasswordConfir()
        } else {
            // TODO: 모듈로 뽑아서 사용하자
            let serverURL = Bundle.main.infoDictionary!["ServerURL"] as! String
            let requestURL = "\(serverURL)/user/join?userid=\(userID!)&userpw=\(password!)"
            debugPrint("[PhilipTour][Register] requestURL => \(requestURL)");
            
            AF.request(requestURL).responseJSON { (response) in
                switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        debugPrint("[PhilipTour][Register] response value => \(json)");
                        let resultCode = json["resultCode"].intValue
                        let resultMessage = json["resultMessage"].stringValue
                        
                        if resultCode == PT_SUCCESS {
                            PTUtility.showAlertMessage(viewController: self, title: "Register Success", message: resultMessage)
                        } else {
                            PTUtility.showAlertMessage(viewController: self, title: "Register Fail", message: resultMessage)
                        }
                        
                    default:
                        break;
                }
            }
        }
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        setupValidView()
    }
}

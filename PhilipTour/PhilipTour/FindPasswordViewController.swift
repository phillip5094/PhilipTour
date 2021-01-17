//
//  FindPasswordViewController.swift
//  PhilipTour
//
//  Created by NHN on 2021/01/13.
//

import UIKit
import Alamofire
import SwiftyJSON

class FindPasswordViewController: UIViewController {
    //MARK: properties
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var userIDUnderLine: UIView!
    @IBOutlet weak var invalidUserID: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    //MARK: - Setup View
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    
    func setupView() {
        self.navigationItem.title = "비밀번호 찾기"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "NanumGothicCoding-Bold", size: 26)!]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        let backIcon = UIImage(named: "back_icon.png")
        let leftItem = UIBarButtonItem(image: backIcon, style: .plain, target: self, action: #selector(back(_:)))
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationController?.navigationBar.isHidden = false
        
        okButton.layer.cornerRadius = 13
        
        self.userID.autocorrectionType = .no
        self.userID.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        self.invalidUserID.isHidden = true
        
        setupValidView()
    }
    
    func setupValidView() {
        self.userID.textColor = .white
        self.userIDUnderLine.backgroundColor = .white
        self.invalidUserID.isHidden = true
        self.userID.attributedPlaceholder = NSAttributedString(string: "UserID", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    func setupInvalidView() {
        self.userID.textColor = .red
        self.userIDUnderLine.backgroundColor = .red
        self.invalidUserID.isHidden = false
        self.userID.attributedPlaceholder = NSAttributedString(string: "UserID", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
    }

    //MARK: Button Action
    @objc func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ok(_ sender: Any) {
        let userID = self.userID.text
        
        if userID?.isEmpty == true {
            setupInvalidView()
        } else {
            let serverURL = Bundle.main.infoDictionary!["ServerURL"] as! String
            let requestURL = "\(serverURL)/user/searchpw?userid=\(userID!)"
            debugPrint("[PhilipTour][Register] requestURL => \(requestURL)");
            
            AF.request(requestURL).responseJSON { (response) in
                switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        debugPrint("[PhilipTour][FindPassword] response value => \(json)");
                        let resultCode = json["resultCode"].intValue
                        let resultMessage = json["resultMessage"].stringValue
                        let resultData = json["resultData"].dictionaryValue
                        if resultCode == PT_SUCCESS {
                            let password = resultData["userpw"]!.stringValue
                            PTUtility.showAlertMessage(viewController: self, title: "FindPassword Success", message: password)
                        } else {
                            PTUtility.showAlertMessage(viewController: self, title: "FindPassword Fail", message: resultMessage)
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

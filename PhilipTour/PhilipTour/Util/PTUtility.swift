//
//  PTUtility.swift
//  PhilipTour
//
//  Created by NHN on 2021/01/16.
//

import Foundation
import UIKit

class PTUtility {
    static func showAlertMessage(viewController: UIViewController, title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertVC.addAction(okAction)
        
        viewController.present(alertVC, animated: true, completion: nil)
    }
}



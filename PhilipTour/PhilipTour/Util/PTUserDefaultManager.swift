//
//  PTUserDefaultManager.swift
//  PhilipTour
//
//  Created by NHN on 2021/01/26.
//

import UIKit
import Foundation

struct UserDefaultsKey {
    static let isLoggedIn = "isLoggedIn"
}

class PTUserDefaultManager {
    var isLoggedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaultsKey.isLoggedIn)
        }
        
        set(v) {
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserDefaultsKey.isLoggedIn)
            ud.synchronize()
        }
    }
}

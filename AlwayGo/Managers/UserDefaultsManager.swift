//
//  UserDefaultsManager.swift
//  AlwayGo
//
//  Created by Mac on 22.04.25.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    enum UserDefaultsTypes: String {
        case isLoggedIn = "isLoggedIn"
    }
    
    func setValue(_ value: Any, and key: UserDefaultsTypes) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    func getValue(for key: UserDefaultsTypes) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    func handle() {
        
    }
}

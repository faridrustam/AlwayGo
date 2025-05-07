//
//  UserDefaultsManager.swift
//  AlwayGo
//
//  Created by Mac on 22.04.25.
//

import Foundation

final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private init() {}
    
    enum UserDefaultsTypes: String {
        case isLoggedIn = "isLoggedIn"
        case email = "email"
        case username = "username"
    }
    
    func setValue(_ value: Any, and key: UserDefaultsTypes) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    func getValue(for key: UserDefaultsTypes) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    func getString(for key: UserDefaultsTypes) -> String {
        UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
}

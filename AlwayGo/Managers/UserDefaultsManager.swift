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
        case isHeartButtonTapped = "isHeartButtonTapped"
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
    
    func setButtonState(_ value: Bool, and key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func getButtonState(for key: String) -> Bool {
        UserDefaults.standard.bool(forKey: key)
    }
}

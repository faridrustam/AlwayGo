//
//  KeychainManager.swift
//  AlwayGo
//
//  Created by Mac on 03.05.25.
//

import Foundation

final class KeychainManager {
    static let shared = KeychainManager()
    private init() {}
    
    func savePassword(service: String, account: String, password: String) -> Bool {
        guard let passwordData = password.data(using: .utf8) else {
            return false
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: passwordData
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        return status == errSecSuccess
    }
    
    func getPassword(service: String, account: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: kCFBooleanTrue ?? false,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var passwordData: AnyObject?
        
        let status = SecItemCopyMatching(query as CFDictionary, &passwordData)
        
        
        if status != errSecSuccess,
           let data = passwordData as? Data,
           let password = String(data: data, encoding: .utf8) {
            return password
        } else {
            return nil
        }
    }
    
    func deletePassword() {
        
    }
}

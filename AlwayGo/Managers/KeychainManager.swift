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
        
        if status == errSecSuccess,
           let data = passwordData as? Data,
           let password = String(data: data, encoding: .utf8) {
            return password
        } else {
            return nil
        }
    }
    
    func saveEmail(email: String) {
        let emailData = email.data(using: .utf8)
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "userEmail",
            kSecValueData as String: emailData! as Data
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        if status == errSecSuccess {
            print("Email saved successfully")
        } else {
            print("Error saving email")
        }
    }
    
    func getEmail() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "userEmail",
            kSecReturnData as String: kCFBooleanTrue ?? false,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var emailData: AnyObject?
        
        let status = SecItemCopyMatching(query as CFDictionary, &emailData)
        
        if status == errSecSuccess,
           let data = emailData as? Data,
           let email = String(data: data, encoding: .utf8) {
            return email
        }
        return nil
    }
    
    func deletePassword() {
        
    }
    
    func saveToken(token: String, account: String) {
        guard let data = token.data(using: .utf8) else { return }
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: "com.alwayGo.token",
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status != errSecSuccess {
                print("Failed to save token: \(status)")
            } else {
                print("Token saved successfully.")
            }
    }
    
    func readToken(account: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: "com.alwayGo.token",
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == errSecSuccess {
            if let data = item as? Data,
               let token = String(data: data, encoding: .utf8) {
                return token
            }
        } else {
            print("Failed to read token: \(status)")
        }
        return nil
    }
    
    func getSavedEmailAccount() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecReturnAttributes as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess,
           let item = result as? [String: Any],
           let account = item[kSecAttrAccount as String] as? String {
            return account
        }
        
        print("Could not retrieve account: \(status)")
        return nil
    }
    
    func deleteToken(account: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: "com.alwayGo.token"
        ]

        let status = SecItemDelete(query as CFDictionary)
        print(status == errSecSuccess ? "Token deleted for account: \(account)" : "Failed to delete token: \(status)")
    }
}

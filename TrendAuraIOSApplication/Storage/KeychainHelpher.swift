//  KeychainHelpher.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 01/09/26.

import Security
import Foundation

final class KeychainHelpher {
    
    private let userIdKey = "userId"
    
      static let shared = KeychainHelpher()
      private let key = "authToken"
      private init() { }
    
    func saveToken(_ token: String) {
            let data = Data(token.utf8)
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key
            ]
            SecItemDelete(query as CFDictionary)
            var newItem = query
            newItem[kSecValueData as String] = data
            SecItemAdd(newItem as CFDictionary, nil)
        }
    
    func getToken() -> String? {
        let query : [String : Any] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecReturnData as String : true,
            kSecMatchLimit as String : kSecMatchLimitOne
        ]
        
        var result : AnyObject?
        
        SecItemCopyMatching(query as CFDictionary, &result)
        guard let data = result as? Data else  {return nil}
        return String(data: data, encoding: .utf8)
    }
    
    
    func deleteToken() {
        let query : [String : Any] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : key
        ]
    SecItemDelete(query as CFDictionary)
}
    
    func saveUserId(_ userId: Int) {
            let data = Data(String(userId).utf8)
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: userIdKey
            ]
            SecItemDelete(query as CFDictionary)
            var newItem = query
            newItem[kSecValueData as String] = data
            SecItemAdd(newItem as CFDictionary, nil)
        }

        func getUserId() -> Int? {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: userIdKey,
                kSecReturnData as String: true,
                kSecMatchLimit as String: kSecMatchLimitOne
            ]
            var result: AnyObject?
            SecItemCopyMatching(query as CFDictionary, &result)
            guard let data = result as? Data,
                  let str = String(data: data, encoding: .utf8) else { return nil }
            return Int(str)
        }
    
    func deleteUserId() {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: userIdKey
            ]
            SecItemDelete(query as CFDictionary)
        }
    
}


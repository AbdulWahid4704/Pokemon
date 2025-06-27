//
//  KeychainManager.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 27/06/2025.
//

import Foundation
class KeychainManager {
    enum KeychainError: Error {
        case duplicateEntry
        case unknown(OSStatus)
    }
    
    static func save(service: String, account: String, password: Data) throws {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: password
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw KeychainError.unknown(status)
        }
        
        print("Succesfully saved password")
        
    }
    
    static func get(service: String, account: String) -> Data? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess else {
            print(KeychainError.unknown(status))
            return nil
        }
        
        return result as? Data
        
    }
    
    //DEBUG ---- checking to see if password returned
    static func getPassword() {
        if let data = get(service: "Pokemon", account: UserDefaults.standard.string(forKey: Constants.CURRENT_USER_EMAIL_KEY)!) {
            let password = String(data: data, encoding: .utf8)
            print("Password recieved: \(password)")
        }
    }
    
}

//
//  User.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 07/09/2024.
//

import Foundation
import SwiftData

@Model
class User: Identifiable {
    
    var id: String = UUID().uuidString
    
    var name: String
    var email: String
    var password: String
    var phone: String
    
    
    init(name: String, email: String, password: String, phone: String) {
        self.name = name
        self.email = email
        self.password = password
        self.phone = phone
    }
    
}

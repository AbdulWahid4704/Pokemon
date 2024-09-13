//
//  SIgnUpViewModel.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 07/09/2024.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var phone = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirm = ""
    
    @Published var errorMessage: String?
    
    func signUp(existingUsers: [User]) -> User? {
        
        // Ensur an account doesnt already exist
        if existingUsers.contains(where: {$0.email == email}) {
            errorMessage = "User already exists"
            return nil
        }
        
        // Ensure the passwords match
        if password != confirm {
            errorMessage = "Passwords dont match"
            return nil
        }
        
        // Create the user, n let the app know it has signed in
        let user = User(name: name, email: email, password: password, phone: phone)
        
        UserDefaults.standard.setValue(true, forKey: Constants.IS_LOGGED_IN)
        
        // Return the user so it can be updated in the context
        return user
        
    }
    
}

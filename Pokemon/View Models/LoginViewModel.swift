//
//  LoginViewModel.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 07/09/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var loginViewError: String?
    
    @Published var loginViewState: LoginViewState = .login
    
    
    enum LoginViewState {
        case login, signUp, forgotPassword, otp, newPassword
    }
    
    
    func logIn(existingUsers: [User], email: String, password: String) {
        
        guard existingUsers.contains(where: {$0.email == email}) else {
            loginViewError = "No such user found"
            return
        }
        
        for user in existingUsers {
            if email == user.email {
                if password == user.password {
                    UserDefaults.standard.setValue(email, forKey: Constants.CURRENT_USER_EMAIL)
                } else {
                    loginViewError = "Entered password is incorrect"
                }
            }
            
        }
        
        
        
        
    }
    
    
}

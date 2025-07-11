//
//  LoginViewModel.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 07/09/2024.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    
    // MARK: change the login to use a local isLoggedInVaribale(if needed)
    
    @Published var loginViewError: String?
    
    @Published var loginViewState: LoginViewState = .login
    
    @Published var rememberMe: Bool = false
    
    @Published var email = ""
    @Published var password = ""
    
    enum LoginViewState {
        case login, signUp, forgotPassword, otp, newPassword
    }
    
    
    func logIn(existingUsers: [User]) {
        
        guard existingUsers.contains(where: {$0.email == email}) else {
            loginViewError = "No such user found"
            return
        }
        
        for user in existingUsers {
            if email == user.email {
                if password == user.password {
                    
                    // LOG IN APPROVED
                    
                    // Update the keychain
                    do {
                        try KeychainManager.save(service: "Pokemon", account: email, password: password.data(using: .utf8) ?? Data())
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    // Set current user, set this user as the last user, and set the flag
                    UserDefaults.standard.setValue(email, forKey: Constants.CURRENT_USER_EMAIL_KEY)
                    UserDefaults.standard.set(rememberMe, forKey: Constants.REMEMBER_ME_FLAG)
                    UserDefaults.standard.set(email, forKey: Constants.LAST_USER_KEY)
                    // Clear the input fields
                    self.email = ""
                    self.password = ""
                    
                } else {
                    loginViewError = "Entered password is incorrect"
                }
            }
            
        }
        
    }
    
    // check if password exists in keychain
    func checkAutoLogin() {
        
        guard
            UserDefaults.standard.bool(forKey: Constants.REMEMBER_ME_FLAG) == true,
            let email = UserDefaults.standard.string(forKey: Constants.LAST_USER_KEY),
            let passwordData = KeychainManager.get(service: "Pokemon", account: email),
            let password = String(data: passwordData, encoding: .utf8) else { return }
        
        self.email = email
        self.password = password
        self.rememberMe = UserDefaults.standard.bool(forKey: Constants.REMEMBER_ME_FLAG)
        
        
    }
    
}

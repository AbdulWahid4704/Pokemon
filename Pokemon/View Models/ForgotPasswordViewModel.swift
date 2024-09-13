//
//  ForgotPasswordViewModel.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 07/09/2024.
//

import Foundation

// View model for forgot password, otp, and new password
class ForgotPasswordViewModel: ObservableObject {
    
    enum ForgotViewState {
        case forgot, otp, newPassword
    }
    
    @Published var forgotViewState = ForgotViewState.forgot
    
    // The email for the textfield, the error trigger
    @Published var email = ""
    @Published var forgotPasswordError = false
    
    // The textfield for the otp, otp error trigger
    @Published var otp = ""
    @Published var otpError = false
    
    // The textfields for new password, error trigger
    @Published var newPassword = ""
    @Published var confirm = ""
    @Published var newPasswordError = false
    
    
    
    var user:User?
    
    
    // MARK: Forgot View Method
    func verifyNumber(existingUsers: [User]) {
        
        // Check if the number exists, n grab the associated user
        
        for user in existingUsers {
            if user.email == email{
                
                // Set error to false
                forgotPasswordError = false
                
                // set the user
                self.user = user
                //change the view
                forgotViewState = .otp
                // return out of the function
                return
            }
        }
        
        // if after the loop, n user not set, trigger error
        if user == nil {
            forgotPasswordError = true
        }
        
        
    }
    
    // MARK: OTP Method
    func verifyOtp() {
        
        // check the otp with the default value, if it matches, switch to next screen, else trigger error
        if otp == Constants.DEFAULT_OTP {
            otpError = false
            forgotViewState = .newPassword
        } else {
            otpError = true
        }
        
        
    }
    
    // MARK: New Password Method
    func verifyPasswordAndUpdateUser() throws {
        
        // Check if both textfields match, else trigger error
        guard newPassword == confirm else {
            newPasswordError = true
            throw NewPasswordError.passwordDoesntMatch("Password doesnt match")
        }
        
        // Update the user value
        user?.password = newPassword
        
        
        
    }
    
}

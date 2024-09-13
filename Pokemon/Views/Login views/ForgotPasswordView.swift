//
//  ForgotPasswordView.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 31/08/2024.
//

import SwiftUI
import SwiftData

struct ForgotPasswordView: View {
    
    @Query var existingUsers: [User]
    
    @EnvironmentObject var loginModel: LoginViewModel
    @EnvironmentObject var model: ForgotPasswordViewModel
    
    
    var body: some View {
        switch model.forgotViewState {
        case .forgot:
            VStack {
                
                Image("PokemonLogo")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 40)
                    .padding(.horizontal)
                
                Spacer()
                
                if model.forgotPasswordError {
                    HStack {
                        Text("Email input is wrong")
                            .font(.caption)
                            .foregroundColor(.red)
                        Spacer()
                    }.padding(.leading, 20)
                    
                }
                
                CustomTextField(value: $model.email, title: "Email", prompt: "Enter your email")
                    .padding(.bottom, 40)
                
                Button {
                    // code for generating otp
                    model.verifyNumber(existingUsers: existingUsers)
                    
                } label: {
                    CustomButton(title: "Generate OTP")
                }
                
                Spacer()
                
                Spacer()
                
                HStack {
                    Text("Already have an account")
                    Button {
                        loginModel.loginViewState = .login
                    } label: {
                        Text("Log In!")
                            .foregroundColor(.pokemonSecondary)
                            .fontWeight(.medium)
                    }

                }
                .italic()
                .font(.caption)
                
                HStack {
                    Text("Dont have an account?")
                    Button {
                        loginModel.loginViewState = .signUp
                    } label: {
                        Text("Sign in")
                            .foregroundColor(.pokemonSecondary)
                            .fontWeight(.medium)
                    }

                }
                .italic()
                .font(.caption)
                
            }
        case .otp:
            // otp view
            OTPView()
        case .newPassword:
            // new password view
            NewPasswordView()
        }
        
    }
    
    
        
        
    
}

//#Preview {
//    ForgotPasswordView()
//}

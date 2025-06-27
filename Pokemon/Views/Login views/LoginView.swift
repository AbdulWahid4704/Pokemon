//
//  ContentView.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 28/08/2024.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    
    @EnvironmentObject var model: LoginViewModel
    
    @Query var users: [User]
    
    var body: some View {
        switch model.loginViewState {
        case .login:
            VStack {
                
                Image("PokemonLogo")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 40)
                    .padding(.horizontal)
                
                Spacer()
                
                if let errorMessage = model.loginViewError {
                    HStack {
                        Text(errorMessage)
                            .font(.caption)
                            .foregroundColor(.red)
                        Spacer()
                    }.padding(.leading, 20)
                    
                }
                
                CustomTextField(value: $model.email, title: "Email", prompt:"Email")
                    .onSubmit {
                        model.checkAutoLogin()
                    }
                CustomTextField(value: $model.password, title: "Password", prompt: "Passsword")
                
                Toggle(isOn: $model.rememberMe) {
                    Text("Rememember me?")
                        .foregroundColor(.pokemonPrimary)
                        .font(.caption)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                HStack {
                    Spacer()
                    Button {
                        
                        // change the screen
                        model.loginViewState = .forgotPassword
                        
                    } label: {
                        Text("Forgot Password?")
                            .font(.caption)
                            .italic()
                            .foregroundColor(.pokemonSecondary)
                    }

                }
                .padding()
               
                Spacer()
                
                Button {
                    // Code for log in
                    model.logIn(existingUsers: users)
                    
                    
                } label: {
                    CustomButton(title: "Log In")
                }
                
                Spacer()
                
                HStack {
                    Text("Dont have an account?")
                    Button {
                        model.loginViewState = .signUp
                    } label: {
                        Text("Sign in")
                            .foregroundColor(.pokemonSecondary)
                            .fontWeight(.medium)
                    }

                }
                .italic()
                .font(.caption)
                
            }
        
        case .signUp:
            SignUpView()
        case .forgotPassword:
            ForgotPasswordView()
                .environmentObject(ForgotPasswordViewModel())
        case .otp:
            OTPView()
        case .newPassword:
            NewPasswordView()
        }
        
        
    }
}

//#Preview {
//    LoginView()
//        .environmentObject(LoginViewModel())
//}

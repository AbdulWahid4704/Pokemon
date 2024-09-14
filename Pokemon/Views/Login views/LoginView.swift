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
    
    @State var email = ""
    @State var password = ""
    
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
                
                CustomTextField(value: $email, title: "Email", prompt:"Email")
                CustomTextField(value: $password, title: "Password", prompt: "Passsword")
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
                    model.logIn(existingUsers: users, email: email, password: password)
                    
                    
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
//}

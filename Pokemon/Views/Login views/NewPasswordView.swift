//
//  NewPasswordView.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 31/08/2024.
//

import SwiftUI

struct NewPasswordView: View {
    
    @Environment(\.modelContext) var context
    
    @EnvironmentObject var model: ForgotPasswordViewModel
    @EnvironmentObject var loginModel: LoginViewModel
    
    var body: some View {
        VStack {
            
            Image("PokemonLogo")
                .resizable()
                .scaledToFit()
                .padding(.top, 40)
                .padding(.horizontal)
            
            Spacer()
            
            HStack {
                Text("Enter new password")
                    .font(.caption)
                    .foregroundColor(.pokemonPrimary)
                Spacer()
            }.padding(.leading, 20)
            
            CustomTextField(value: $model.newPassword, title: "Password", prompt: "Enter New Password")
            
            CustomTextField(value: $model.confirm, title: "Confirm", prompt: "Confirm New Password")
                .padding(.bottom, 40)
            
            Button {
                // Code for log in
                // Call method to verify and update password
                do {
                    
                    // Ensure the passowrds mathc, and save the context
                    try model.verifyPasswordAndUpdateUser()
                    try context.save()
                    
                    // switch it back to login view
                    loginModel.loginViewState = .login
                    
                } catch {
                    print(error.localizedDescription)
                }
            } label: {
                CustomButton(title: "LogIn")
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
    }
}

//#Preview {
//    NewPasswordView()
//}

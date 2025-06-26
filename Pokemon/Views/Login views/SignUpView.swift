//
//  Sign up view.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 28/08/2024.
//

import SwiftUI
import SwiftData

struct SignUpView: View {
    
    @Environment(\.modelContext) var context
    
    @Query var existingUsers: [User]
    
    @EnvironmentObject var loginModel: LoginViewModel
    
    @StateObject var model = SignUpViewModel()
    
    var body: some View {
        VStack {
            
            Image("PokemonLogo")
                .resizable()
                .scaledToFit()
                .padding(.top, 40)
                .padding(.horizontal)
            
            Spacer()
            
            if let errorMessage = model.errorMessage {
                HStack {
                    Text(errorMessage)
                        .font(.caption)
                        .foregroundColor(.red)
                    Spacer()
                }.padding(.leading, 20)
                
            }
            
            CustomTextField(value: $model.name, title: "Name", prompt:"Name")
            CustomTextField(value: $model.phone, title: "Phone", prompt:"Phone")
            CustomTextField(value: $model.email, title: "Email", prompt:"Email")
            CustomTextField(value: $model.password, title: "Password", prompt: "Passsword")
            CustomTextField(value: $model.confirm, title: "Confirm", prompt:"Confirm")
           
            Spacer()
            
            Button {
                // Code for sign in
                let user = model.signUp(existingUsers: existingUsers)
                // check the return, if there is sign in
                if let user = user { context.insert(user) }
                
            } label: {
                CustomButton(title: "Sign Up")
            }
            
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
            
        }
        
    }
    
    
}

//#Preview {
//    SignUpView()
//}

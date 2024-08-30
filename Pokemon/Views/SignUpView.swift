//
//  Sign up view.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 28/08/2024.
//

import SwiftUI

struct SignUpView: View {
    
    var body: some View {
        VStack {
            
            Image("PokemonLogo")
                .resizable()
                .scaledToFit()
                .padding(.top, 40)
                .padding(.horizontal)
            
            Spacer()
            
            CustomTextField(title: "Name", prompt:"Name")
            CustomTextField(title: "Phone", prompt:"Phone")
            CustomTextField(title: "Email", prompt:"Email")
            CustomTextField(title: "Password", prompt: "Passsword")
            CustomTextField(title: "Confirm", prompt:"Confirm")
           
            Spacer()
            
            Button {
                // Code for log in
            } label: {
                CustomButton(title: "Sign Up")
            }
            
            Spacer()
            
            HStack {
                Text("Already have an account")
                Text("Log In!")
                    .foregroundColor(.pokemonSecondary)
                    .fontWeight(.medium)
            }
            .italic()
            
        }
        
    }
}

#Preview {
    SignUpView()
}

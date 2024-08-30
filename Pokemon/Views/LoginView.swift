//
//  ContentView.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 28/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var email = ""
    
    var body: some View {
        VStack {
            
            Image("PokemonLogo")
                .resizable()
                .scaledToFit()
                .padding(.top, 40)
                .padding(.horizontal)
            
            Spacer()
            
            CustomTextField(title: "Email", prompt:"Email")
            CustomTextField(title: "Password", prompt: "Passsword")
            HStack {
                Spacer()
                Text("Forgot Password?")
                    .font(.caption)
                    .italic()
                    .foregroundColor(.pokemonSecondary)
            }
            .padding()
           
            Spacer()
            
            Button {
                // Code for log in
            } label: {
                CustomButton(title: "Log In")
            }
            
            Spacer()
            
            HStack {
                Text("Dont have an account?")
                Text("Sign in")
                    .foregroundColor(.pokemonSecondary)
                    .fontWeight(.medium)
            }
            .italic()
            
        }
        
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 07/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(Constants.IS_LOGGED_IN) var isLoggedIn: Bool = false
    
    var body: some View {
        
        if isLoggedIn {
            // PokemonTabView()
            Button("Sign out") {
                isLoggedIn = false
            }
            
        } else {
            LoginView()
                .environmentObject(LoginViewModel())
        }
        
        
        
    }
}

#Preview {
    ContentView()
}

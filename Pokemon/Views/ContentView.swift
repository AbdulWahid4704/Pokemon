//
//  ContentView.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 07/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(Constants.CURRENT_USER_EMAIL_KEY) var currentUser: String?
    
    var body: some View {
        
        if currentUser != nil {
            
            PokemonTabView()
            
        } else {
            LoginView()
                
        }
        
        
        
    }
}

#Preview {
    ContentView()
}

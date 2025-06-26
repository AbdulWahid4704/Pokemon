//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 14/09/2024.
//

import SwiftUI

struct PokemonDetailView: View {
    var body: some View {
        
        VStack {
                   // Image placeholder
                   Rectangle()
                       .fill(Color.gray.opacity(0.2))
                       .frame(width: UIScreen.main.bounds.width, height: 300)
                   
                   // Pokemon Name
                   Text("Bulbasaur")
                       .font(.largeTitle)
                       .fontWeight(.bold)
                       .foregroundColor(Color.pokemonPrimary)
                       .padding(.top, 16)
                       .frame(maxWidth: .infinity, alignment: .leading)
                       .padding(.horizontal)
                   
                   // Pokemon Types
                   HStack(spacing: 10) {
                       Text("type 1")
                           .font(.headline)
                           .foregroundColor(Color.yellow)
                       
                       Text("type 1")
                           .font(.headline)
                           .foregroundColor(Color.yellow)
                   }
                   .frame(maxWidth: .infinity, alignment: .leading)
                   .padding(.horizontal)
                   .padding(.bottom, 8)
                   
                   // Details Section
                   VStack(alignment: .leading, spacing: 12) {
                       HStack {
                           Text("Species:")
                               .font(.subheadline)
                               .foregroundColor(.gray)
                           Text("Seed")
                               .font(.subheadline)
                               .foregroundColor(.pokemonPrimary)
                       }
                       
                       HStack {
                           Text("Height:")
                               .font(.subheadline)
                               .foregroundColor(.gray)
                           Text("120")
                               .font(.subheadline)
                               .foregroundColor(.pokemonPrimary)
                       }
                       
                       HStack {
                           Text("Weight:")
                               .font(.subheadline)
                               .foregroundColor(.gray)
                           Text("35")
                               .font(.subheadline)
                               .foregroundColor(.pokemonPrimary)
                       }
                       
                       HStack {
                           Text("Species:")
                               .font(.subheadline)
                               .foregroundColor(.gray)
                           Text("Abilities")
                               .font(.subheadline)
                               .foregroundColor(.pokemonPrimary)
                       }
                   }
                   .padding()
                   .frame(maxWidth: .infinity, alignment: .leading)
                   
                    Spacer()
            
                   // Play Cry Button
                   Button(action: {
                       // Action for playing cry
                   }) {
                       HStack {
                           Image(systemName: "play.fill")
                           Text("Play Cry")
                       }
                       .padding()
                       .background(Color.pokemonPrimary)
                       .foregroundColor(.white)
                       .cornerRadius(10)
                   }
                   .padding(.top, 8)
                  
               }
        
        
        
    }
        
    
}

#Preview {
    PokemonDetailView()
}

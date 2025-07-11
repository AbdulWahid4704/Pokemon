//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 14/09/2024.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @ObservedObject var model: PokemonDetailViewModel
    
    var body: some View {
        
        VStack {
            // Image placeholder
            AsyncImage(url: URL(string: model.frontDefault)) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "photo")
            }
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width, height: 300)
            
            // Pokemon Name
            Text(model.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.pokemonPrimary)
                .padding(.top, 16)
                       .frame(maxWidth: .infinity, alignment: .leading)
                       .padding(.horizontal)
                       
            Text(model.types)
                           .font(.headline)
                           .foregroundColor(Color.yellow)
                   .frame(maxWidth: .infinity, alignment: .leading)
                   .padding(.horizontal)
                   .padding(.bottom, 8)
                   
                   // Details Section
                   VStack(alignment: .leading, spacing: 12) {
                       HStack {
                           Text("Species:")
                               .font(.subheadline)
                               .foregroundColor(.gray)
                           Text(model.species)
                               .font(.subheadline)
                               .foregroundColor(.pokemonPrimary)
                       }
                       
                       HStack {
                           Text("Height:")
                               .font(.subheadline)
                               .foregroundColor(.gray)
                           Text(model.height)
                               .font(.subheadline)
                               .foregroundColor(.pokemonPrimary)
                       }
                       
                       HStack {
                           Text("Weight:")
                               .font(.subheadline)
                               .foregroundColor(.gray)
                           Text(model.weight)
                               .font(.subheadline)
                               .foregroundColor(.pokemonPrimary)
                       }
                       
                       HStack {
                           Text("Abilities:")
                               .font(.subheadline)
                               .foregroundColor(.gray)
                           Text(model.abilities)
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
                       
                       model.playSound()
                       
                       // DEEBUG ---- check to see if password saved
                       KeychainManager.getPassword()
                       
                       
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

//#Preview {
//    PokemonDetailView()
//}

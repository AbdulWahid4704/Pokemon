//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 14/09/2024.
//

import SwiftUI

struct PokemonListView: View {
    
    @State var pokemons = ["BUlbusaur", "pryo", "Chairzad"]
    @EnvironmentObject var model: PokemonListViewModel
    
    var body: some View {
        
        NavigationStack {
            List {
                
                ForEach(model.pokemons) { pokemon in
                    
                    //Navigation link to navigate to detailed view
                    NavigationLink {
                        //PokemonDetailView
                        Text("Detail View")
                    } label: {
                        HStack {
                            
                            // Names
                            VStack(alignment: .leading) {
                                
                                //Name
                                Text(pokemon.name.capitalized)
                                    .font(.largeTitle)
                                    .foregroundColor(.pokemonPrimary)
                                    .padding(.bottom)
                                    .bold()
                                
                                // Types
                                types(pokemon)
                               
                            }
                            Spacer()
                            Image("image 1")
                                .scaledToFit()
                                .frame(width: 100)
                        }
                        .padding(.horizontal)
                        .frame(height: 140)
                    }
                    
                }
                
                
            }
            .listStyle(.plain)
            .navigationTitle("Pokemons")
        }
        
       
        
    }
    
    func types(_ pokemon: Pokemon) -> some View {
        HStack(alignment: .center, spacing: 50) {
            
            let types: [String] = pokemon.types.map { $0.type.name }
            
            ForEach(types, id: \.self) { type in
                
                Text(type)
                
            }
            
            
            
        }
        .foregroundColor(.pokemonSecondary)
    }
}

#Preview {
    PokemonListView()
        .environmentObject(PokemonListViewModel())
}

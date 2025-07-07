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
    
    @State var path: [Any] = []
    
    @AppStorage(Constants.CUSTOM_POKEMON_NOTIFICATION) var customPokemon: String = ""
    
    var body: some View {
        
        NavigationStack(path: $model.path) {
            
            List {
                
                ForEach(model.pokemons) { pokemon in
                    
                    //Navigation link to navigate to detailed view
                    
                    NavigationLink(value: pokemon) {
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
                            AsyncImage(url: URL(string: pokemon.sprites.frontDefault)) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height: 140)
                            } placeholder: {
                                Image(systemName: "photo")
                            }
                        }
                        .padding(.horizontal)
                        .frame(height: 140)
                    }
                    
                }
                
                
            }
            .listStyle(.plain)
            .navigationTitle("Pokemons")
            .navigationDestination(for: Pokemon.self) { pokemon in
                PokemonDetailView(model: PokemonDetailViewModel(pokemon: pokemon))
            }
            .onChange(of: customPokemon) { _, pokemonName in
                if pokemonName != "" {
                    model.getCustomPokemon(withName: pokemonName)
                    print("On change -> \(customPokemon)")
                    customPokemon = ""
                }
                
            }
            .onAppear {
                if customPokemon != "" {
                    model.getCustomPokemon(withName: customPokemon)
                    print("On change -> \(customPokemon)")
                    customPokemon = ""
                }
            }
        }
        
        
        
        
    }
    
    func types(_ pokemon: Pokemon) -> some View {
        HStack(alignment: .center, spacing: 50) {
            
            let types: [String] = pokemon.types.map { $0.type.name }
            
            ForEach(types, id: \.self) { type in
                
                Text(type.capitalized)
                
            }
            
            
            
        }
        .foregroundColor(.pokemonSecondary)
    }
}

//#Preview {
//    PokemonListView()
//        .environmentObject(PokemonListViewModel())
//}

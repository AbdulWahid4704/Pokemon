//
//  PokemonListVIewModel.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 22/09/2024.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    
    @Published var pokemons: [Pokemon] = []
    
    init() {
        getPokemons()
    }
    
    func getPokemons() {
        
        
        
        guard let url = URL(string: Constants.POKEMON_URL) else {
            print("Url doesnt work")
            return
        }
        
        NetworkHelper.getData(url: url) { data in
            
            guard let data = data else {
                return
            }
            
            guard let pokemonData = try? JSONDecoder().decode(PokemonData.self, from: data) else { return }
            
            // Get individual pokemons one by one
            for result in pokemonData.results {
                
                // Create a url
                guard let url = URL(string:result.url) else {
                    print("COuldnt get data for \(result.name) pokemon")
                    return
                }
                
                // call the network
                NetworkHelper.getData(url: url) { data in
                    
                    // Confirm there is data
                    guard let data = data  else { return }
                    
                    guard let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else { return }
                    
                    //append to pokemons
                    DispatchQueue.main.async {
                        self.pokemons.append(pokemon)
                        print("appended \(pokemon.name)")
                    }
                    
                }
                
                
            }
        }
        
        
        
    }
    
    
}

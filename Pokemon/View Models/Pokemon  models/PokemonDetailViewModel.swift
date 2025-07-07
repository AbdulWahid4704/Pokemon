//
//  PokemonDetailViewModel.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 26/06/2025.
//

import Foundation
import AVFoundation
import AVFAudio
import Combine

class PokemonDetailViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var types: String = ""
    @Published var species: String = ""
    @Published var height: String = ""
    @Published var weight: String = ""
    @Published var abilities: String = ""
    
    @Published var frontDefault = ""
    
    var statusCancellable: AnyCancellable?
    
    var cry = ""
    var player: AVPlayer?
    
    
    init(pokemon: Pokemon) {
        
       updateView(with: pokemon)
        
    }
    
    init(withName name: String) {
        
        getPokemon(name: name) { pokemon in
            DispatchQueue.main.async {
                self.updateView(with: pokemon)
            }
            
        }
        
    }
     
    func getPokemon(name: String, handler: @escaping (Pokemon) -> Void) {
        
        guard let url = URL(string: Constants.CUSTOM_POKEMON_URL(name)) else {
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
                        handler(pokemon)
                        print("appended \(pokemon.name)")
                    }
                    
                }
                
                
            }
        }
    }
    
    func updateView(with pokemon: Pokemon) {
        self.name = pokemon.name.capitalized
        self.height = String(pokemon.height)
        self.weight = String(pokemon.weight)
        self.species = pokemon.species.name.capitalized
        
        self.types = self.updatedTypes(pokemon)
        self.abilities = self.updatedAbilities(pokemon)
        
        self.frontDefault = pokemon.sprites.frontDefault
        
        // use another api to get mp3 version, since pokeapi sends ogg
        self.cry = Constants.POKEMON_CRY_URL(pokemon.name)
        
    }
    
    // Function to make the strings to display in the view
    func updatedTypes(_ pokemon: Pokemon) -> String {
        return pokemon.types.map { $0.type.name.capitalized }.joined(separator: ", ")
    }
    
    func updatedAbilities(_ pokemon: Pokemon) -> String {
        let abilities: [String] = pokemon.abilities.map { $0.ability.name.capitalized }
        
        return abilities.joined(separator: ", ")
    }
    
    //function to play sound
    func playSound() {
        
        if let url = URL(string: cry) {
            let item = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: item)
            player?.volume = 1.0
            
            player?.play()
        }
        
        
    }
    
}

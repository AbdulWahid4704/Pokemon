//
//  PokemonDetailViewModel.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 26/06/2025.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    
    @Published var name: String
    @Published var types: String = ""
    @Published var species: String
    @Published var height: String
    @Published var weight: String
    @Published var abilities: String = ""
    
    @Published var frontDefault = ""
    
    init(pokemon: Pokemon) {
        
        self.name = pokemon.name.capitalized
        self.height = String(pokemon.height)
        self.weight = String(pokemon.weight)
        self.species = pokemon.species.name.capitalized
        
        self.types = self.updatedTypes(pokemon)
        self.abilities = self.updatedAbilities(pokemon)
        
        self.frontDefault = pokemon.sprites.frontDefault
        
        
    }
    
    func updatedTypes(_ pokemon: Pokemon) -> String {
        return pokemon.types.map { $0.type.name.capitalized }.joined(separator: ", ")
    }
    
    func updatedAbilities(_ pokemon: Pokemon) -> String {
        let abilities: [String] = pokemon.abilities.map { $0.ability.name.capitalized }
        
        return abilities.joined(separator: ", ")
    }
    
}

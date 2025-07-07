//
//  PokemonData.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 21/09/2024.
//

import Foundation

struct PokemonData: Codable, Identifiable, Hashable {
    var id: UUID? = UUID()
    var results: [PokemonResult]
}

struct PokemonResult: Codable, Identifiable, Hashable {
    var id: UUID? = UUID()
    var name: String
    var url: String
}

struct Pokemon: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var height: Int
    var weight: Int
    var species: PokemonSpecies
    var abilities: [PokemonAbilityResult]
    var types: [PokemonTypeResult]
    var cries: PokemonCry
    var sprites: PokemonSprite
}

struct PokemonSprite: Codable, Identifiable, Hashable {
    var id: UUID? = UUID()
    var frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct PokemonCry: Codable, Identifiable, Hashable {
    var id: UUID? = UUID()
    var latest: String
}

struct PokemonTypeResult: Codable, Identifiable, Hashable {
    var id: UUID? = UUID()
    var type: PokemonType
}

struct PokemonType: Codable, Identifiable, Hashable {
    var id: UUID? = UUID()
    var name: String
}

struct PokemonAbilityResult: Codable, Identifiable, Hashable {
    var id: UUID? = UUID()
    var ability: PokemonAbility
}

struct PokemonAbility: Codable, Identifiable, Hashable {
    var id: UUID? = UUID()
    var name: String
}

struct PokemonSpecies: Codable, Identifiable, Hashable {
    var id: UUID? = UUID()
    var name: String
}

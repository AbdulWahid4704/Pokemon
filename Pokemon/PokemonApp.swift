//
//  PokemonApp.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 28/08/2024.
//

import SwiftUI
import SwiftData


@main
struct PokemonApp: App {
    var body: some Scene {
        WindowGroup {
            PokemonTabView()
        }
        .modelContainer(for: User.self)
    }
}

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
            ContentView()
                .environmentObject(LoginViewModel())
        }
        .modelContainer(for: User.self)
    }
}

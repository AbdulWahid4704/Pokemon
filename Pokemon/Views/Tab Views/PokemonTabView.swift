//
//  PokemonTabView.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 14/09/2024.
//

import SwiftUI

struct PokemonTabView: View {
    var body: some View {
        TabView {
            
            PokemonListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Pokemons")
                }
                .environmentObject(PokemonListViewModel())
            
            //
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
            
        }
    }
}

//#Preview {
//    PokemonTabView()
//}

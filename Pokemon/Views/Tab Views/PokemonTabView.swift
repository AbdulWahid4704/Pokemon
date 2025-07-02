//
//  PokemonTabView.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 14/09/2024.
//

import SwiftUI

struct PokemonTabView: View {
    
    @AppStorage(Constants.TAB_SELECTION_KEY) var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection){
            
            PokemonListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Pokemons")
                }
                .environmentObject(PokemonListViewModel())
                .tag(1)
            
            //
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(2)
            
            
        }
    }
}

//#Preview {
//    PokemonTabView()
//}

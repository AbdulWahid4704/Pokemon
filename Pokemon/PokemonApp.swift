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
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(LoginViewModel())
            
            // MARK: test mode,
            // direct tab view -----------
            // PokemonTabView()
            // direct login view ------
            // LoginView().environmentObject(LoginViewModel())
            
        }
        .onChange(of: scenePhase) { _, newScenePhase in
            
            // Check when the app goes into background, log the user out if remember me wasnt checked
            switch newScenePhase {
            case .background:
                let flag = UserDefaults.standard.bool(forKey: Constants.REMEMBER_ME_FLAG)
                if !flag {
                    // logout the user
                    UserDefaults.standard.set(nil, forKey: Constants.CURRENT_USER_EMAIL_KEY)
                    
                }
            default: break
            }
        }
        .modelContainer(for: User.self)
    }
}

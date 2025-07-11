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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject var listModel = PokemonListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(LoginViewModel())
                .environmentObject(listModel)
                .onAppear {
                    
                    //Request authorization
                    NotificationManager.instance.requestAuthorization()
                    
                    // set the notification badge to 0
                    UNUserNotificationCenter.current().setBadgeCount(0)
                    
                    
                    
                }
            
            // MARK: test mode,
            // direct tab view -----------
            // PokemonTabView()
            // direct login view ------
            // LoginView().environmentObject(LoginViewModel())
            
        }
        .onChange(of: scenePhase) { _, newScenePhase in
            
            // Check when the app goes into background, log the user out
            switch newScenePhase {
            case .background:
                // schedule a single notification which rings 5 seconds after user closes the app
                NotificationManager.instance.scheduleNotification()
                
                // Reset the tab view
                UserDefaults.standard.set(1, forKey: Constants.TAB_SELECTION_KEY)
                
                
            default: break
            }
        }
        .modelContainer(for: User.self)
    }
}

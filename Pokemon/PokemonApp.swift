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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(LoginViewModel())
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
                
                // Logout the user, when the app goes into background
                // logout the user
                UserDefaults.standard.set(nil, forKey: Constants.CURRENT_USER_EMAIL_KEY)
                
            default: break
            }
        }
        .modelContainer(for: User.self)
    }
}

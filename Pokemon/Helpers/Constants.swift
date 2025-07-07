//
//  Constants.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 30/08/2024.
//

import Foundation

struct Constants {
    
    static var DEFAULT_OTP = "1234"
    
    // UserDefaults
    static var IS_LOGGED_IN_KEY = "isLoggedin"
    static var CURRENT_USER_EMAIL_KEY = "currentUserEmail"
    static var REMEMBER_ME_FLAG = "rememberMe"
    static var USER_PROFILES = "UserProfiles"
    static var LAST_USER_KEY = "LastUser"
    static var TAB_SELECTION_KEY = "TabViewSelection"
    static var CUSTOM_POKEMON_NOTIFICATION = "customPokemonNotification"
    
    //Notifications
    static var GO_TO_PROFILE = "GoToProfile"
    static var NOTIFICATION_CATEGORY = "Category"
    
    static var POKEMON_URL = "https://pokeapi.co/api/v2/pokemon?limit=10"
    
    static func CUSTOM_POKEMON_URL(_ name: String) -> String {
        return "https://pokeapi.co/api/v2/pokemon/\(name)"
    }
    
    static func POKEMON_CRY_URL(_ name: String) -> String {
        return "https://play.pokemonshowdown.com/audio/cries/\(name).mp3"
    }
    
}

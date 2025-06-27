//
//  ProfileViewModel.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 26/06/2025.
//

import Foundation
import UIKit
import SwiftUI
import PhotosUI

@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published var showingCamera = false
    
    @Published var name = ""
    @Published var email = ""
    @Published var phone = ""
    
    @Published var profile: UIImage?
    @Published var profileSelection: PhotosPickerItem? {
        didSet {
            updateProfilePic(from: profileSelection)
        }
    }
    
    var user: User?
    
    init() {
        
    }
    
    func updateView(_ users: [User]) {
        if let user = getCurrentUser(users: users) {
            
            self.user = user
            
            self.name = user.name
            self.email = user.email
            self.phone = user.phone
            self.setProfile(from: user.imageData)
        }
    }
    
    func setProfile(from data: Data?) {
        
        if let data = data, let image = UIImage(data: data) {
            self.profile = image
        }
        
    }
    
    func updateProfilePic(from selection: PhotosPickerItem?) {
        
        guard let selection = selection else { return }
        
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let image = UIImage(data: data) {
                    profile = image
                    
                    user?.imageData = data
                    
                }
            }
        }
        
    }
    
    func getCurrentUser(users: [User]) -> User? {
        
        let email = UserDefaults.standard.string(forKey: Constants.CURRENT_USER_EMAIL_KEY)
        
        
        for user in users {
            if email == user.email {
                return user
            }
            
        }
        
        return nil
        
    }
    
    
}

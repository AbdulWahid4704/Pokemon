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
    
    @Published var profile: UIImage? {
        didSet {
            save(image: profile)
        }
    }
    @Published var profileSelection: PhotosPickerItem? {
        didSet {
            updateProfilePic(from: profileSelection)
        }
    }
    
    var user: User?
    
    let manager = LocalFileManager.instance
    
    init() {
        
    }
    
    func updateView(_ users: [User]) {
        if let user = getCurrentUser(users: users) {
            
            self.user = user
            
            self.name = user.name
            self.email = user.email
            self.phone = user.phone
            self.setProfile(for: user.email)
        }
    }
    
    func setProfile(for email: String) {
        
        guard let image = manager.getImage(name: email, from: Constants.USER_PROFILES) else { return }
        
        profile = image
        
    }
    
    
    func updateProfilePic(from selection: PhotosPickerItem?) {
        
        guard let selection = selection else { return }
        
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let image = UIImage(data: data) {
                    self.profile = image
                    
                }
            }
        }
        
    }
    
    func save(image: UIImage?) {
        
        if let image = image {
            // Deelte existing image, if nothing it wouldnt do anything
            manager.deleteImage(name: self.email, from: Constants.USER_PROFILES)
            //save new image
            manager.saveImage(image, name: self.email, in: Constants.USER_PROFILES)
            
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
    
    func signOut() {
        //sign the user out
        UserDefaults.standard.setValue(nil, forKey: Constants.CURRENT_USER_EMAIL_KEY)
        UserDefaults.standard.set(false, forKey: Constants.REMEMBER_ME_FLAG)
    }
    
    
}

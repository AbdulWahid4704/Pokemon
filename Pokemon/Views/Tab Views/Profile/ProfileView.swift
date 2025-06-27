//
//  ProfileView.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 26/06/2025.
//

import SwiftUI
import SwiftData
import PhotosUI


struct ProfileView: View {
    
    @Environment(\.modelContext) var context
    
    @Query var existingUsers: [User]
    
    @StateObject var model = ProfileViewModel()
    
    @AppStorage(Constants.CURRENT_USER_EMAIL_KEY) var currentUser: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Details Section
            VStack(alignment: .leading, spacing: 12) {
                
                Text("Details")
                    .bold()
                    .font(.title)
                    .padding(.bottom, 20)
                
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 30){
                        
                        PhotosPicker(selection: $model.profileSelection, matching: .images) {
                            Text("Choose a photo")
                        }
                        
                        Button {
                            model.showingCamera = true
                        } label: {
                            Text("Take a photo")
                        }
                        .sheet(isPresented: $model.showingCamera) {
                            CameraView(image: $model.profile)
                        }
                        
                    }
                    Spacer()
                    if let profile = model.profile {
                        Image(uiImage: profile)
                            .resizable()
                            .scaledToFit()
                            .frame(width:200, height: 200)
                            .onAppear {
                                do {
                                    try context.save()
                                } catch {
                                    print("ISsue saving context: \(error)")
                                }
                            }
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width:200, height: 200)
                    }
                    
                        
                    
                }
                
                HStack {
                    Text("Name")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(model.name)
                        .font(.subheadline)
                        .foregroundColor(.pokemonPrimary)
                }
                
                HStack {
                    Text("Email")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(model.email)
                        .font(.subheadline)
                        .foregroundColor(.pokemonPrimary)
                }
                
                HStack {
                    Text("Phone number")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(model.phone)
                        .font(.subheadline)
                        .foregroundColor(.pokemonPrimary)
                }
               
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            VStack(alignment: .center) {
                Button {
                    
                    //sign the user out
                    UserDefaults.standard.setValue(nil, forKey: Constants.CURRENT_USER_EMAIL_KEY)
                    
                } label: {
                    
                    Text("Sign Out")
                        .font(.title)
                        .foregroundStyle(.red)
                    
                }
            }.frame(maxWidth: .infinity)
            
            Spacer()
        }
        .onAppear {
            model.updateView(existingUsers)
        }
    }
}

//#Preview {
//    ProfileView()
//}

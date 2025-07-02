//
//  NotificationManager.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 29/06/2025.
//

import Foundation
import NotificationCenter

class NotificationManager {
    
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        
        let options: UNAuthorizationOptions = [.sound, .alert, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error getting authorizatio \(error)")
            } else{
                print("SUccess")
            }
        }
        
    }
    
    func scheduleNotification() {
        
        print("Scheduling notification")
        
        // Content
        let content = UNMutableNotificationContent()
        content.title = "Inactive"
        content.subtitle = "YOu have been inactive for 5 seconds"
        content.sound = .default
        content.badge = 1
        content.categoryIdentifier = Constants.NOTIFICATION_CATEGORY
        
        //the trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval:5.0, repeats: false)
        
        // the request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // Add the request
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func registerCategories() {
        // register the category
        // The Action
        let profileAction = UNNotificationAction(identifier: Constants.GO_TO_PROFILE, title: "Go to Profile", options: .foreground)
        let category = UNNotificationCategory(identifier: Constants.NOTIFICATION_CATEGORY, actions: [profileAction], intentIdentifiers: [], options: [])
        
        // Set the category
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
    
    func recievedGoToProfile() {
        
        if UserDefaults.standard.string(forKey: Constants.CURRENT_USER_EMAIL_KEY) != nil {
            
            print("User is logged in")
            UserDefaults.standard.set(2, forKey: Constants.TAB_SELECTION_KEY)
            
        }
        
    }
    
}

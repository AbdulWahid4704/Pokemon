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
        
        //the trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval:5.0, repeats: false)
        
        // the request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
    }
    
    
    
}

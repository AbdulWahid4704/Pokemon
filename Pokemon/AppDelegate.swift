//
//  AppDelegate.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 30/06/2025.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseMessaging

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        // assign delegates
        UNUserNotificationCenter.current().delegate = self
        Messaging.messaging().delegate = self
        
        application.registerForRemoteNotifications()
        
        NotificationManager.instance.registerCategories()
        
        // For opening a custom notification
        
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        print("APNs Device Token: \(token)")
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: any Error) {
        print("Failure registering \(error)")
    }
    
    // MARK: UN User Notification Methods
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // Action response based on the action provided
        print("recieved notification at \(Date())")
        // take the user info
        let content = response.notification.request.content
        let userinfo = content.userInfo
        // check the action, and open accordingly
        switch response.actionIdentifier {
        case Constants.GO_TO_PROFILE:
            print("DO custom action")
            NotificationManager.instance.recievedGoToProfile()
        default:
            print("Not profile -> \(response.actionIdentifier)")
            break
        }
        
        NotificationCenter.default.post(name: Notification.Name("didRecievePushNotification"), object: nil, userInfo: userinfo)
        
        
        let title = content.title
        
        print("Launched from notification with title: \(title)")
        UserDefaults.standard.set(title, forKey: Constants.CUSTOM_POKEMON_NOTIFICATION)
        
        
        
        
        completionHandler()
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("recieved notification app forereground at  \(Date())")
        
        completionHandler([.banner, .sound, .list])
        
    }
    
    //MARK: FCM Methods
    @objc func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        
        print("Firebase token -> \(String(describing: fcmToken))")
        
    }
    
    
    
}

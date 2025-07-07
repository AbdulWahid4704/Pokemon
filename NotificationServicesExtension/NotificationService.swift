//
//  NotificationService.swift
//  NotificationServicesExtension
//
//  Created by Rusaab Abdul Wahid on 02/07/2025.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {
    
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = bestAttemptContent {
            // Modify the notification content here..
            
            guard let options = bestAttemptContent.userInfo["fcm_options"] as? [String: String] else {
                return
            }
            guard let image = options["image"] else {
                return
            }
            
            // let urlString = options[image!]
            
            // bestAttemptContent.title = urlString!
            
            
            if let url = URL(string: image) {
                
                NotificationImageManager.instance.downloadImage(url: url) { localPath in
                    if let localPath = localPath {
                        do {
                            let attachment = try UNNotificationAttachment(identifier: "Notification", url: localPath)
                            
                            bestAttemptContent.attachments = [attachment]
                        } catch {
                            print(error)
                        }
                    }
                    
                    contentHandler(bestAttemptContent)
                }
                

            }
            
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }
    
}

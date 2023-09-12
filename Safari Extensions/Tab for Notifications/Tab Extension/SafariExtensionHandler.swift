//
//  SafariExtensionHandler.swift
//  Tab Extension
//
//  Created by admin on 9/11/23.
//

import SafariServices
import UserNotifications

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String : Any]?) {
        // This method will be called when a content script provided by your extension calls safari.extension.dispatchMessage("message").
        page.getPropertiesWithCompletionHandler { properties in
            NSLog("The extension received a message (\(messageName)) from a script injected into (\(String(describing: properties?.url))) with userInfo (\(userInfo ?? [:]))")
        }
    }

    override func toolbarItemClicked(in window: SFSafariWindow) {
        // This method will be called when your toolbar item is clicked.
        NSLog("!!!!!!!!!!!!!The extension's toolbar item was clicked")
        let options: UNAuthorizationOptions = [.alert,.sound,.badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error : \(error)")
            }else {
                print("!!!!!!!Success!!!!!")
            }
        }
        let content = UNMutableNotificationContent()
        content.title = "10-Sec Delay Notification"
        content.subtitle = "This is delay notification of 10 sec"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        //You can repeat also but time should be greater than 1 minute
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
    
    override func validateToolbarItem(in window: SFSafariWindow, validationHandler: @escaping ((Bool, String) -> Void)) {
        // This is called when Safari's state changed in some way that would require the extension's toolbar item to be validated again.
        validationHandler(true, "")
    }
    
    override func popoverViewController() -> SFSafariExtensionViewController {
        return SafariExtensionViewController.shared
    }

}

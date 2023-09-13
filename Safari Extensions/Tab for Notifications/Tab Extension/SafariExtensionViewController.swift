//
//  SafariExtensionViewController.swift
//  Tab Extension
//
//  Created by admin on 9/11/23.
//

import SafariServices
import UserNotifications

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:320, height:240)
        return shared
    }()

    @IBAction func setTimer(_ sender: Any) {
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
}

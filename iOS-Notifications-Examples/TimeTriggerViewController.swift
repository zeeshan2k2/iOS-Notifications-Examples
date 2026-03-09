//
//  TimeTriggerViewController.swift
//  iOS-Notifications-Examples
//
//  Created by Zeeshan Waheed on 09/03/2026.
//

import UIKit
import UserNotifications

class TimeTriggerViewController: UIViewController {

    private let timeInterval: TimeInterval = 5
    private let notificationID = "time-trigger-example"

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Time Trigger"
        view.backgroundColor = .systemBackground
    }

    @IBAction func scheduleNotification(_ sender: UIButton) {

        let center = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = "Time Trigger"
        content.body = "Notification fired after \(Int(timeInterval)) seconds"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: timeInterval,
            repeats: false
        )

        let request = UNNotificationRequest(
            identifier: notificationID,
            content: content,
            trigger: trigger
        )

        // Remove existing notification with same ID
        center.removePendingNotificationRequests(withIdentifiers: [notificationID])

        center.add(request) { error in
            if let error = error {
                print("Failed to schedule notification:", error)
            } else {
                print("Notification scheduled")
            }
        }
    }
}

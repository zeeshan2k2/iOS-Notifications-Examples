//
//  intervalTriggerViewController.swift
//  iOS-Notifications-Examples
//
//  Created by Zeeshan Waheed on 09/03/2026.
//

import UIKit
import UserNotifications

class IntervalTriggerViewController: UIViewController {

    private let interval: TimeInterval = 60
    private let notificationID = "interval-trigger-example"

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Interval Trigger"
        view.backgroundColor = .systemBackground
    }

    @IBAction func scheduleNotification(_ sender: UIButton) {

        let center = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = "Interval Trigger"
        content.body = "Repeating notification every \(Int(interval)) seconds"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: interval,
            repeats: true
        )

        let request = UNNotificationRequest(
            identifier: notificationID,
            content: content,
            trigger: trigger
        )

        // Remove any existing notification with same identifier
        center.removePendingNotificationRequests(withIdentifiers: [notificationID])

        center.add(request) { error in
            if let error = error {
                print("Failed to schedule interval notification:", error)
            } else {
                print("Interval notification scheduled")
            }
        }
    }

    @IBAction func cancelNotification(_ sender: UIButton) {

        let center = UNUserNotificationCenter.current()

        center.removePendingNotificationRequests(withIdentifiers: [notificationID])
        center.removeDeliveredNotifications(withIdentifiers: [notificationID])

        print("Interval notification cancelled")
    }
}

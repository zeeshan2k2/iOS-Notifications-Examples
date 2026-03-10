//
//  EventTriggerViewController.swift
//  iOS-Notifications-Examples
//
//  Created by Zeeshan Waheed on 10/03/2026.
//

import UIKit
import UserNotifications

class EventTriggerViewController: UIViewController {

    private let notificationID = "event-trigger-example"

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Event Trigger"
        view.backgroundColor = .systemBackground
    }

    @IBAction func scheduleNotification(_ sender: UIButton) {

        // Get the notification center instance
        let center = UNUserNotificationCenter.current()

        // Create notification content
        let content = UNMutableNotificationContent()
        content.title = "Event Trigger"
        content.body = "Your scheduled reminder fired."
        content.sound = .default

        // Define the time when the notification should fire
        // This example schedules it for the next minute
        var components = DateComponents()
        components.minute = Calendar.current.component(.minute, from: Date()) + 1

        // Create the calendar trigger
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: components,
            repeats: false
        )

        // Create the notification request
        let request = UNNotificationRequest(
            identifier: notificationID,
            content: content,
            trigger: trigger
        )

        // Prevent duplicate notifications
        center.removePendingNotificationRequests(withIdentifiers: [notificationID])

        // Schedule the notification
        center.add(request) { error in

            if let error = error {
                print("Failed to schedule event notification:", error)
            } else {
                print("Event notification scheduled")
            }
        }
    }
}

//
//  LocationTriggerViewController.swift
//  iOS-Notifications-Examples
//
//  Created by Zeeshan Waheed on 10/03/2026.
//

import UIKit
import UserNotifications
import CoreLocation

class LocationTriggerViewController: UIViewController, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    private let notificationID = "location-trigger-example"

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Location Trigger"
        view.backgroundColor = .systemBackground

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    @IBAction func scheduleNotification(_ sender: UIButton) {

        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Location Trigger"
        content.body = "You entered the monitored region"
        content.sound = .default
        
        let region = CLCircularRegion(
            center: CLLocationCoordinate2D(
                latitude: 37.3349,
                longitude: -122.0090
            ),
            radius: 100,
            identifier: "apple-park-region"
        )
        
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(
            region: region,
            repeats: false
        )
        
        let request = UNNotificationRequest(
            identifier: notificationID,
            content: content,
            trigger: trigger
        )
        
        center.removePendingNotificationRequests(withIdentifiers: [notificationID])
        
        center.add(request) { error in
            if let error = error {
                print("Failed to schedule location notification", error)
            } else {
                print("Location notification scheduled")
            }
        }
    }
}

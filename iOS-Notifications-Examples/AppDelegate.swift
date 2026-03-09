//
//  AppDelegate.swift
//  iOS-Notifications-Examples
//
//  Created by Zeeshan Waheed on 09/03/2026.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        // Ask notification permission
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .badge, .sound]
        ) { granted, error in
            if granted {
                print("Notification permission granted")
            } else {
                print("Notification permission denied")
            }

            if let error = error {
                print(error.localizedDescription)
            }
        }

        // Allow notifications while app is open
        UNUserNotificationCenter.current().delegate = self

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {

    }

    // MARK: Notification while app is in foreground

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification
    ) async -> UNNotificationPresentationOptions {

        return [.banner, .sound, .badge]
    }
}

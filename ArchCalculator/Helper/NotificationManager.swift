//
//  NotificationCenter.swift
//  ArchCalculator
//
//  Created by Trisha Alexis Likorawung on 08/10/24.
//

import SwiftUI

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    static let shared = NotificationManager()
    
    private override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
        requestNotificationPermissions()
    }
    
    // Request notification permissions
    private func requestNotificationPermissions() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.askForNotificationPermissions()
            case .denied:
                print("Notification permission was denied. Please enable it from settings.")
            case .authorized, .provisional:
                print("Notification permission is granted.")
            case .ephemeral:
                print("Ephemeral notification permission granted.")
            @unknown default:
                print("Unknown notification settings.")
            }
        }
    }
    
    private func askForNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error requesting notifications authorization: \(error.localizedDescription)")
                } else if granted {
                    print("Notification permission granted.")
                } else {
                    print("Notification permission denied.")
                }
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        handleNotificationResponse(userInfo: userInfo)
        completionHandler()
    }
    
    private func handleNotificationResponse(userInfo: [AnyHashable: Any]) {
        if let results = userInfo["results"] as? String {
            print("Received notification for results: \(results)")
            navigateToCalculationView()
        }
    }
    
    // Navigate to the CalculateView
    private func navigateToCalculationView() {
        DispatchQueue.main.async {
            // Access the root view and update the environment or trigger navigation programmatically
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = UIHostingController(
                    rootView: CalculateView(chosenStructure: StructurePlan.structurePlanList[0])
                        .environmentObject(CalculateViewModel())
                )
                window.makeKeyAndVisible()
            }
        }
    }
}



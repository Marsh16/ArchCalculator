//
//  ArchCalculatorApp.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 23/04/24.
//

import SwiftUI

@main
struct ArchCalculatorApp: App {
    
    // Initialize the shared NotificationManager
    let notificationManager = NotificationManager.shared
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}

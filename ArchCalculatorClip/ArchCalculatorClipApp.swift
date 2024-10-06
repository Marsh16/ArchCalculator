//
//  ArchCalculatorClipApp.swift
//  ArchCalculatorClip
//
//  Created by Marsha Likorawung on 04/10/24.
//

import SwiftUI
import SwiftData

@main
struct ArchCalculatorClipApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(CalculateViewModel())
        }
    }
}

//
//  Colors.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 24/04/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let rgbValue = UInt32(hex, radix: 16)
        let r = Double((rgbValue! & 0xFF0000) >> 16) / 255
        let g = Double((rgbValue! & 0x00FF00) >> 8) / 255
        let b = Double(rgbValue! & 0x0000FF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

class Colors {
    static let primaryColor = Color(hex: "#FFC165")
    static let secondaryColor = Color(hex: "#C0842A")
    static let tertiaryColor = Color(hex: "#AD6800")
    static let greyColor = Color(hex: "#1C1C1E")
    static let blurColor = Color(hex: "#D9D9D9")
    static let systemGray = Color(hex: "#F2F2F6")
}

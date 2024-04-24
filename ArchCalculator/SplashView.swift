//
//  SplashView.swift
//  ArchCalculator
//
//  Created by Marsha Likorawung on 24/04/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        Text("Arch").fontWeight(.bold) + Text("Calculator").fontWeight(.bold).foregroundColor(Colors.secondaryColor)
    }
}

#Preview {
    SplashView()
}

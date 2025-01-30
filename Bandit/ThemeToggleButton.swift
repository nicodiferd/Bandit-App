//
//  ThemeToggleButton.swift
//  Bandit
//
//  Created by Nicolo DiFerdinando on 1/18/25.
//

import SwiftUI

struct ThemeToggleButton: View {
    @Binding var isDarkMode: Bool // Binding to toggle theme
    
    var body: some View {
        Button(action: {
            isDarkMode.toggle() // Toggle theme
        }) {
            Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                .font(.system(size: 24)) // Smaller icon size
                .foregroundColor(isDarkMode ? .white : .red)
                .padding()
                .background(
                    Circle()
                        .fill(isDarkMode ? Color.black.opacity(0.7) : Color.white.opacity(0.7))
                )
        }
        .padding(.leading) // Position the button in the top-left corner
        .padding(.top, 20) // Add space at the top
    }
}

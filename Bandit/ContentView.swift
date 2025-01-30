//
//  ContentView.swift
//  Bandit
//
//  Created by Nicolo DiFerdinando on 12/27/24.


import SwiftUI

struct ContentView: View {
    @State private var isDarkMode: Bool = true // Tracks current theme

    var body: some View {
        NavigationStack { // Use NavigationStack for the entire app navigation
            ZStack(alignment: .topLeading) {
                // Background color dynamically changes based on theme
                (isDarkMode ? Color.black : Color.white)
                    .ignoresSafeArea()

                VStack {
                    // App logo dynamically changes based on theme
                    Image(isDarkMode ? "Bandit_Logo_Inverted" : "Bandit Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10.0)
                        .padding()

                    Spacer() // Push the NavigationLink button down

                    NavigationLink(destination: EventPinPageView()) {
                        Text("Enter Event Pin")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(isDarkMode ? .black : .white)
                            .padding()
                            .background(isDarkMode ? Color.white : Color.black)
                            .cornerRadius(10)
                            .padding(.bottom, 30)
                    }
                }

                // Theme Toggle Button in Top-Left Corner
                Button(action: {
                    isDarkMode.toggle()
                }) {
                    Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                        .font(.system(size: 24))
                        .foregroundColor(isDarkMode ? .white : .black)
                        .padding()
                        .background(Circle().fill(isDarkMode ? Color.black.opacity(0.7) : Color.white.opacity(0.7)))
                }
                .padding()
            }
        }
    }
}

// Preview for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

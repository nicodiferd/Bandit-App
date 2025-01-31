//
//  ContentView.swift
//  Bandit
//
//  Created by Nicolo DiFerdinando on 12/27/24.


import SwiftUI

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode = true
    
    var body: some View {
        NavigationView {
            HomeView(isDarkMode: $isDarkMode)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

struct HomeView: View {
    @Binding var isDarkMode: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 24) {
                // Logo Section
                Image("bandit_logo_inverted")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .padding(.horizontal, 40)
                    .padding(.top, 60)
                
                // Hero Section
                VStack(spacing: 16) {
                    Text("Your Event Transportation Solution")
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination: EventListView()) {
                        Text("Find Your Event")
                            .font(.headline)
                            .foregroundColor(isDarkMode ? .black : .white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isDarkMode ? .white : .black)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding()
                .background(Color.primary.opacity(0.05))
                .cornerRadius(15)
                
                // Features Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("Why Choose Bandit?")
                        .font(.title2)
                        .bold()
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        FeatureCard(title: "Event-Specific Rides", description: "Dedicated transportation for your special events", isDarkMode: isDarkMode)
                        FeatureCard(title: "Reliable Service", description: "Professional drivers and timely pickups", isDarkMode: isDarkMode)
                        FeatureCard(title: "Group Booking", description: "Easy coordination for group transportation", isDarkMode: isDarkMode)
                    }
                }
                .padding()
            }
            
            // Theme Toggle Button
            Button(action: {
                withAnimation {
                    isDarkMode.toggle()
                }
            }) {
                Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                    .font(.system(size: 20))
                    .foregroundColor(isDarkMode ? .white : .black)
                    .padding(12)
                    .background(
                        Circle()
                            .fill(isDarkMode ? Color.black.opacity(0.8) : Color.white.opacity(0.8))
                            .shadow(radius: 4)
                    )
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct FeatureCard: View {
    let title: String
    let description: String
    let isDarkMode: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(isDarkMode ? Color.black.opacity(0.3) : Color.white)
        .cornerRadius(10)
        .shadow(color: Color.primary.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// Preview for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

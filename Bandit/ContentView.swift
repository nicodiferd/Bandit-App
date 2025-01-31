//
//  ContentView.swift
//  Bandit
//
//  Created by Nicolo DiFerdinando on 12/27/24.


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeView()
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Hero Section
            VStack(spacing: 16) {
                Text("Welcome to Bandit")
                    .font(.largeTitle)
                    .bold()
                
                Text("Your Event Transportation Solution")
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                NavigationLink(destination: EventListView()) {
                    Text("Find Your Event")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(15)
            
            // Features Section
            VStack(alignment: .leading, spacing: 20) {
                Text("Why Choose Bandit?")
                    .font(.title2)
                    .bold()
                
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 20) {
                    FeatureCard(title: "Event-Specific Rides", description: "Dedicated transportation for your special events")
                    FeatureCard(title: "Reliable Service", description: "Professional drivers and timely pickups")
                    FeatureCard(title: "Group Booking", description: "Easy coordination for group transportation")
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct FeatureCard: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

// Preview for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  Untitled.swift
//  Bandit
//
//  Created by Nicolo DiFerdinando on 1/18/25.
//

import SwiftUI

struct DriverDetailView: View {
    let driver: Driver

    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: driver.photoURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 150, height: 150)
            }
            
            Text(driver.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("\(driver.carMake ?? "") \(driver.carModel ?? "")")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Text("Estimated Wait Time: \(driver.estimatedWaitTime) minutes")
                .font(.headline)
            
            Text("People in Line: \(driver.peopleInLine)")
                .font(.headline)
        }
        .padding()
        .navigationTitle("Driver Details")
    }
}

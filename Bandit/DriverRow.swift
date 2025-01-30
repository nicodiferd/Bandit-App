//
//  DriverRow.swift
//  Bandit
//
//  Created by Nicolo DiFerdinando on 1/18/25.
//

import SwiftUI

struct DriverRow: View {
    let driver: Driver

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: driver.photoURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 80, height: 80)
            }
            
            VStack(alignment: .leading) {
                Text(driver.name)
                    .font(.headline)
                Text("\(driver.carMake ?? "") \(driver.carModel ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

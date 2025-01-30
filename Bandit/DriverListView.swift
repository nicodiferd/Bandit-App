//
//  DriverListView.swift
//  Bandit
//
//  Created by Nicolo DiFerdinando on 1/18/25.
//

import SwiftUI

struct DriverListView: View {
    var eventID: Int // Event ID for fetching drivers
    @State private var drivers: [Driver] = [] // Array of drivers
    @Environment(\.dismiss) private var dismiss // Allows the view to be dismissed

    var body: some View {
        VStack(spacing: 0) {
            // Header with title and back button
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        dismiss() // Navigate back
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 16, weight: .medium))
                            Text("Back to Event Details")
                                .font(.body)
                        }
                    }
                    .padding(.leading)
                    Spacer()
                }
                .padding(.vertical, 8)

                Text("Drivers")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 4)

                Divider()
            }
            .background(Color.white)

            // Driver list or placeholder
            if drivers.isEmpty {
                Spacer()
                Text("No drivers available for this event.")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding()
                Spacer()
            } else {
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(drivers) { driver in
                            NavigationLink(destination: DriverDetailView(driver: driver)) {
                                DriverRow(driver: driver)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            loadDrivers() // Fetch drivers when the view appears
        }
    }

    private func loadDrivers() {
        fetchDrivers(for: eventID) { result in
            switch result {
            case .success(let fetchedDrivers):
                self.drivers = fetchedDrivers
            case .failure(let error):
                print("Error fetching drivers: \(error.localizedDescription)")
            }
        }
    }

    private func fetchDrivers(for eventID: Int, completion: @escaping (Result<[Driver], Error>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/drivers/\(eventID)") else {
            completion(.failure(URLError(.badURL)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            do {
                let drivers = try JSONDecoder().decode([Driver].self, from: data)
                completion(.success(drivers))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


struct DriverListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DriverListView(eventID: 1) // Test with a dummy event ID
        }
    }
}

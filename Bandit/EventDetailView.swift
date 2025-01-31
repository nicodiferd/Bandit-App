import SwiftUI

struct Ride: Identifiable {
    let id: Int
    let type: String
    let price: Double
    let capacity: Int
}

struct EventDetailView: View {
    let event: Event
    @State private var selectedRide: Ride?
    @State private var rides: [Ride] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Event Info
                VStack(alignment: .leading, spacing: 8) {
                    Text(event.name)
                        .font(.title)
                        .bold()
                    
                    Text(event.date, style: .date)
                        .foregroundColor(.secondary)
                    
                    Text(event.location)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                // Rides Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Available Rides")
                        .font(.title2)
                        .bold()
                    
                    ForEach(rides) { ride in
                        RideCard(
                            ride: ride,
                            isSelected: selectedRide?.id == ride.id,
                            onSelect: { selectedRide = ride }
                        )
                    }
                    
                    Button(action: handleBooking) {
                        Text("Book Ride")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(selectedRide != nil ? Color.blue : Color.gray)
                            .cornerRadius(10)
                    }
                    .disabled(selectedRide == nil)
                }
                .padding()
            }
        }
        .onAppear {
            loadRides()
        }
    }
    
    private func loadRides() {
        rides = [
            Ride(id: 1, type: "Standard", price: 25.0, capacity: 4),
            Ride(id: 2, type: "Premium", price: 40.0, capacity: 6)
        ]
    }
    
    private func handleBooking() {
        guard let ride = selectedRide else { return }
        // Implement booking logic
    }
}

struct RideCard: View {
    let ride: Ride
    let isSelected: Bool
    let onSelect: () -> Void
    
    var body: some View {
        Button(action: onSelect) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(ride.type)
                        .font(.headline)
                    Text("Capacity: \(ride.capacity) passengers")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("$\(ride.price, specifier: "%.2f")")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.blue : Color.gray.opacity(0.3), lineWidth: 2)
            )
        }
    }
} 
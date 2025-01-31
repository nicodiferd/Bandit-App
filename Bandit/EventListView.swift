import SwiftUI

struct Event: Identifiable {
    let id: Int
    let name: String
    let date: Date
    let location: String
    let image: String
}

struct EventListView: View {
    @State private var events: [Event] = []
    @State private var isLoading = true
    
    var body: some View {
        List {
            if isLoading {
                ProgressView("Loading events...")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .listRowSeparator(.hidden)
            } else {
                ForEach(events) { event in
                    NavigationLink(destination: EventDetailView(event: event)) {
                        EventRow(event: event)
                    }
                }
            }
        }
        .navigationTitle("Upcoming Events")
        .onAppear {
            loadEvents()
        }
    }
    
    private func loadEvents() {
        // Simulated API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            events = [
                Event(id: 1, 
                      name: "Summer Music Festival",
                      date: Date().addingTimeInterval(86400 * 30),
                      location: "Central Park",
                      image: "festival"),
                Event(id: 2,
                      name: "Tech Conference 2024",
                      date: Date().addingTimeInterval(86400 * 45),
                      location: "Convention Center",
                      image: "conference")
            ]
            isLoading = false
        }
    }
}

struct EventRow: View {
    let event: Event
    
    var body: some View {
        HStack {
            Image(event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(event.name)
                    .font(.headline)
                Text(event.location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(event.date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
} 
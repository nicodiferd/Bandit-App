//
//  EventPinPageView.swift
//  Bandit
//
//  Created by Nicolo DiFerdinando on 1/18/25.
//
import SwiftUI

struct EventPinPageView: View {
    @State private var eventPin: String = ""
    @State private var isNavigating: Bool = false
    @State private var eventID: Int? = nil // Event ID fetched from backend
    
    var body: some View {
        NavigationStack { // Replace NavigationView with NavigationStack
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    Text("Enter Your Event Pin")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    
                    TextField("Event Pin", text: $eventPin)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                    
                    Button(action: {
                        fetchEventID(for: eventPin) // Fetch event ID based on pin
                    }) {
                        Text("Submit")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                .padding()
            }
            .navigationDestination(isPresented: $isNavigating) {
                DriverListView(eventID: eventID ?? 0)
            }
        }
    }
    
    func fetchEventID(for pin: String) {
        // Simulated backend fetch (replace with actual backend/database call)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.eventID = 1 // Replace with fetched event ID
            self.isNavigating = true
        }
    }
}

struct EventPinPageView_Previews: PreviewProvider {
    static var previews: some View {
        EventPinPageView()
    }
}

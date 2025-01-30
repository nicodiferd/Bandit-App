//
//  Untitled.swift
//  Bandit
//
//  Created by Nicolo DiFerdinando on 1/18/25.
//

import Foundation

struct Driver: Identifiable, Decodable {
    let id: Int
    let eventID: Int
    let name: String
    let carMake: String?
    let carModel: String?
    let photoURL: String
    let latitude: Double?
    let longitude: Double?
    let estimatedWaitTime: Int
    let peopleInLine: Int

    // Map JSON keys to struct properties if they differ
    enum CodingKeys: String, CodingKey {
        case id = "driver_id"
        case eventID = "event_id"
        case name = "driver_name"
        case carMake = "car_make"
        case carModel = "car_model"
        case photoURL = "driver_photo"
        case latitude
        case longitude
        case estimatedWaitTime = "estimated_wait_time"
        case peopleInLine = "people_in_line"
    }
}

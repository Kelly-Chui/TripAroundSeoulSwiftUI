//
//  Landmark.swift
//  TripAroundSeoul
//
//  Created by Kelly Chui on 2022/08/31.
//

import Foundation
import CoreLocation

struct Landmark: Codable, Hashable {
    let serialNumber: Int
    let name: String
    let country: String
    let address: String
    let latitude: Double
    let longitude: Double
}

struct LandmarkAnnotations: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

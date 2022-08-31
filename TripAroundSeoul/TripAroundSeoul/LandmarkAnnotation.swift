//
//  LandmarkAnnotation.swift
//  TripAroundSeoul
//
//  Created by Kelly Chui on 2022/08/31.
//

import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    let serialNumber: Int
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init?(of landmark: Landmark) {
        self.latitude = landmark.latitude
        self.longitude = landmark.longitude
        self.serialNumber = landmark.serialNumber
        self.name = landmark.name
        super.init()
    }
}

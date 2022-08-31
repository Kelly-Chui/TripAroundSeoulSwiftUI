//
//  MainTopView.swift
//  TripAroundSeoul
//
//  Created by Kelly Chui on 2022/08/30.
//

import SwiftUI
import MapKit

struct MainMapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5712, longitude: 126.9843), span: MKCoordinateSpan(latitudeDelta: 0.41, longitudeDelta: 0.41))
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, interactionModes: [], showsUserLocation: true)
                .onAppear {
                    locationManager.checkIfLocationServicesIsEnabled()
                }
            VStack {
                HStack {
                    Spacer()
                    if let location = locationManager.userLocation {
                        if location.latitude >=  37.43 && location.latitude <= 37.7 && location.longitude >= 126.735 && location.longitude <= 127.18 {
                            Text("you are currently in Seoul")
                        } else {
                            Text("you are not currently in Seoul.")
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct MainTopView_Previews: PreviewProvider {
    static var previews: some View {
        MainMapView()
    }
}

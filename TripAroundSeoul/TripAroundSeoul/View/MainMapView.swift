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
                        Text("Your location: \(location.latitude), \(location.longitude)")
                            .padding([.top, .trailing])
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

//최동 37.5552511
//최서 126.9779692
//최남
//최북

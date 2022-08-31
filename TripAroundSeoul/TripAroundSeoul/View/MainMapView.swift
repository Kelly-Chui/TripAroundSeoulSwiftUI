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
    
    let annotations = [
        LandmarkAnnotations(name: "63Square", coordinate: CLLocationCoordinate2D(latitude: 37.519378, longitude: 126.940211)),
        LandmarkAnnotations(name: "LotteWorldTower", coordinate: CLLocationCoordinate2D(latitude: 37.5125, longitude: 127.102778)),
        LandmarkAnnotations(name: "MyeongdongCathedral", coordinate: CLLocationCoordinate2D(latitude: 37.564167, longitude: 126.987306)),
        LandmarkAnnotations(name: "Namdaemun", coordinate: CLLocationCoordinate2D(latitude: 37.559722, longitude: 126.975278)),
        LandmarkAnnotations(name: "NSeoulTower", coordinate: CLLocationCoordinate2D(latitude: 37.551425, longitude: 126.988)),
        LandmarkAnnotations(name: "StarfieldLibrary", coordinate: CLLocationCoordinate2D(latitude: 37.5113169, longitude: 127.0595695))
    ]
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, interactionModes: [.zoom], showsUserLocation: true, annotationItems: annotations) { annotation in
                MapAnnotation(coordinate: annotation.coordinate) {
                    Image(annotation.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .bottom)
                }
            }
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

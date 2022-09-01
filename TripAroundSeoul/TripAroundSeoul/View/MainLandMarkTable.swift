//
//  MainLandMarkTable.swift
//  TripAroundSeoul
//
//  Created by Kelly Chui on 2022/09/01.
//

import SwiftUI
import MapKit

struct MainLandMarkTable: View {

    let annotations = [
        LandmarkAnnotations(name: "63Square", coordinate: CLLocationCoordinate2D(latitude: 37.519378, longitude: 126.940211)),
        LandmarkAnnotations(name: "LotteWorldTower", coordinate: CLLocationCoordinate2D(latitude: 37.5125, longitude: 127.102778)),
        LandmarkAnnotations(name: "MyeongdongCathedral", coordinate: CLLocationCoordinate2D(latitude: 37.564167, longitude: 126.987306)),
        LandmarkAnnotations(name: "Namdaemun", coordinate: CLLocationCoordinate2D(latitude: 37.559722, longitude: 126.975278)),
        LandmarkAnnotations(name: "NSeoulTower", coordinate: CLLocationCoordinate2D(latitude: 37.551425, longitude: 126.988)),
        LandmarkAnnotations(name: "StarfieldLibrary", coordinate: CLLocationCoordinate2D(latitude: 37.5113169, longitude: 127.0595695))
    ]
    
    var body: some View {
        ForEach(annotations) { blocks in
            MainBlockView(name: blocks.name, coordinate: blocks.coordinate, libraryOrCamera: false)
        }
    }
}

struct MainBlockView: View {
    let name: String
    let coordinate: CLLocationCoordinate2D

    @State var changeImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    @State var libraryOrCamera: Bool
    
    var body: some View {
        HStack{
            Image(name)
                .resizable()
                .scaledToFit()
            .frame(width: 40, height: 40)
            Text(name)
            Spacer()
            Button(action: {
                changeImage = true
                openCameraRoll = true
                libraryOrCamera = false
            } ) {
                Image(systemName: "camera.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .sheet(isPresented: $openCameraRoll){
                if libraryOrCamera{
                    ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                }
                else {
                    ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
                }
                
            }
        }
        .padding([.leading, .trailing, .top])
    }
}

struct MainLandMarkTable_Previews: PreviewProvider {
    static var previews: some View {
        MainLandMarkTable()
    }
}

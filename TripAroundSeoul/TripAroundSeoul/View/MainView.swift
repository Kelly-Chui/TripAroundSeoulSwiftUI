//
//  ContentView.swift
//  TripAroundSeoul
//
//  Created by Kelly Chui on 2022/08/30.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        MainMapView()
        MainLandMarkTable()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  MainView.swift
//  Animalia
//
//  Created by MacBook Pro on 29/04/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "square.grid.2x2")
                }
            WatchView()
                .tabItem {
                    Label("Watch", systemImage: "play.rectangle")
                }
            MapView()
                .tabItem {
                    Label("Locations", systemImage: "map")
                }
            Text("Gallery")
                .tabItem {
                    Label("Galler", systemImage: "photo")
                }
        }
    }
}

#Preview {
    MainView()
}

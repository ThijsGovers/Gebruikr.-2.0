//
//  ContentView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 14/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 3
    init() {
        UITabBar.appearance().backgroundColor = UIColor.purple
    }
    
    var body: some View {
        TabView(selection:$selection) {
            NavigationView {
                Text("SwiftUI")
                    .navigationBarTitle("Gebruikr")
            }
             .tabItem {
                Image(systemName: "phone.fill")
                Text("Tracker")
              }.tag(1)
            SliderView()
            .tabItem {
               Image(systemName: "tv.fill")
               Text("Test Services")
             }.tag(2)
            HomeView()
            .tabItem {
                Image(systemName: "house.fill")
               Text("Home")
             }.tag(3)
            Text("The content of the third view")
            .tabItem {
               Image(systemName: "table.fill")
               Text("Drugs info")
             }.tag(4)
            Text("The content of the third view")
            .tabItem {
                Image(systemName: "plus")
               Text("EHBO")
             }.tag(5)
        }
        .accentColor(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

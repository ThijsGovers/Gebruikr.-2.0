//
//  TabBarView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 28/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
     @State private var selection = 3
       init() {
           UITabBar.appearance().backgroundColor = UIColor.systemPink
       }
    
    @State private var isSettingPresented = false
    
    private var settingButton: some View {
        Button(action: {
            self.isSettingPresented = true
        }) {
            HStack {
                Image(systemName: "slider.horizontal.3").imageScale(.medium)
            }.frame(width: 30, height: 30)
        }
    }
       
       var body: some View {
           TabView(selection:$selection) {
               NavigationView {
                   Text("SwiftUI")
                       .navigationBarTitle("Gebruikr")
               }
                .tabItem {
                   Image(systemName: "phone")
                   Text("Tracker")
                 }.tag(1)
               SliderView()
               .tabItem {
                  Image(systemName: "tv")
                  Text("Test Services")
                }.tag(2)
                NavigationView {
                   HomeView().foregroundColor(Color("TextColor"))
                   .navigationBarTitle("Gebruikr", displayMode: .inline).font(.title)
                   .navigationBarItems(trailing:
                       HStack {
                           settingButton
                       }
                    ).sheet(isPresented: $isSettingPresented, content: {SettingsForm()})
                }
               .tabItem {
                   Image(systemName: "house")
                  Text("Home")
                }.tag(3)
               Text("The content of the third view")
               .tabItem {
                  Image(systemName: "table")
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

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

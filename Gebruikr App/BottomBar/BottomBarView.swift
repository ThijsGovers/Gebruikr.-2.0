//
//  ContentView.swift
//  SwiftUITabBat
//
//  Created by Sander Paping on 20/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI


let items: [BottomBarItem] = [
    BottomBarItem(icon: "house.fill", title: "Tracker"),
    BottomBarItem(icon: "heart", title: "Likes"),
    BottomBarItem(icon: "house", title: "Home"),
    BottomBarItem(icon: "person.fill", title: "Drugs"),
    BottomBarItem(icon: "plus", title: "EHBO")
]

struct BottomBarView : View {
    @State private var selectedIndex: Int = 2
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var selectedItem: BottomBarItem {
        items[selectedIndex]
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
        NavigationView {
            VStack {
                
                if (selectedIndex == 0){
                    HomeView()
                    Spacer()
                }else if (selectedIndex == 1){

                    VStack {
                        Spacer()
                        Spacer()
                    }
                }else if (selectedIndex == 2){
                    HomeView()
                }else if (selectedIndex == 3){

                    VStack {
                        Spacer()
                        Spacer()
                    }
                }else if (selectedIndex == 4){

                    VStack {
                        Spacer()
                        Spacer()
                    }
                }
                
                
//                switch selectedIndex {
//                    case 0:
//                        HomeView()
//                    case 1:
//                        HomeView()
//                    case 2:
//                        HomeView()
//                    case 3:
//                        HomeView()
//                    case 4:
//                        HomeView()
//                }
                
                BottomBar(selectedIndex: $selectedIndex, items: items)
                
            }.edgesIgnoringSafeArea(.bottom)
                .foregroundColor(Color("TextColor"))
                .navigationBarTitle("Gebruikr.", displayMode: .inline).navigationBarItems(trailing:
                    HStack {
                        settingButton
                    }
            ).sheet(isPresented: $isSettingPresented, content: {SettingsForm()})
        }
    }
}




struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView()
    }
}

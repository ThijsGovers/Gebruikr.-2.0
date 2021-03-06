//
//  ContentView.swift
//  SwiftUITabBat
//
//  Created by Sander Paping on 20/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI


let items: [BottomBarItem] = [
    BottomBarItem(icon: "test services", title: "Testen"),
    BottomBarItem(icon: "home-unselect", title: "Home"),
    BottomBarItem(icon: "EhboBarIcon", title: "EHBO")
]


struct BottomBarView : View {
    @State private var selectedIndex: Int = 1
    @Environment(\.presentationMode) var presentationMode
    
    var selectedItem: BottomBarItem {
        items[selectedIndex]
    }
    
    @State private var isSettingPresented = false
    
    private var settingButton: some View {
        Button(action: {
            self.isSettingPresented = true
        }) {
            HStack {
                Image(systemName: "slider.horizontal.3").imageScale(.large).foregroundColor(Color("TextColor"))
            }.frame(width: 30, height: 30)
        }
    }
    
    var body: some View {
        VStack {
                if (selectedIndex == 0){
                    TestenView()
                    Spacer()
                }else if (selectedIndex == 1){
                    HomeView()
                }else if (selectedIndex == 2){
                    Spacer()
                    EhboOverzichtView()
                }
                
                BottomBar(selectedIndex: $selectedIndex, items: items)
                
            }.edgesIgnoringSafeArea(.bottom)
                .foregroundColor(Color("TextColor"))
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("Gebruikr.", displayMode: .inline).navigationBarItems(trailing:
                    HStack {
                        settingButton
                    }
            ).sheet(isPresented: $isSettingPresented, content: {SettingsForm()})
    }
}




struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView()
    }
}

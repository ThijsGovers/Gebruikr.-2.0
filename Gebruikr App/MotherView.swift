//
//  MotherView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 28/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct MotherView : View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            if userData.currentPage == "OnboardingView" {
                OnboardingView()
            } else if userData.currentPage == "BottomBarView" {
                BottomBarView()
            }
        }.accentColor(Color("TextColor"))
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(UserData())
    }
}

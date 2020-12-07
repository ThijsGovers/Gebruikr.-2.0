//
//  ContentView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 14/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MotherView()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}

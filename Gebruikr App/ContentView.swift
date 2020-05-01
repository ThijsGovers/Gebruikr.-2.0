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
        BottomBarView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

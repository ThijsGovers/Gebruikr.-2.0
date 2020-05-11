//
//  InformationOverview.swift
//  Gebruikr App
//
//  Created by Sander Paping on 06/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct InformationOverview: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("Second View")) {
                Text("Hello, World!")
            }
            .navigationBarTitle("Navigation")
        }
    }
}

struct InformationOverview_Previews: PreviewProvider {
    static var previews: some View {
        InformationOverview()
    }
}

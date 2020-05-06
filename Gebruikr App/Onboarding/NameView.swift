//
//  NameView.swift
//  Gebruikr gegevens
//
//  Created by Thijs Govers on 22/04/2020.
//  Copyright © 2020 Thijs Govers. All rights reserved.
//

import SwiftUI

struct NameView: View {
    @State var gebruikrName: String = ""
   
    var body: some View {
        VStack {
            Spacer(minLength: 150)
            Text("Hi! Ik ben Gebruikr.").font(.headline)
            Text("Mag ik jouw naam?").font(.headline).padding(.bottom, 35)
            TextField("Nickname...", text: $gebruikrName).padding().textFieldStyle(RoundedBorderTextFieldStyle()).shadow(radius: 5)
            Spacer()
        }.padding()
    }
}




struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}


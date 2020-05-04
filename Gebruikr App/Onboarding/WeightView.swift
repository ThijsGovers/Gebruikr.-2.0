//
//  WeightView.swift
//  Gebruikr gegevens
//
//  Created by Thijs Govers on 22/04/2020.
//  Copyright © 2020 Thijs Govers. All rights reserved.
//

import SwiftUI

struct WeightView: View {
    @State private var weight: Double = 60
    var body: some View {
        
    
        
            VStack{
                Spacer(minLength: 150)
                Text("Wat is je gewicht?").padding(30).font(.title)
        
                Slider(value: $weight, in: 40...150, step: 1).padding(.horizontal,30)
                Text("\(weight, specifier: "%.0f") kg").font(.title)
                Spacer()
            }.foregroundColor(Color.blue)
        
        }
    
    }


struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
    }
}

//
//  MdmaView.swift
//  mdmaView
//
//  Created by Thijs Govers on 11/05/2020.
//  Copyright © 2020 Thijs Govers. All rights reserved.
//

import SwiftUI

struct MdmaView: View {
    @State var gebruikrName: String = ""
    
    var body: some View {
        VStack{
            Spacer(minLength: 150)
            
            Text("Heb je je pil getest?").font(.headline)
            Button(action: {
                
            }) {
                Text("Ja")
                
            Button(action: {
                
            }) {
                Text("Nee")
            
            
            Spacer()
            
            Text("Niet getest? Volgende keer wel even doen!").font(.callout)
            Button(action: {
                
            }) {
                Text("Overslaan").font(.headline)
            }.padding(.bottom)
            
        
        }
    }
}

struct MdmaView_Previews: PreviewProvider {
    static var previews: some View {
        MdmaView()
    }
}


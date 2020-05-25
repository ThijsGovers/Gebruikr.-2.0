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
            Text("Hoeveel MDMA zit er in je pil?").font(.headline)
            
            TextField("Nickname...", text: $gebruikrName).padding().textFieldStyle(RoundedBorderTextFieldStyle()).shadow(radius: 2)
            
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


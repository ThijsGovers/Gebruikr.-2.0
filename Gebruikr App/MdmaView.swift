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
            Text("Hoeveel MDMA zit er in je pil?")
            
            TextField("Nickname...", text: $gebruikrName)
            
            HStack{
            
            Button(action: {
                
            }){
                
                VStack{
                    Image("manIcoon")
                }.frame(width: 70, height: 30).cornerRadius(20)
            }
            }
        }
    }
}

struct MdmaView_Previews: PreviewProvider {
    static var previews: some View {
        MdmaView()
    }
}


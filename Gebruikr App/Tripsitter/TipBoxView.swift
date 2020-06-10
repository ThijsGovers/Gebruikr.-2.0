//
//  TipBoxView.swift
//  LandingPage
//
//  Created by Reamon Hoefakker on 04/06/2020.
//  Copyright © 2020 Reamon Hoefakker. All rights reserved.
//

import SwiftUI

struct TipBoxView: View {
    var header: String
    var image: String
    var paragraph: String
    var body: some View {
        VStack{
            

            VStack {
                HStack {
                    Image(image)
                    Text(header).font(.title)
                }.frame(width: 325, alignment: .leading)
                
                Text(paragraph)
                    
                
            }.frame(width: 325, alignment: .leading).padding()
                .background(Color("BackgroundPillsUsed"))
                .cornerRadius(10)
                Spacer()
                    .frame(height: 10)

            
            
        }
    }
}

struct TipBoxView_Previews: PreviewProvider {
    static var previews: some View {
        TipBoxView(header: "header", image: "image", paragraph: "paragraph")
    }
}

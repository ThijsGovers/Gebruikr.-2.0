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
            

            VStack {
                HStack {
                    Image(image).resizable()
                        .frame(
                            minWidth: 0,
                            maxWidth: 50,
                            minHeight: 0,
                            maxHeight: 50)
                        .padding()
                    VStack(alignment: .leading) {
                        Text(header).font(.title)
                        Text(paragraph)
                    }.padding()
                
                    
                
            }
        }
            .frame(width: 340, alignment: .leading)
            .overlay(
            RoundedRectangle(cornerRadius: 10)
            .stroke(Color("MainColor"), lineWidth: 2)
            ).padding()

    }
}

struct TipBoxView_Previews: PreviewProvider {
    static var previews: some View {
        TipBoxView(header: "header", image: "image", paragraph: "paragraph")
    }
}

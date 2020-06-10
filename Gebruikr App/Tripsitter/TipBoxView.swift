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
            

            VStack(alignment: .leading) {
                HStack {
                    Image(image)
                    Text(header).font(.title)
                }
                
                Text(paragraph)
                    .frame(width: 340, height: nil, alignment: .leading)
                
            }.frame(width: 360, height: 120)
                .background(Color("BackgroundPillsUsed"))
                .cornerRadius(5)
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

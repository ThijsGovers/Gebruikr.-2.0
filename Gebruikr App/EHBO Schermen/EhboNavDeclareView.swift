//
//  EhboNavDeclareView.swift
//  Gebruikr App
//
//  Created by Reamon Hoefakker on 22/01/2021.
//  Copyright © 2021 Sander Paping. All rights reserved.
//

import SwiftUI

struct EhboNavDeclareView: View {
    var image: String
    var header: String
    var paragraph: String
    var body: some View {
        ZStack{
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Image(image)
                    .frame(width: 20, height: nil, alignment: .leading)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(header).font(.title)
                    Text(paragraph)
                }.foregroundColor(.white)
                .padding()
                
            }.frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: nil
            ).background(Color("systemGray6"))
            .border(Color("MainColor"), width: 4)
            .cornerRadius(10)
            .padding()
            
        }
    }
}

struct EhboNavDeclareView_Previews: PreviewProvider {
    static var previews: some View {
        EhboNavDeclareView(image: "image", header: "header", paragraph: "paragraph").environment(\.colorScheme, .dark)
    }
}

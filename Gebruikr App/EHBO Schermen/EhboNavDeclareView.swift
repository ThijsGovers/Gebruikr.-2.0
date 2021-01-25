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
            
            HStack {
                Image(image)
                    .frame(width: nil, height: nil, alignment: .leading)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(header).font(.title)
                        .frame(minHeight: nil,
                               maxHeight: nil)
                    
                    Text(paragraph)
                }.foregroundColor(.white)
                .padding()
                
            }.frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: nil
            ).overlay(
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color("MainColor"), lineWidth: 2)
            )
            
    }
}

struct EhboNavDeclareView_Previews: PreviewProvider {
    static var previews: some View {
        EhboNavDeclareView(image: "image", header: "header", paragraph: "paragraph").environment(\.colorScheme, .dark)
    }
}

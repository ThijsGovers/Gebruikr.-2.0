//
//  ExplanationSectionView.swift
//  LandingPage
//
//  Created by Reamon Hoefakker on 27/05/2020.
//  Copyright © 2020 Reamon Hoefakker. All rights reserved.
//

import SwiftUI

struct ExplanationSectionView: View {
    var header: String
    var paragraph: String
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text (header)
                .font(.headline)
                .frame(width: 350, height: nil, alignment: .topLeading).foregroundColor(Color("TextColor"))
                
            Text(paragraph)
                .frame(width: 350, height: nil, alignment: .topLeading).foregroundColor(Color("TextColor"))
                }.padding()
    }
}

struct ExplanationTitleView: View {
    var title: String
    var body: some View {
        
        VStack {
        Text (title)
        .font(.largeTitle).lineLimit(nil).foregroundColor(Color("TextColor"))
        .frame(width: 350, height: 90, alignment: .leading)
        Spacer ()
            .frame(height: 10)
            
        }
    }
}



struct ExplanationSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationSectionView(header: "header", paragraph: "paragraph")
    }
}

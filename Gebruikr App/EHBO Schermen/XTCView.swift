//
//  XTCView.swift
//  Gebruikr App
//
//  Created by Thijs Govers on 26/01/2021.
//  Copyright © 2021 Sander Paping. All rights reserved.
//

import SwiftUI

struct XTCView: View {
    var body: some View {
        ZStack {
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
            VStack{
            HStack{
                Text("XTC").font(.title).padding(.horizontal, 30)
                Spacer()
                Image("XTCicon").padding(.horizontal, 30).padding(.vertical)
            }.overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("MainColor"), lineWidth: 2))
                
                VStack (alignment: .leading) {
                    Text("Wat is XTC?").font(.title)
                    
                    Text("XTC komt voor in pil-, poeder- en kristalvorm. De werkzame stof in XTC is MDMA. Deze stof behoort tot de chemische groep van amfetaminen. ")
                    
                    Text("XTC wordt vaak als partydrug gebruikt door de effecten die een gevoel van saamhorigheid en openheid veroorzaken en tegelijk een oppeppend gevoel geeft.")
                }
                
            }
        }
}
}

struct XTCView_Previews: PreviewProvider {
    static var previews: some View {
        XTCView().environment(\.colorScheme, .dark)
    }
}

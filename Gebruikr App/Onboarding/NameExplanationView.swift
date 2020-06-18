//
//  NameExplanationView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 10/06/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct NameExplanationView: View {
    var body: some View {
         VStack {
                       //Op dit scherm is nog niet de ToV toegepast.
                               
                   ExplanationTitleView (title: "Waarom wilt Gebruikr. mijn Naam weten?")
                       
                   ExplanationSectionView (header: "Wat gebeurd er met wat jij invult?", paragraph: "Gebruikr. vind het leuk om jou persoonlijk aan te spreken. Je hoeft hiervoor niet je echte naam in te vullen, maar kies een toffe nickname.")
                        
                   Spacer()
                               
                   VStack {
                       Text("Swipe Down!!")
                       Image(systemName: "arrow.down")
                           .font(.system(size: 40.0))
                   }.foregroundColor(Color("TextColor"))
                           


               }.frame(width: 360, height: nil)
    }
}

struct NameExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        NameExplanationView()
    }
}

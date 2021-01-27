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
        ZStack{
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
             VStack {
                           //Op dit scherm is nog niet de ToV toegepast.
                
                Spacer(minLength: 20)
                
                VStack {
                Text ("Waarom wilt ") +
                Text ("Gebruikr. ").foregroundColor(Color("MainColor"))
                    
                Text ("mijn ") +
                Text ("naam ").foregroundColor(Color("MainColor")) +
                Text ("weten?")
                }.font(.largeTitle).padding(.vertical)
                           
               ExplanationSectionView (header: "Wat gebeurd er met wat jij invult?", paragraph: "Gebruikr. vind het leuk om jou persoonlijk aan te kunnen spreken. Je hoeft hiervoor natuurlijk niet je echte naam in te vullen, maar kies een toffe nickname!")
                            
               Spacer()
                           
                ZStack {
                    VStack {
                    Text("Swipe!").font(.largeTitle)
                    Spacer().frame(height: 0)
                    Image("SwipeDownIcon").resizable().frame(width: 60, height: 60)
                    }
                }.foregroundColor(Color("MainColor"))
                .padding()
                       


           }.frame(width: 360, height: nil)
        }
    }
}

struct NameExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        NameExplanationView().environment(\.colorScheme, .dark)
    }
}

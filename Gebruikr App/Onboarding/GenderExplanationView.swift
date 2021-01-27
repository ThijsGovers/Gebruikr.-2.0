//
//  GenderExplanationView.swift
//  LandingPage
//
//  Created by Reamon Hoefakker on 25/05/2020.
//  Copyright © 2020 Reamon Hoefakker. All rights reserved.
//

import SwiftUI

struct GenderExplanationView: View {
    var body: some View {
        ZStack{
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Spacer(minLength: 20)
                
                VStack {
                Text ("Waarom wilt ") +
                Text ("Gebruikr. ").foregroundColor(Color("MainColor"))
                    
                Text ("mijn ") +
                Text ("geslacht ").foregroundColor(Color("MainColor")) +
                Text ("weten?")
                }.font(.largeTitle)
                
                ScrollView {
                    ExplanationSectionView (header: "Wat gebeurd er met wat jij invult?", paragraph: "Gebruikr. slaat het geslacht wat door jou wordt ingevuld lokaal op. Hierdoor heb alleen jij toegang tot deze gegevens. Verder zal dit gebruikt worden om berekeningen te maken.")
                    
                    ExplanationSectionView (header: "Waar is het geslacht voor in deze berekening?", paragraph: "Gemiddeld hebben vrouwen minder bloed in hun lichaam dan mannen, waardoor er voor hen een lagere dosis wordt geadviseerd. Dit zorgt er dan voor dat er veilig advies kan worden gegeven met de hoeveelheid van de werkzame stof per liter bloed. Daarom is het belangrijk dat jij je geslacht invult. Mocht je dit niet willen dan zal de berekening gedaan worden alsof je een vrouw bent, om veiligheid te waarborgen. ")
                }
                
                
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

struct GenderExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        GenderExplanationView()
    }
}

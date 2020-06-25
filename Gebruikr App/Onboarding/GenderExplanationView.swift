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
        VStack {
            ExplanationTitleView (title: "Waarom wilt Gebruikr. jouw geslacht weten?")
            
            ExplanationSectionView (header: "Wat gebeurd er met wat jij invult?", paragraph: "Gebruikr. slaat het geslacht wat door jou wordt ingevuld lokaal op. Hierdoor heb alleen jij toegang tot deze gegevens. Verder zal dit gebruikt worden om berekeningen te maken.")
            
            ExplanationSectionView (header: "Waar is het geslacht voor in deze berekening?", paragraph: "Gemiddeld hebben vrouwen minder bloed in hun lichaam dan mannen, waardoor er voor hen een lagere dosis wordt geadviseerd. Dit zorgt er dan voor dat er veilig advies kan worden gegeven met de hoeveelheid van een werkzame stof per liter bloed. Daarom is het belangrijk dat je je biologische geslacht invuld. Mocht je dit niet willen dan zal de berekening gedaan worden alsof je een vrouw bent, om veiligheid te waarborgen. ")
            
            
            Spacer()
                        
            VStack {
                Text("Swipe Down!!")
                Image(systemName: "arrow.down")
                    .font(.system(size: 40.0))
            }.foregroundColor(Color("TextColor"))
        }.frame(width: 360, height: nil)
    }
}

struct GenderExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        GenderExplanationView()
    }
}

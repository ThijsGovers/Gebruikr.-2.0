//
//  WeightExplanationView.swift
//  LandingPage
//
//  Created by Reamon Hoefakker on 25/05/2020.
//  Copyright © 2020 Reamon Hoefakker. All rights reserved.
//

import SwiftUI

struct WeightExplanationView: View {
    var body: some View {
        VStack {
            Spacer(minLength: 100)
                //Op dit scherm is nog niet de ToV toegepast.
                        
            ExplanationTitleView (title: "Waarom wilt Gebruikr. mijn gewicht weten?")
                
            ExplanationSectionView (header: "Wat gebeurd er met wat jij invult?", paragraph: "Gebruikr. slaat het gewicht wat door jou wordt ingevuld lokaal op. Hierdoor heb alleen jij toegang tot deze gegevens. Verder zal dit gebruikt worden om berekeningen te maken.")
                        
            ExplanationSectionView (header: "Waar zijn deze berekeningen voor?", paragraph: "Met deze berekeningen kan Gebruikr. persoonlijk advies geven over hoe je zo veilig mogelijk met een bepaalde drugs om kan gaan, ook tijdens het gebruik zelf. Zie het als een tripzitter op je smartphone.")
            
            ExplanationSectionView (header: "Tripzitter op je smartphone?", paragraph: "Yep, tripzitter op je smartphone. Als jij voor de eerste keer XTC gaat gebruiken op een festival, kan Gebruikr. jou vertellen welke hoeveelheden van bepaalde drugs veilig zijn voor jou. Dat alles door alleen even je gewicht in te vullen!")
            
            Spacer()
                        
            VStack {
                Text("Swipe Down!!")
                Image(systemName: "arrow.down")
                    .font(.system(size: 40.0))
            }.foregroundColor(Color("TextColor"))
                    


        }
    }
}


struct WeightExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        WeightExplanationView()
    }
}

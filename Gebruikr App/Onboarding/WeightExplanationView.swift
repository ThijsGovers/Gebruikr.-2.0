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
        ZStack{
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer(minLength: 20)
                
                VStack {
                Text ("Waarom wilt ") +
                Text ("Gebruikr. ").foregroundColor(Color("MainColor"))
                    
                Text ("mijn ") +
                Text ("gewicht ").foregroundColor(Color("MainColor")) +
                Text ("weten?")
                }.font(.largeTitle)
                    
                    
                
                
                    //Op dit scherm is nog niet de ToV toegepast.
                ScrollView {
                        
                    ExplanationSectionView (header: "Wat gebeurd er met wat jij invult?", paragraph: "Gebruikr. slaat het gewicht wat door jou wordt ingevuld lokaal op. Hierdoor heb alleen jij toegang tot deze gegevens. Verder zal dit gebruikt worden om berekeningen te maken.")
                                
                    ExplanationSectionView (header: "Waar zijn deze berekeningen voor?", paragraph: "Met deze berekeningen kan Gebruikr. persoonlijk advies geven over hoe je zo veilig mogelijk met een bepaalde drugs om kan gaan, ook tijdens het gebruik zelf. Zie het als een tripzitter op je smartphone.")
                    
                    ExplanationSectionView (header: "Tripzitter op je smartphone?", paragraph: "Yep, tripzitter op je smartphone. Als jij voor de eerste keer XTC gaat gebruiken op een festival, kan Gebruikr. jou vertellen welke hoeveelheden van bepaalde drugs veilig zijn voor jou. Dat alles door alleen even je gewicht in te vullen!")
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
                    

            }
        }
    }
}


struct WeightExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        WeightExplanationView().environment(\.colorScheme, .dark)
    }
}

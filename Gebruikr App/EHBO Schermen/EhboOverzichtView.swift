//
//  EhboOverzichtView.swift
//  Gebruikr App
//
//  Created by Reamon Hoefakker on 22/01/2021.
//  Copyright © 2021 Sander Paping. All rights reserved.
//

import SwiftUI

struct EhboOverzichtView: View {
    var body: some View {
        ZStack {
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
            

            VStack {
                
                NavigationLink(destination: EhboTipsView()) {
                    EhboNavDeclareView(image: "Ehboicon", header: "EHBO Tips", paragraph: "Check hier wat je kunt doen wanneer jij iemand niet helemaal lekker gaat.")
                }
                
                NavigationLink(destination: EhboTipsView()) {
                    EhboNavDeclareView(image: "Drugsinfoicon", header: "Drugs Info", paragraph: "Check hier de werking, effecten en risico's van verschillende drugs!")
                }
                
                
                NavigationLink(destination: EhboTipsView()) {
                    EhboNavDeclareView(image: "Voorzorgicon", header: "Voorzorg Tips", paragraph: "Check hier hoe jij je het beste kunt voorbereiden op een trip!")
                }
                
                
                NavigationLink(destination: EhboTipsView()) {
                    EhboNavDeclareView(image: "Nazorgicon", header: "Nazorg Tips", paragraph: "Check hier hoe jij beter door je dinsdagdip heen komt!")
                }
                
                Spacer()

            
            
            }
        }
    }
}

struct EhboOverzichtView_Previews: PreviewProvider {
    static var previews: some View {
        EhboOverzichtView().environment(\.colorScheme, .dark)
    }
}

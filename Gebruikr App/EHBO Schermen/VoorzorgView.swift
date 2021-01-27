//
//  VoorzorgView.swift
//  Gebruikr App
//
//  Created by Roos Kempen on 25/01/2021.
//  Copyright © 2021 Sander Paping. All rights reserved.
//

import SwiftUI

struct VoorzorgView: View {
    var body: some View {
        ZStack {
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
            

            VStack {
                
                NavigationLink(destination: EhboOverzichtView()) {
                    EhboNavDeclareView(image: "Voorzorgicon", header: "Voorzorg Tips", paragraph: "Check hier hoe jij je het beste kunt voorbereiden op een trip!")
                }
                ScrollView{
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Snelle checklist").font(.headline).foregroundColor(.white) .padding(.bottom, 7)
                            Text("""
                            - 250 gram groenten
                            - 2 stuks fruit
                            - 1,2 gram eiwit per kg lichaamsgewicht
                            - 75 mg vitamine C (max 1000mg)
                            - 250mg magnesium
                            - 3 gr zout

                            Aanrader!
                            50 gram pompoenpitten! In pompoenpitten zit magnesium, eiwitten, tryptofaan, fenylalanine en vitamine E (antioxidanten). Wel bij de voeding die je normaal binnen krijgt natuurlijk.

                            Check hieronder voor meer informatie.
                            """).multilineTextAlignment(.leading).padding(.bottom)
                        }.padding(.horizontal).foregroundColor(.white)
                        
                    }.padding(.vertical, 10.0) .background(Color("DarkGray")).cornerRadius(10).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom))).padding(.bottom)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Een gezonde voeding!").font(.headline).foregroundColor(.white) .padding(.bottom,7)

                            Text("""
                            Tijdens het gebruik van XTC, waarvan de werkende stof MDMA is, zal er in de hersenen extra serotonine, noradrenaline en dopamine worden afgeven. Met langdurig gebruik van XTC zullen de waardes van deze stoffen worden uitgeput. Je wordt niet alleen in de hersenen uitgeput maar bij de rest van het lichaam gebeurt het ook. Een gezonde voeding zal alle voedingswaardes op peil houden. Waardoor je niet alle supplement hoeft bij te nemen als jij aan de XTC gaat.

                            Wat moet ik dan eten?
                            - 250 gram groente op een dag.
                            - Minimaal 2 stuks fruit op een dag.
                            - Elke dag 1 van de volgende vis, peulvruchten, vlees en ei.
                            - Brood, graanproducten en aardappelen.
                            - Dagelijks zuivel of een zuivelvervanger.
                            - Gemiddeld 1,5 tot 2 liter per dag.
                            """)
                                .multilineTextAlignment(.leading).padding(.bottom)
                        }.padding(.horizontal).foregroundColor(.white)
                        
                    }.padding(.vertical, 10.0) .background(Color("DarkGray")).cornerRadius(10).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom))).padding(.bottom)
                
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Een gezonde voeding!").font(.headline).foregroundColor(.white) .padding(.bottom,7)

                            Text("""
                            - Eiwitten
                            Het is vooral belangrijk om minimaal 0,8 gram eiwit       per kilogram lichaamsgewicht. Voor de sporters onder ons kan dit 1,2 tot 2 gram met kilogram lichaamsgewicht zijn.

                            - Vitamine C (antioxidanten)
                            Zorg ervoor dat je minimaal 75mg vitamine c binnenkrijgt. Je kan tot 1000 mg vitamine c innemen. Je hebt vitamine c in tabletten, bruistabletten en poedervorm.

                            - Magnesiumcitraat
                            Je mag tot 250mg magnesium binnenkrijgen. Neem geen magnesiumoxide want dat neemt je lichaam minder goed op.

                            - Zouten
                            Probeer 3 gram zout binnen te krijgen. Tijdens feestjes kan het helpen een zoutoplossing in je water te doen of een sportdrank te drinken met isotonen.

                            - Omega-3
                            Omega-3 kan helpen bij het beschermen van de hersencellen. Het is wel belangrijk dat je dit extra neemt de dagen VOOR het feest en niet na. Je kan het pas nemen 72 uur nadat de XTC is uitgewerkt. Omega-3 heeft een omgekeerd effect als je het tijdens of vlak na neemt.
                            """)
                                .multilineTextAlignment(.leading).padding(.bottom)
                        }.padding(.horizontal).foregroundColor(.white)
                        
                    }.padding(.vertical, 10.0) .background(Color("DarkGray")).cornerRadius(10).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                }
            }
        }
    }
}
struct VoorzorgView_Previews: PreviewProvider {
    static var previews: some View {
        VoorzorgView().environment(\.colorScheme, .dark)
    }
}

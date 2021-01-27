//
//  NazorgView.swift
//  Gebruikr App
//
//  Created by Roos Kempen on 25/01/2021.
//  Copyright © 2021 Sander Paping. All rights reserved.
//

import SwiftUI

struct NazorgView: View {
    var body: some View {
        ZStack {
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
            

            VStack {
                
                NavigationLink(destination: EhboOverzichtView()) {
                    EhboNavDeclareView(image: "Nazorgicon", header: "Nazorg Tips", paragraph: "Check hier hoe jij beter door je dinsdagdip heen komt!")
                }
                ScrollView{
                HStack {
                    VStack(alignment: .leading) {
                        Text("Neem genoeg rust").font(.headline).foregroundColor(.white) .padding(.bottom, 7)
                        Text("""
                        Je hebt een hele dag/nacht gefeest. Het lichaam heeft veel stress ondervonden. Pak daarom lekker veel rust na een feestje. Door de extra afgifte van de serotonine, dopamine en noradrenaline zijn jouw geluk stofjes behoorlijk gedaald in de waardes. Het kan daarom zo zijn dat jij je wat minder blij voelt. Dat is niet erg het hoort erbij. Als het echt te depri wordt voor je ga dan naar vrienden of ga iets anders leuks doen. De afleiding kan je er een beetje doorheen sleuren. Verder blijft het gewoon belangrijk om die gezonde voeding op peil te houden. Dus door een gezonde voeding en genoeg slaap herstel je sneller en ben je minder lang depri.

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

                        - Fenylalanine en tryptofaan
                        Fenylalanine en tryptofaan zijn grondstoffen voor serotonine, dopamine en noradrenaline. Het supplement om tryptofaan extra binnen te krijgen is L-tryptofaan. Voor fenylalanine is het supplement L-fenylalanine handig. Neem deze supplementen pas 24 uur nadat het is uitgewerkt.

                        - Vitamine C (antioxidanten)
                        Zorg ervoor dat je minimaal 75mg vitamine c binnenkrijgt. Je kan tot 1000 mg vitamine c innemen. Je hebt vitamine c in tabletten, bruistabletten en poedervorm.

                        - Magnesiumcitraat
                        Je mag tot 250mg magnesium binnenkrijgen. Neem geen magnesiumoxide want dat neemt je lichaam minder goed op.

                        - Zouten
                        Probeer 3 gram zout binnen te krijgen. Tijdens feestjes kan het helpen een zoutoplossing in je water te doen of een sportdrank te drinken met isotonen.
                        """)
                            .multilineTextAlignment(.leading).padding(.bottom)
                    }.padding(.horizontal).foregroundColor(.white)
                    
                }.padding(.vertical, 10.0) .background(Color("DarkGray")).cornerRadius(10).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom))).padding(.bottom)
            }
        }
    }
}
}
struct NazorgView_Previews: PreviewProvider {
    static var previews: some View {
        NazorgView().environment(\.colorScheme, .dark)
    }
}

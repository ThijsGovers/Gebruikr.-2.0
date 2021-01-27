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
        ScrollView{
            VStack (alignment: .leading) {
                Text("Wat is XTC?").font(.title)
                
                Text("XTC komt voor in pil-, poeder- en kristalvorm. De werkzame stof in XTC is MDMA. Deze stof behoort tot de chemische groep van amfetaminen. ").padding(.vertical)
                
                Text("XTC wordt vaak als partydrug gebruikt door de effecten die een gevoel van saamhorigheid en openheid veroorzaken en tegelijk een oppeppend gevoel geeft.").padding(.vertical)
            }.padding().background(Color("DarkGray")).cornerRadius(10).padding(.bottom)
            
            VStack (alignment: .leading) {
                Text("Dosering").font(.title)
                
                Text("Gebruik niet meer dan 1 - 1.5mg MDMA per kg lichaamsgewicht.").padding(.vertical)
                
                Text("Wil je weten hoeveel mg MDMA er in jouw pil zit? Laat deze dan testen bij een Drugs Test punt.").padding(.vertical)
            }.padding().background(Color("DarkGray")).cornerRadius(10).padding(.bottom)
                
                VStack (alignment: .leading) {
                    
                    Text("Effecten").font(.title)
                    
                    Text("De effecten van XTC begin je ongeveer te voelen na 30 - 60 minuten en houden tot 4 uur aan.").padding(.vertical)
                    
                    Text("Gewenste effecten").fontWeight(.bold).padding(.vertical)
                    HStack{
                        VStack (alignment: .leading) {
                        Text("- Energiek")
                        Text("- Blij, verliefd gevoel")
                        Text("- Veel praten")
                        Text("- Minder geremd")
                        }
                        
                        Spacer()
                        
                        VStack (alignment: .leading) {
                        Text("- Opgaan in muziek")
                        Text("- Uren lang dansen")
                        Text("- Knuffelig voelen")
                        Text("- Gevoel van zweven")
                        }
                    }
                
                    Text("Ongewenste effecten").fontWeight(.bold).padding(.vertical)
                    HStack{
                        VStack (alignment: .leading) {
                        Text("- Misselijkheid")
                        Text("- Tandenknarsen")
                        Text("- Niet kunnen plassen")
                        Text("- Geen eetlust")
                        }
                        
                        Spacer()
                        
                        VStack (alignment: .leading) {
                        Text("- Hartkloppingen")
                        Text("- Zweten")
                        Text("- Onrust")
                        Text("- Angst of paniek")
                        }
                    
                    }
                }.padding().background(Color("DarkGray")).cornerRadius(10).padding(.bottom)
            
                VStack (alignment: .leading) {
                    Text("Werking").font(.title)
                    
                    Text("De werking van XTC hangt af van de hoeveelheid en de plek waar het gebruikt wordt. Hiernaast verschilt het per persoon en per keer hoeveel en wat je van XTC voelt.").padding(.vertical)
                    
                    Text("De ene keer kan je veel energie ervaren en de andere keer juist een zwaar gevoel in je benen. Bij frequent gebruik zonder er lange tijd tussen te laten zal je minder het ‘verliefde’ gevoel ervaren en meer het oppeppende.").padding(.vertical)
                    
                    Text("Je kunt bij XTC gebruik ook hallucinerende effecten ervaren. Veel voorkomende effecten zijn onder andere: statafels, stoelen, en dranghekken. Je zou ook andere voorwerpen kunnen zien die er in werkelijkheid helemaal niet zijn.").padding(.vertical)
                    
                }.padding().background(Color("DarkGray")).cornerRadius(10)
            
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

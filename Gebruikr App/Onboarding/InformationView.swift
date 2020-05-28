//
//  InformationView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 06/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct InformationView: View {
    @Binding public var step: Int
    
    private var nextButton: some View {
        NavigationLink(destination: InfoExplanationView(step: $step)){
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
        }.navigationBarTitle("Gebruikr.", displayMode: .inline)
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text("Hi!").font(.largeTitle)
                Text("Nice dat je er bent").font(.title)
                Text("Gebruikr gaat je helpen om elk feestje lekker te gaan").font(.headline)
                Text("Dit kan je van Gebruikr. verwachten:").font(.headline).padding(.bottom, 30)
            }
            HStack {
                Image("Tripsitter")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 70, height: 70)
                    .background(Color.backgroundColor).cornerRadius(10)
                VStack(alignment: .leading) {
                    Text("Jouw mobiele tripsitter").font(.headline)
                    Text("Krijg tips en zie wat en hoe laat je op een feestje gebruikt!").font(.caption).padding(.bottom)
                }.padding(.horizontal)
                
            }.padding().frame(width: 345, height: 100).background(Color.white).cornerRadius(10).shadow(radius: 5)
            
            HStack {
                Image("Dosering")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 70, height: 70)
                    .background(Color.backgroundColor).cornerRadius(10)
                VStack(alignment: .leading) {
                    Text("Doseringen").font(.headline)
                    Text("Kom precies te weten wat de beste dosering voor jou is.").font(.caption).padding(.bottom)
                }.padding(.horizontal)
                
            }.padding().frame(width: 345, height: 100).background(Color.white).cornerRadius(10).shadow(radius: 5)
            
            HStack {
                Image("Inzicht")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 70, height: 70)
                    .background(Color.backgroundColor).cornerRadius(10)
                VStack(alignment: .leading) {
                    Text("Inzicht in je gebruik").font(.headline)
                    Text("Bekijk welke dagen je hoeveel hebt gebruikt.").font(.caption).padding(.bottom)
                }.padding(.horizontal)
                
            }.padding().frame(width: 345, height: 100).background(Color.white).cornerRadius(10).shadow(radius: 5)
            Spacer()
            nextButton
        }.padding()
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(step: .constant(0))
    }
}

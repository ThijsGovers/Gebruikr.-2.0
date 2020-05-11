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
        NavigationLink(destination: NameView(step: $step)){
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
        }
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
                    .frame(width: 80, height: 80)
                    .background(Color.backgroundColor).cornerRadius(10)
                VStack(alignment: .leading) {
                    Text("Test je Drugs").font(.headline)
                    Text("Laat je drugs al vast testen bij één van de vele test punten").font(.subheadline).padding(.bottom)
                }.padding(.horizontal)
                
            }.padding().frame(height: 100).background(Color.white).cornerRadius(10).shadow(radius: 5)
            
            HStack {
                Image("Dosering")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 80, height: 80)
                    .background(Color.backgroundColor).cornerRadius(10)
                VStack(alignment: .leading) {
                    Text("Test je Drugs").font(.headline)
                    Text("Laat je drugs al vast testen bij één van de vele test punten").font(.subheadline).padding(.bottom)
                }.padding(.horizontal)
                
            }.padding().frame(height: 100).background(Color.white).cornerRadius(10).shadow(radius: 5)
            
            HStack {
                Image("Inzicht")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 80, height: 80)
                    .background(Color.backgroundColor).cornerRadius(10)
                VStack(alignment: .leading) {
                    Text("Test je Drugs").font(.headline)
                    Text("Laat je drugs al vast testen bij één van de vele test punten").font(.subheadline).padding(.bottom)
                }.padding(.horizontal)
                
            }.padding().frame(height: 100).background(Color.white).cornerRadius(10).shadow(radius: 5)
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

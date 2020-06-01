//
//  InformationView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 06/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct InformationView: View {
    @ObservedObject var userData : UserData = UserData()
    @Binding public var step: Int
    @State var resetCounter : Bool = false
    
    private var nextButton: some View {
        NavigationLink(destination: InfoExplanationView(step: $step), isActive: $resetCounter){
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor)).onTapGesture {
                // Execute code here.
                self.userData.timeCount = 8
                self.resetCounter = true
            }
        }.navigationBarTitle("Gebruikr.", displayMode: .inline)
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                if userData.timeCount > 0{
                    Text("Hi!").font(.largeTitle).frame(width: 345, alignment: .leading).padding(.bottom).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                }
                if userData.timeCount > 1{
                    Text("Nice dat je er bent").font(.title).padding(.bottom).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                }
                if userData.timeCount > 2{
                    Text("Gebruikr gaat je helpen om elk feestje lekker te gaan").font(.headline).padding(.bottom).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                }
                if userData.timeCount > 3{
                    Text("Dit kan je van Gebruikr. verwachten:").font(.headline).padding(.bottom, 30).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                }
            }
            if userData.timeCount > 4{
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
                    
                }.padding().frame(width: 345, height: 100).background(Color("BackgroundGray")).cornerRadius(10).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
            }
            if userData.timeCount > 5{
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
                    
                }.padding().frame(width: 345, height: 100).background(Color("BackgroundGray")).cornerRadius(10).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
            }
            if userData.timeCount > 6{
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
                    
                }.padding().frame(width: 345, height: 100).background(Color("BackgroundGray")).cornerRadius(10).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
            }
            Spacer()
            if userData.timeCount > 7{
                nextButton.transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
            }
        }.animation(.default).padding()
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(step: .constant(0))
    }
}

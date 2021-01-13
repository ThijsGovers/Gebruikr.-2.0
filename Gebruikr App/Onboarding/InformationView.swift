//
//  InformationView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 06/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct InformationView: View {
    @ObservedObject var timerData : TimerData = TimerData()
    @Binding public var step: Int
    @State var resetCounter : Bool = false
    
    private var nextButton: some View {
        NavigationLink(destination: InfoExplanationView(step: $step).environmentObject(timerData), isActive: $resetCounter){
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor)).onTapGesture {
                // Execute code here.
                self.timerData.timeCount = 8
                self.resetCounter = true
            }
        }
    }
    
    var body: some View {
        VStack {
            VStack{
                if timerData.timeCount > 0{
                    Text("Hi!").font(.largeTitle).foregroundColor(Color("MainColor")).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                }
                if timerData.timeCount > 1{
                    Text("Nice dat je er bent").font(.title).foregroundColor(.white).padding(.bottom).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                }
                if timerData.timeCount > 2{
                    Text("Gebruikr gaat je helpen om elk feestje lekker te gaan").font(.headline).foregroundColor(.white).padding(.bottom).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                }
                if timerData.timeCount > 3{
                    Text("Dit kan je van Gebruikr. verwachten:").font(.headline).foregroundColor(.white).padding(.bottom, 30).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                }
            }
            if timerData.timeCount > 4{
                HStack {
                    Image("Tripsitter")
                        .foregroundColor(Color("DarkGray"))
                        .font(.largeTitle)
                        .frame(width: 70, height: 70)
                        .background(Color("DarkGray")).cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text("Jouw mobiele tripsitter").font(.headline).foregroundColor(.white)
                        Text("Krijg tips en zie wat en hoe laat je op een feestje gebruikt.").font(.caption).padding(.bottom).foregroundColor(.white)
                    }.padding(.horizontal)
                    
                }.padding().frame(width: 345, height: 100).background(Color("DarkGray")).cornerRadius(10).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
            }
            if timerData.timeCount > 5{
                HStack {
                    Image("Dosering")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                        .background(Color("DarkGray")).cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text("Doseringen").font(.headline).foregroundColor(.white)
                        Text("Kom precies te weten wat de beste dosering voor jou is.").font(.caption).padding(.bottom)
                    }.padding(.horizontal).foregroundColor(.white)
                    
                }.padding(10).background(Color("DarkGray")).cornerRadius(10).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
            }
            if timerData.timeCount > 6{
                HStack {
                    Image("Inzicht")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(width: 70, height: 70)
                        .background(Color("DarkGray")).cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text("Info & EHBO").font(.headline).foregroundColor(.white)
                        Text("Kennis over iedere stof en inzicht in het herkennen van mogelijke bijwerkingen.").font(.caption).padding(.bottom).foregroundColor(.white)
                    }.padding(.horizontal)
                    
                }.padding().frame(width: 345, height: 100).background(Color("DarkGray")).cornerRadius(10).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
            }
            Spacer()
            if timerData.timeCount > 7{
                nextButton.transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
            }
        }.navigationBarTitle("").navigationBarBackButtonHidden(true).animation(.default).padding()
    }
}

struct InformationView_Previews: PreviewProvider {
    
    static var previews: some View {
        InformationView(step: .constant(0)).environment(\.colorScheme, .dark)
    }
}

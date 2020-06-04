//
//  ContentView.swift
//  Gebruikr
//
//  Created by Raymond van Dongelen on 15/04/2020.
//  Copyright © 2020 Raymond van Dongelen. All rights reserved.
//

import SwiftUI

struct MdmaInput: View {
    
    var body: some View {
        MdmaWizard()
    }
}

struct MdmaWizard : View {
    @ObservedObject var userData : UserData = UserData()
    
    @State var step : Int = 0
    @State var mdmInMG : String = ""
    @State var piltested = false
    
    func mdmaScreen () -> AnyView {
        switch (userData.mdma) {
        case .unspecified: return AnyView (
            VStack {
                Text ("Heb je je pil getest?").font(.title).padding(.bottom).foregroundColor(Color("TextColor"))
                
                VStack{
                    
                    HStack{
                        Button(action: {
                            self.piltested = true
                            //self.userData.mdma = .specified(amountInMG: Int (self.mdmInMG)!) // <--dit is riskant
                        }){
                            if piltested == true{
                                Text("Ja!").font(.title).foregroundColor(Color.white).frame(width:100, height: 50).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 3)
                            }
                            else{
                                Text("Ja!").font(.title).foregroundColor(Color("TextColor")).frame(width:100, height: 50).background(Color.white).cornerRadius(10).shadow(radius: 3)
                            }
                        }
                        
                        
                        Button(action: {
                            self.userData.mdma = .unknown
                        }) {
                            Text("Nee").font(.title).foregroundColor(Color("TextColor")).frame(width:100, height: 50).background(Color.white).cornerRadius(10).shadow(radius: 3).padding()
                        }
                    }
                }.padding(.bottom, 50)
                
                
                if piltested{
                    VStack{
                        Text("Hoeveel milligram MDMA zit er in je pil?").font(.title).foregroundColor(Color("TextColor")).padding(.horizontal)
                        TextField ("", text: $mdmInMG).padding().textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad).shadow(radius: 1).frame(width: 250)
                        Button(action: {
                            self.userData.mdma = .specified(amountInMG: Double (self.mdmInMG)!) // <--dit is riskant
                        }) {
                            Text("Invoeren").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
                        }
                        
                    }
                    Spacer()
                } else {
                    Spacer()
                }
            }.padding(.top, 50)
            )
        case .unknown: return AnyView (
            VStack{
                Spacer()
                VStack(alignment: .leading){
                    Text ("Pill niet getest!").font(.title)
                }.frame(width: 345)
                Spacer()
                VStack{
                    VStack(alignment: .leading){
                        Text ("Gemiddelde hoeveelheid").font(.title).padding(.bottom)
                        
                        Text ("Omdat je niet weet hoeveel er in je pil zit zal Gebruikr. uit gaan van een gemiddelde hoeveelheid van \(userData.mdma.amountInMg)mg MDMA per pil.").padding(.bottom)
                        
                        Text ("Je pil kan in werkelijkheid meer MDMA bevatten, dus pas altijd op!")
                    }.padding()
                }.frame(width: 345).background(Color("BackgroundGray")).cornerRadius(10)
                
                Spacer().frame(height: 20)
                VStack{
                    VStack(alignment: .leading){
                        Text("Volgende keer even").font(.title)
                        Text("laten testen!").font(.title).padding(.bottom)
                        
                        
                        Text("Dan weet je precies hoe veel mg MDMA er in je pil zit en kan Gebruikr. je beter helpen.")
                    }.padding()
                }.frame(width: 345).background(Color("BackgroundGray")).cornerRadius(10)
                Spacer()
                NavigationLink(destination: useAmountView()){
                    Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
                }
            }.foregroundColor(Color("TextColor"))
            )
            
        case .specified( _): return AnyView (
            VStack{
                Text("De hoeveelheid mdma in de pil is \(userData.mdma.amountInMg)").foregroundColor(Color("TextColor")).font(.title).padding()
                if(userData.mdma.amountInMg > 180){
                    Text("Let op dit is een zware pill").font(.title).foregroundColor(.red)
                }
                NavigationLink(destination: useAmountView()){
                    Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
                }.padding(.top, 50)
                Spacer()
            }.padding(.top, 50)
            )
        }
    }
    
    var body : some View {
        VStack {
            mdmaScreen()
            
        }.navigationBarTitle("Tripsitter", displayMode: .inline).foregroundColor(Color("TextColor"))
    }
}

struct MdmaInput_Previews: PreviewProvider {
    static var previews: some View {
        MdmaInput()
    }
}



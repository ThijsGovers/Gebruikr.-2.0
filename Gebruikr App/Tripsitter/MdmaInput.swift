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
    @EnvironmentObject var userData: UserData
    
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
                        }){
                            if piltested == true{
                                Text("Ja!").font(.title).foregroundColor(Color.black).frame(width:100, height: 50).background(Color.backgroundColor).cornerRadius(10)
                            }
                            else{
                                Text("Ja!").font(.title).foregroundColor(Color.black).frame(width:100, height: 50).background(Color("MainColor")).cornerRadius(10)
                            }
                        }
                        
                        
                        Button(action: {
                            self.piltested = false
                            self.userData.mdma = .unknown
                        }) {
                            Text("Nee").font(.title).foregroundColor(Color.black).frame(width:100, height: 50).background(Color("MainColor")).cornerRadius(10).padding()
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
                        }.disabled(mdmInMG.isEmpty)
                        
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
                    Text ("Pil niet getest!").font(.title)
                }.frame(width: 345)
                Spacer()
                VStack{
                    VStack(alignment: .leading){
                        Text ("Gemiddelde hoeveelheid").font(.title).padding(.bottom)
                        
                        Text ("Omdat je niet weet hoeveel er in je pil zit zal Gebruikr. uit gaan van een gemiddelde hoeveelheid van \(userData.mdma.amountInMg, specifier: "%.0f") mg MDMA per pil.").padding(.bottom)
                        
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
                NavigationLink(destination: useAmountView().navigationBarTitle("Tripsitter", displayMode: .inline)){
                    Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
                }
            }.foregroundColor(Color("TextColor"))
            )
            
        case .specified( _): return AnyView (
            VStack{
                Text("De hoeveelheid mdma in de pil is \(userData.mdma.amountInMg, specifier: "%.0f") mg").foregroundColor(Color("TextColor")).font(.title).padding()
                if(userData.mdma.amountInMg > 220){
                    Text("Let op dit is een zware pill").font(.title).foregroundColor(.red)
                }
                NavigationLink(destination: useAmountView().navigationBarTitle("Tripsitter", displayMode: .inline)){
                    Text("Volgende").foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
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
        MdmaInput().environmentObject(UserData())
    }
}



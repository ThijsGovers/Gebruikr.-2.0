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
        ZStack {
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
            MdmaWizard()
        }
    }
}

struct MdmaWizard : View {
    @EnvironmentObject var userData: UserData
    
    @State var step : Int = 0
    @State var mdmInMG : String = ""
    @State var piltested = false
    
    
    var unknownscreen : some View {
        VStack{
            Spacer()
            VStack{
                Text ("Pil niet getest!").font(.title)
            }.padding(.horizontal)
            Spacer()
            VStack{
                VStack{
                    Text ("Gemiddelde hoeveelheid").font(.title).padding(.bottom)
                    
                    VStack (alignment: .leading){
                        Text ("Omdat je niet weet hoeveel er in je pil zit zal Gebruikr. uit gaan van een gemiddelde hoeveelheid van \(userData.mdma.amountInMg, specifier: "%.0f") mg MDMA per pil.").padding()
                        
                        Text ("Je pil kan in werkelijkheid meer MDMA bevatten, dus pas altijd op!").padding()
                    }
                    .background(Color("DarkGray")).cornerRadius(10)
                }.padding()
            }.frame(width: 345)
            
            Spacer().frame(height: 20)
            VStack{
                Text("Volgende keer even").font(.title)
                Text("laten testen!").font(.title)
                VStack{
                    Text("Dan weet je precies hoeveel mg MDMA er in je pil zit en kan Gebruikr. je beter helpen.").padding().background(Color("DarkGray")).cornerRadius(10)
                }.padding()
            }.frame(width: 345)
            Spacer()
            NavigationLink(destination: useAmountView().navigationBarTitle("Tripsitter", displayMode: .inline)){
                Text("Volgende").foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
            }
        }.foregroundColor(Color("TextColor"))
    }
    
    var unspecifiedscreen : some View {
        VStack(alignment: .center){
            
            Text ("Heb je je pil laten testen?").font(.title).padding(.bottom).foregroundColor(Color("TextColor"))
            Text ("Dit vragen we om te checken hoevel miligram MDMA er in de pil zit").padding(.horizontal)
            
            VStack(alignment: .center){
                
                HStack{
                    Button(action: {
                        self.piltested = true
                    }){
                        if piltested == true{
                            Text("Ja!").font(.body).foregroundColor(Color.black).frame(width:100, height: 50).background(Color("MainColor")).cornerRadius(20)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color("MainColor"), lineWidth: 3)).padding()
                        }
                        else{
                            Text("Ja!").font(.body).foregroundColor(Color.white).frame(width:100, height: 50)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("MainColor"), lineWidth: 2)).padding()
                        }
                    }
                    
                    
                    Button(action: {
                        self.piltested = false
                        self.userData.mdma = .unknown
                    }) {
                        Text("Nee").font(.body).foregroundColor(Color.white).frame(width:100, height: 50)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("MainColor"), lineWidth: 2))
                    }
                }.padding()
            }.frame(width: nil, height: nil, alignment: .bottom)
            .padding(.bottom, 50)
            
            
            if piltested{
                VStack{
                    Text("Hoeveel milligram MDMA zit er in je pil?").font(.title).foregroundColor(Color("TextColor")).padding(.horizontal)
                    TextField ("", text: $mdmInMG).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad).frame(width: 250).overlay(
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("MainColor"), lineWidth: 2)
                )
                    Button(action: {
                        self.userData.mdma = .specified(amountInMG: Double (self.mdmInMG)!) // <--dit is riskant
                    }) {
                        Text("Invoeren").foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
                    }.disabled(mdmInMG.isEmpty)
                    
                }
                Spacer()
            } else {
                Spacer()
            }
        }.padding(.top, 50)
    }
    
    var specifiedscreen: some View {
        VStack{
            Text("De hoeveelheid mdma in de pil is \(userData.mdma.amountInMg, specifier: "%.0f") mg").foregroundColor(Color("TextColor")).font(.title).padding()
            if(userData.mdma.amountInMg > 220){
                Text("Let op dit is een zware pill").font(.title).foregroundColor(.red)
            }
            Spacer()
            Spacer()
            Spacer()
            NavigationLink(destination: useAmountView().navigationBarTitle("Tripsitter", displayMode: .inline)){
                Text("Volgende").foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
            }.padding(.top, 50)
            Spacer()
        }.padding(.top, 50)
    }
    
    var body : some View {
        VStack {
            switch (userData.mdma) {
            case .unspecified: unspecifiedscreen
            
            case .unknown: unknownscreen
                
            case .specified( _): specifiedscreen
            }
            
        }.navigationBarTitle("Tripsitter", displayMode: .inline).foregroundColor(Color("TextColor"))
    }
}

struct MdmaInput_Previews: PreviewProvider {
    static var previews: some View {
        MdmaInput().environmentObject(UserData()).environment(\.colorScheme, .dark)
    }
}

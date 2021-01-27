//
//  EhboTipsView.swift
//  Gebruikr App
//
//  Created by Reamon Hoefakker on 22/01/2021.
//  Copyright © 2021 Sander Paping. All rights reserved.
//

import SwiftUI

struct EhboTipsView: View {
    var body: some View {
        ZStack {
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
           
            VStack {
                NavigationLink(destination: EhboOverzichtView()) {
                    EhboNavDeclareView(image: "Ehboicon", header: "EHBO tips", paragraph: "Check hier wat je kan doen wanneer jij of iemand anders niet helemaal lekker gaat!")
                }
                
                VStack{
                    Text("Wees niet bang de EHBO'ers om hulp te vragen.").padding(.top).padding(.horizontal, 20)
                    Text("Zij zijn er altijd om je te helpen!").padding(.bottom)
                }.background(Color("DarkGray")).cornerRadius(10).padding(.vertical)
            
                VStack{
                    HStack{
                       Spacer()
                        VStack{
                            Image("Tehardicon").padding(.horizontal, 48).padding(.vertical)
                            Text("Te hard gaan").padding().padding(.horizontal).overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("MainColor"), lineWidth: 2))
                        }.overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MainColor"), lineWidth: 2))
                      
                    Spacer()
                       
                        VStack{
                            Image("Bewusteloosicon").padding(.vertical, 32)
                            Text("Bewusteloosheid").padding().overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("MainColor"), lineWidth: 2))
                        }.overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MainColor"), lineWidth: 2))
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        VStack{
                            Image("Oververhittingicon").padding(.horizontal, 48).padding(.vertical)
                            Text("Oververhitting").padding(.horizontal, 27).padding(.vertical).overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("MainColor"), lineWidth: 2))
                        }.overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MainColor"), lineWidth: 2))
                        
                        Spacer()
                        
                        VStack{
                            Image("Onderkoelingicon").padding(.horizontal, 48).padding(.vertical)
                            Text("Oververhitting").padding(.horizontal, 27).padding(.vertical).overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("MainColor"), lineWidth: 2))
                        }.overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MainColor"), lineWidth: 2))
                        Spacer()
                    }
                    
                    HStack{
                        
                        HStack{
                            Spacer()
                            VStack{
                                Image("Paranoideicon").padding(.vertical, 20).padding(.horizontal, 31)
                                Text("Paranoide psychose").padding(.vertical).padding(.horizontal, 4).overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("MainColor"), lineWidth: 2))
                            }.overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("MainColor"), lineWidth: 2))
                            
                        Spacer()
                            
                            VStack{
                                Image("Epileptischicon").padding(.vertical, 36).padding(.horizontal, 22)
                                Text("Epileptische aanval").padding(.vertical).padding(.horizontal, 8).overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("MainColor"), lineWidth: 2))
                            }.overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("MainColor"), lineWidth: 2))
                        Spacer()
                        }
                    }
                }
            }
    }
}
}

struct EhboTipsView_Previews: PreviewProvider {
    static var previews: some View {
        EhboTipsView().environment(\.colorScheme, .dark)
    }
}

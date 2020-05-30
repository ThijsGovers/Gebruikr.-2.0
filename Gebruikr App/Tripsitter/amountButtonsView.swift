//
//  amountButtonsView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 30/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

enum Parts {
    case full, threeQuarters, half, quarter, unspecified
}

struct amountButtonsView: View {
    @State var partsAmount : Parts = .unspecified
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Hoeveel Ga je gebruiken?").font(.title).foregroundColor(Color("TextColor")).padding(.bottom)
            HStack{
                Button(action: {
                    self.partsAmount = .full
                }){
                    if partsAmount == .full{
                        VStack{
                            Image("HeleSelected").resizable()
                            .frame(width: 39.0, height: 39.0).foregroundColor(Color.white)
                            Divider().background(Color.white).padding(.horizontal)
                            Text("Hele").foregroundColor(Color.white)
                            
                        }.frame(width: 80, height: 90).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                    } else {
                        VStack{
                            Image("Hele").resizable()
                            .frame(width: 39.0, height: 39.0).foregroundColor(Color("TextColor"))
                            
                            Divider().padding(.horizontal)
                            Text("Hele").foregroundColor(Color("TextColor"))
                        }.frame(width: 80, height: 90).background(Color.white).cornerRadius(10).shadow(radius: 2)
                    }
                    
                }.buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {
                    self.partsAmount = .threeQuarters
                }){
                    if partsAmount == .threeQuarters{
                        VStack{
                            Image("DrieKwartSelected").resizable()
                            .frame(width: 39.0, height: 39.0).foregroundColor(Color.white)
                            Divider().background(Color.white).padding(.horizontal)
                            Text("3/4").foregroundColor(Color.white)
                            
                        }.frame(width: 80, height: 90).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                    } else {
                        VStack{
                            Image("DrieKwart").resizable()
                            .frame(width: 39.0, height: 39.0).foregroundColor(Color("TextColor"))
                            
                            Divider().padding(.horizontal)
                            Text("3/4").foregroundColor(Color("TextColor"))
                        }.frame(width: 80, height: 90).background(Color.white).cornerRadius(10).shadow(radius: 2)
                    }
                    
                }.buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    self.partsAmount = .half
                }){
                    if partsAmount == .half{
                        VStack{
                            Image("HalfSelected").resizable()
                            .frame(width: 39.0, height: 39.0).foregroundColor(Color.white)
                            Divider().background(Color.white).padding(.horizontal)
                            Text("Halfje").foregroundColor(Color.white)
                            
                        }.frame(width: 80, height: 90).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                    } else {
                        VStack{
                            Image("Half").resizable()
                            .frame(width: 39.0, height: 39.0).foregroundColor(Color("TextColor"))
                            
                            Divider().padding(.horizontal)
                            Text("Halfje").foregroundColor(Color("TextColor"))
                        }.frame(width: 80, height: 90).background(Color.white).cornerRadius(10).shadow(radius: 2)
                    }
                    
                }.buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    self.partsAmount = .quarter
                }){
                    if partsAmount == .quarter{
                        VStack{
                            Image("KwartSelected").resizable()
                            .frame(width: 39.0, height: 39.0).foregroundColor(Color.white)
                            Divider().background(Color.white).padding(.horizontal)
                            Text("Kwartje").foregroundColor(Color.white)
                            
                        }.frame(width: 80, height: 90).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                    } else {
                        VStack{
                            Image("Kwart").resizable()
                            .frame(width: 39.0, height: 39.0).foregroundColor(Color("TextColor"))
                            
                            Divider().padding(.horizontal)
                            Text("Kwartje").foregroundColor(Color("TextColor"))
                        }.frame(width: 80, height: 90).background(Color.white).cornerRadius(10).shadow(radius: 2)
                    }
                    
                }.buttonStyle(PlainButtonStyle())
                
                
            }
        }.frame(width: 325)
    }
}

struct amountButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        amountButtonsView()
    }
}

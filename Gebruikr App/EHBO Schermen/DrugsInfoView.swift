//
//  DrugsInfoView.swift
//  Gebruikr App
//
//  Created by Thijs Govers on 26/01/2021.
//  Copyright © 2021 Sander Paping. All rights reserved.
//

import SwiftUI

struct DrugsInfoView: View {
    var body: some View {
        ZStack {
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
            EhboNavDeclareView(image: "Drugsinfoicon", header: "Drugs Info", paragraph: "Check hier de werking, effecten en risico's van verschillende drugs!")
            
            
                ScrollView{
                HStack{
                    Text("XTC").font(.title).padding(.horizontal, 30)
                    Spacer()
                    Image("XTCicon").padding(.horizontal, 30).padding(.vertical)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("MainColor"), lineWidth: 2)).padding(.horizontal).padding(.bottom, 1)
                
                HStack{
                    Text("MDMA").font(.title).padding(.horizontal, 30)
                    Spacer()
                    Image("XTCicon").padding(.horizontal, 30).padding(.vertical)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("MainColor"), lineWidth: 2)).padding(.horizontal).padding(.bottom, 1)
                
                HStack{
                    Text("SPEED").font(.title).padding(.horizontal, 30)
                    Spacer()
                    Image("SPEEDicon").padding(.horizontal, 30).padding(.vertical)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("MainColor"), lineWidth: 2)).padding(.horizontal).padding(.bottom, 1)
                
                HStack{
                    Text("COCAINE").font(.title).padding(.horizontal, 30)
                    Spacer()
                    Image("COCAicon").padding(.horizontal, 30).padding(.vertical)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("MainColor"), lineWidth: 2)).padding(.horizontal).padding(.bottom, 1)
                
                HStack{
                    Text("4-FA").font(.title).padding(.horizontal, 30)
                    Spacer()
                    Image("4FAicon").padding(.horizontal, 30).padding(.vertical)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("MainColor"), lineWidth: 2)).padding(.horizontal).padding(.bottom, 1)
                
                HStack{
                    Text("Ketamine").font(.title).padding(.horizontal, 30)
                    Spacer()
                    Image("Ketaicon").padding(.horizontal, 30).padding(.vertical)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("MainColor"), lineWidth: 2)).padding(.horizontal).padding(.bottom, 1)
                
                HStack{
                    Text("GHB").font(.title).padding(.horizontal, 30)
                    Spacer()
                    Image("GHBicon").padding(.horizontal, 30).padding(.vertical)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("MainColor"), lineWidth: 2)).padding(.horizontal).padding(.bottom, 1)
                
                HStack{
                    Text("2C-B").font(.title).padding(.horizontal, 30)
                    Spacer()
                    Image("2CBicon").padding(.horizontal, 30).padding(.vertical)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("MainColor"), lineWidth: 2)).padding(.horizontal).padding(.bottom, 1)
                }
            }
        }
}
}

struct DrugsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DrugsInfoView().environment(\.colorScheme, .dark)
    }
}

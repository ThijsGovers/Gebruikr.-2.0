//
//  InformationOverview.swift
//  Gebruikr App
//
//  Created by Sander Paping on 06/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct InformationOverview: View {
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) var presentationMode
    
    
    @Binding public var step: Int
    
    private var completeButton: some View {
        NavigationLink(destination: AcceptNotificationView()){
            Text("Yes!").frame(width: 70).foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
        }
    }
    
    var body: some View {
        
        ZStack{
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
        
        VStack{
            Spacer()
                .frame(height: 40)
            VStack {
                Text("Top!")
                Spacer()
                    .frame(height: 20)
                
                Text("Nog ff ") +
                Text("checken").foregroundColor(Color("MainColor")) +
                Text("?")
            }.font(.title)
            Spacer()
            Text("Tap hier als je toch iets wilt aanpassen:").font(.caption)
                .foregroundColor(Color("TextColor"))
            
            
            NavigationLink(destination: NameView(step: $step)){
                
                VStack{
                    Image("NameIcon").resizable()
                        .frame(width: 70.0, height: 70).padding(.top).foregroundColor(Color("MainColor"))
                        .padding(.top, 15)
                    Spacer()
                    Divider().background(Color("MainColor")).padding(.horizontal)
                    
                    Text("\(userData.username)").frame(
                        minWidth: 0,
                        maxWidth: 280).padding(.bottom, 25)
                }.frame(width: 300, height: 120)
                        .overlay(
                        RoundedRectangle(cornerRadius:10)
                            .stroke(Color("MainColor"), lineWidth: 2))
                    }.padding(.bottom, 15)
            
            HStack{
                Spacer()
                
                NavigationLink(destination: GenderView(step: $step)){
                    VStack{
                        Image("gender").resizable()
                            .frame(width: 90, height: 62.5).padding(.top, 15)
                        Spacer()
                        Divider().background(Color("MainColor")).padding(.horizontal)
                        
                        if userData.gender == "Man"{
                            Text("Man").frame(width: 80).foregroundColor(Color.white).padding(.bottom, 5)
                        } else if userData.gender == "Vrouw" {
                            Text("Vrouw").frame(width: 80).foregroundColor(Color.white).padding(.bottom, 5)
                        } else {
                            Text("n.v.t.").frame(width: 80).foregroundColor(Color.white).padding(.bottom, 5)
                        }
                    }.frame(width: 120, height: 120)
                    .overlay(
                        RoundedRectangle(cornerRadius:10)
                        .stroke(Color("MainColor"), lineWidth: 2))
                    
                }
                
                Spacer()
                
                NavigationLink(destination: WeightView(step: $step)){
                    VStack{
                        Image("weight").resizable()
                            .frame(width: 52.5, height: 52.5).padding(.top, 15)
                        Spacer()
                        Divider().background(Color("MainColor")).padding(.horizontal)
                        
                        Text("\(userData.weight, specifier: "%.0f") KG").frame(width: 80).foregroundColor(Color.white).padding(.bottom, 5)
                    }.frame(width: 120, height: 120)
                    .overlay(
                    RoundedRectangle(cornerRadius:10)
                    .stroke(Color("MainColor"), lineWidth: 2))
                }
                
                
                Spacer()
                
                
              
            }
            Spacer()
            completeButton
        }.navigationBarTitle("").navigationBarBackButtonHidden(true)
    }
}

struct InformationOverview_Previews: PreviewProvider {
    static var previews: some View {
        InformationOverview(step: .constant(6)).environmentObject(UserData()).environment(\.colorScheme, .dark)
    }
}
}

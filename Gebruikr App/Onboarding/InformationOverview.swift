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
        //        Button(action: {
        ////            BottomBarView()
        //
        //        }) {
        //            Text("Yes!").frame(width: 70).foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
        //        }
        
        
        NavigationLink(destination: BottomBarView()){
            Text("Yes!").frame(width: 70).foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
        }
    }
    
    var body: some View {
        VStack{
            Spacer()
            VStack {
                Text("Top!")
                Text("Klopt dit allemaal?")
            }.font(.title)
                .foregroundColor(Color("TextColor"))
            Spacer()
            Text("Tap hier als je toch iets wilt aanpassen:").font(.caption)
                .foregroundColor(Color("TextColor"))
            
            
            NavigationLink(destination: NameView(step: $step)){
                
                VStack{
                    Image(systemName: "person.fill").resizable()
                        .frame(width: 35.0, height: 35.0).padding(.top)
                    Spacer()
                    Text("\(userData.username)").frame(width: 240).foregroundColor(Color.white).background(Color.backgroundColor)
                }.frame(width: 240, height: 80).background(Color.white).cornerRadius(10).shadow(radius: 5)
                    .foregroundColor(Color("TextColor"))
            }.padding(.bottom, 15)
            HStack{
                
                
                Spacer()
                
                NavigationLink(destination: WeightView(step: $step)){
                    VStack{
                        Image("weight").resizable()
                            .frame(width: 35.0, height: 35.0).padding(.top)
                        Spacer()
                        Text("\(userData.weight, specifier: "%.0f") KG").frame(width: 80).foregroundColor(Color.white).background(Color.backgroundColor)
                    }.frame(width: 80, height: 80).background(Color.white).cornerRadius(10).shadow(radius: 5)
                }.foregroundColor(Color("TextColor"))
                
                
                Spacer()
                
                NavigationLink(destination: GenderView(step: $step)){
                    VStack{
                        Image("gender").resizable()
                            .frame(width: 50.0, height: 35.0).padding(.top)
                        Spacer()
                        if userData.gender == "Man"{
                            Text("MAN").frame(width: 80).foregroundColor(Color.white).background(Color.backgroundColor)
                        } else if userData.gender == "Vrouw" {
                            Text("Vrouw").frame(width: 80).foregroundColor(Color.white).background(Color.backgroundColor)
                        } else {
                            Text("n.v.t.").frame(width: 80).foregroundColor(Color.white).background(Color.backgroundColor)
                        }
                    }.frame(width: 80, height: 80).background(Color.white).cornerRadius(10).shadow(radius: 5).foregroundColor(Color("TextColor"))
                    
                }
                Spacer()
            }
            Spacer()
            completeButton
            Spacer()
        }.navigationBarBackButtonHidden(true)
    }
}

struct InformationOverview_Previews: PreviewProvider {
    static var previews: some View {
        InformationOverview(step: .constant(6)).environmentObject(UserData())
    }
}

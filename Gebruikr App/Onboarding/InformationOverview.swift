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
    
    @Binding public var step: Int
    
    private var completeButton: some View {
        NavigationLink(destination: ContentView()){
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
            Spacer()
            Text("Tap hier als je toch iets wilt aanpassen:").font(.caption)
            HStack{
                Spacer()
                
                NavigationLink(destination: NameView(step: $step)){
                    
                    VStack{
                        Image("masculine-1").resizable()
                            .frame(width: 35.0, height: 35.0).padding(.top)
                        Spacer()
                        Text("\(userData.gebruikrName)").frame(width: 80).foregroundColor(Color.white).background(Color.backgroundColor)
                    }.frame(width: 80, height: 80).background(Color.white).cornerRadius(10).shadow(radius: 5)
                }
                
                Spacer()
                
                NavigationLink(destination: WeightView(step: $step)){
                    VStack{
                        Image("weight").resizable()
                            .frame(width: 35.0, height: 35.0).padding(.top)
                        Spacer()
                        Text("\(userData.weight, specifier: "%.0f") KG").frame(width: 80).foregroundColor(Color.white).background(Color.backgroundColor)
                    }.frame(width: 80, height: 80).background(Color.white).cornerRadius(10).shadow(radius: 5)
                }
                
                
                Spacer()
                
                NavigationLink(destination: GenderView(step: $step)){
                    VStack{
                        Image("gender").resizable()
                            .frame(width: 50.0, height: 35.0).padding(.top)
                        Spacer()
                        if userData.gender == .male{
                            Text("MAN").frame(width: 80).foregroundColor(Color.white).background(Color.backgroundColor)
                        } else if userData.gender == .female {
                            Text("Vrouw").frame(width: 80).foregroundColor(Color.white).background(Color.backgroundColor)
                        } else {
                            Text("n.v.t.").frame(width: 80).foregroundColor(Color.white).background(Color.backgroundColor)
                        }
                    }.frame(width: 80, height: 80).background(Color.white).cornerRadius(10).shadow(radius: 5)
                    
                }
                Spacer()
            }
            Spacer()
            completeButton
            Spacer()
        }
    }
}

struct InformationOverview_Previews: PreviewProvider {
    static var previews: some View {
        InformationOverview(step: .constant(4)).environmentObject(UserData())
    }
}

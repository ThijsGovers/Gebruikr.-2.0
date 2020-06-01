//
//  PillAdvice.swift
//  Gebruikr App
//
//  Created by Sander Paping on 26/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct PillAdvice: View {
    
    @ObservedObject var userData : UserData = UserData()
    
//    init() {
//        userData.calculatePillAdvice()
//    }
    
    var body: some View {
        VStack {
            Text("Max gebruik!").font(.title)
            HStack{
                Spacer()
                Image("NogNietGebruikt").resizable()
                .frame(width: 39.0, height: 39.0)
                Spacer()
                VStack(alignment: .leading){
                    Text("Nog Niks ")
                    Text("gebruikt")
                }
                Divider().background(Color("TextColor")).frame(height: 50)
                Image("Kwart").resizable()
                .frame(width: 39.0, height: 39.0)
                Spacer()
                Text("\(userData.maxMg, specifier: "%.0f") mg").font(.headline)
                Spacer()
            }.frame(width: 325, height:70).background(Color("BackgroundGray")).cornerRadius(10).shadow(radius: 2)
            
//            if (userData.mdma.amountInMg > Int(userData.maxMg)){
//                VStack{
//                    Text("lol")
//                }
//            }
            Spacer()
            NavigationLink(destination: StartTripView()){
                Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
            }.padding(.top, 50)
        }.foregroundColor(Color("TextColor"))
//            .onAppear{self.userData.calculatePillAdvice()}
        
    }
}

struct PillAdvice_Previews: PreviewProvider {
    static var previews: some View {
        PillAdvice()
    }
}

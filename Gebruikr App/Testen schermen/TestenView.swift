//
//  TestenView.swift
//  Gebruikr App
//
//  Created by Thijs Govers on 27/01/2021.
//  Copyright © 2021 Sander Paping. All rights reserved.
//

import SwiftUI

struct TestenView: View {
    var body: some View {
        ZStack {
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
        VStack{
        EhboNavDeclareView(image: "Testicon", header: "Test Services", paragraph: "Check informatie over het testen van je drugs en waar je dit kan laten doen.")
    
            VStack(alignment: .leading){
                Text("Hoe werkt dat testen?").font(.title)
                
                Text("Hoe cool is het dat we in Nederland onze drugs gewoon kunnen laten testen? Privacy wordt bij test services erg serieus genomen en zal dus altijd anoniem verlopen.").padding(.vertical)
                
                Text("Lees meer.").padding(.vertical)
            }.padding().background(Color("DarkGray")).cornerRadius(10)
        
            VStack{
                Text("Bekende test services").font(.title)
                
                HStack{
                    Text("Jellinek").padding().overlay(
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("MainColor"), lineWidth: 2))
                    Spacer()
                    Text("GGD").padding().overlay(
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("MainColor"), lineWidth: 2))
                    Spacer()
                    Text("VNN").padding().overlay(
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("MainColor"), lineWidth: 2))
                }.padding(.horizontal).padding(.bottom)
            
                Text("Zoek een Test Service").font(.title).padding(.horizontal)
                Text("bij jou in de buurt:").font(.title).padding(.horizontal)
            
                //Hier moet nog een textfield komen voor de api
            
                Text("Zoek op postcode of stad")
            }
        
        }
        }
}
}

struct TestenView_Previews: PreviewProvider {
    static var previews: some View {
        TestenView().environment(\.colorScheme, .dark)
    }
}

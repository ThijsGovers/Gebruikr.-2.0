//
//  HomeView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 20/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var backgroundColor = LinearGradient(gradient: Gradient(colors: [Color("SecondaryColor"), Color("MainColor")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                //title
                Text("Hi!").font(.title).padding()
                
                //homeframe
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading)  {
                        Text("Laatste keer gebruikt").font(.headline)
                        Text("zoveel tijd geleden").font(.subheadline).padding(.bottom)
                    }
                    HStack(alignment: .bottom){
                        Text("0").font(.system(size: 55))
                        Text("uur").font(.title)
                        Text("00 ").font(.system(size: 55))
                        Text("minuten").font(.title)
                    }.foregroundColor(.white)
                    .frame(width: 320, height: 90)
                    .background(backgroundColor).cornerRadius(10)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Test je Drugs").font(.headline)
                            Text("Laat je drugs al vast testen bij één van de vele test punten").font(.subheadline).padding(.bottom)
                        }
                        Image("Home-test")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 80, height: 80)
                            .background(backgroundColor).cornerRadius(20)
                    }.padding()
                    
                    Divider()
                    
                    HStack {
                        Image("Tripsitter")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 80, height: 80)
                            .background(backgroundColor).cornerRadius(20)
                        VStack(alignment: .leading) {
                            Text("Ga je feesten?").font(.headline)
                            Text("Start je eerste keer gebruik met de Gebruikr. tripsitter!").font(.subheadline).padding(.bottom)
                        }
                    }.padding()
                    
                    }.frame(width: 320).padding().background(Color("BackgroundGray")).cornerRadius(10).shadow(radius: 5)
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

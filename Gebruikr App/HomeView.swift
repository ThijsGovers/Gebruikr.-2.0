//
//  HomeView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 20/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var backgroundColor = LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    //title
                    Text("Hi!").font(.largeTitle).padding()
                
                    //homeframe
                    VStack(alignment: .leading) {
                        
                        VStack(alignment: .leading)  {
                            Text("Laatste keer gebruikt").font(.title)
                            Text("zoveel tijd geleden").font(.headline).padding(.bottom)
                        }
                        
                        Text("0 uur 00 minuten")
                           .foregroundColor(.white)
                           .font(.largeTitle)
                        .frame(width: 350, height: 100)
                            .background(ColorManager.mainColor).cornerRadius(10).padding(.bottom)
                        
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Test je Drugs").font(.headline)
                                    Text("Laat je drugs al vast testen bij één van de vele test punten").font(.subheadline).padding(.bottom)
                                }.padding(.horizontal)
                            Image(systemName: "house.fill")
                               .foregroundColor(.white)
                               .font(.largeTitle)
                            .frame(width: 100, height: 100)
                                .background(backgroundColor).cornerRadius(20)
                            }
                        
                        HStack {
                            Image(systemName: "house.fill")
                               .foregroundColor(.white)
                               .font(.largeTitle)
                            .frame(width: 100, height: 100)
                                .background(backgroundColor).cornerRadius(20).padding(.horizontal)
                            VStack(alignment: .leading) {
                                Text("Ga je feesten?").font(.headline)
                                Text("Start je eerste keer gebruik met de Gebruikr. tripsitter!").font(.subheadline).padding(.bottom)
                            }
                        }
                        
                        }.frame(width: 320).padding(20).overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(Color.pink, lineWidth: 1.0)
                        )
                }
            Spacer()
            }.foregroundColor(Color.blue)
            .navigationBarTitle("Gebruikr", displayMode: .inline).font(.title)
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        print("Help tapped!")
                    }){
                        Image(systemName: "slider.horizontal.3")
                        .renderingMode(.original)
                    }
                }
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

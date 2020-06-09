//
//  HomeView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 20/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userData: UserData
    static let taskDateFormat: DateFormatter =     {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter
    }()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                //title
                Text("Hi!").font(.title).padding()
                
                //homeframe
                VStack (alignment: .leading){
                    if(userData.tripsitterActive == true){
                        VStack (alignment: .leading){
                            Text("Laatste keer gebruikt").font(.headline)
                            Text("zoveel tijd geleden").font(.subheadline).padding(.bottom)
                        }
                        HStack(alignment: .bottom){
                            Text("0 ").font(.system(size: 55))
                            Text("uur").font(.title)
                            Text("00 ").font(.system(size: 55))
                            Text("minuten").font(.title)
                        }.foregroundColor(.white)
                            .frame(width: 320, height: 90)
                            .background(Color.backgroundColor).cornerRadius(10)
                        
                        Text("Dit heb je al gebruikt:").font(.headline).padding(.top)
                        ForEach(userData.pillsUsed){ pill in
                            HStack{
                                if(pill.partsAmount == .full){
                                    Image("klok").resizable()
                                    .frame(width: 25.0, height: 25.0).foregroundColor(Color("TextColor"))
                                    Text("\(pill.time, formatter: Self.taskDateFormat)")
                                    Spacer()
                                  Image("Hele").resizable()
                                    .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                                    Text("Hele - \(pill.partMg, specifier: "%.0f") mg")
                                } else if (pill.partsAmount == .threeQuarters){
                                    Image("klok").resizable()
                                    .frame(width: 25.0, height: 25.0).foregroundColor(Color("TextColor"))
                                    Text("\(pill.time, formatter: Self.taskDateFormat)")
                                    Spacer()
                                    Image("DrieKwart").resizable()
                                    .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                                    Text("Driekwart - \(pill.partMg, specifier: "%.0f") mg")
                                } else if (pill.partsAmount == .half){
                                    Image("klok").resizable()
                                    .frame(width: 25.0, height: 25.0).foregroundColor(Color("TextColor"))
                                    Text("\(pill.time, formatter: Self.taskDateFormat)")
                                    Spacer()
                                    Image("Half").resizable()
                                    .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                                    Text("Halfje - \(pill.partMg, specifier: "%.0f") mg")
                                } else if (pill.partsAmount == .quarter){
                                    Image("klok").resizable()
                                    .frame(width: 25.0, height: 25.0).foregroundColor(Color("TextColor"))
                                    Text("\(pill.time, formatter: Self.taskDateFormat)")
                                    Spacer()
                                    Image("Kwart").resizable()
                                    .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                                    Text("Kwartje - \(pill.partMg, specifier: "%.0f") mg")
                                }
                            }.padding(.bottom,5)
                        }
                        HStack{
                            Text("Totaal").font(.headline).padding()
                            Spacer()
                            Text("\(userData.getTotalMg(), specifier: "%.0f") mg").font(.headline).padding()
                            }.frame(width: 300, height:50).background(Color("BackgroundPillsUsed")).cornerRadius(10)
                        Divider()
                        NavigationLink(destination: MdmaInput()) {
                            Text("Bijnemen").foregroundColor(Color.white).padding(12).font(.headline).background(Capsule().fill(Color("TextColor")))
                        }.frame(width: 320, alignment: .center)
                    } else {
                        VStack(alignment: .leading)  {
                            Text("Laatste keer gebruikt").font(.headline)
                            Text("zoveel tijd geleden").font(.subheadline).padding(.bottom)
                        }
                        HStack(alignment: .bottom){
                            Text("-").font(.system(size: 55))
                            Text("uur").font(.title)
                            Text("-- ").font(.system(size: 55))
                            Text("minuten").font(.title)
                        }.foregroundColor(.white)
                            .frame(width: 320, height: 90)
                            .background(Color.backgroundColor).cornerRadius(10)
                        
                        NavigationLink(destination: BottomBarView()) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Test je Drugs").font(.headline)
                                    Text("Laat je drugs al vast testen bij één van de vele test punten").font(.subheadline).padding(.bottom)
                                }
                                Image("Home-test")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .frame(width: 80, height: 80)
                                    .background(Color.backgroundColor).cornerRadius(20)
                            }.padding()
                        }
                        
                        Divider()
                        NavigationLink(destination: MdmaInput()) {
                            HStack {
                                Image("Tripsitter")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .frame(width: 80, height: 80)
                                    .background(Color.backgroundColor).cornerRadius(20)
                                VStack(alignment: .leading) {
                                    Text("Ga je feesten?").font(.headline)
                                    Text("Start je eerste keer gebruik met de Gebruikr. tripsitter!").font(.subheadline).padding(.bottom)
                                }
                            }.padding()
                        }
                    }
                    
                }.frame(width: 320).padding().background(Color("BackgroundGray")).cornerRadius(10).shadow(radius: 2)
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserData())
    }
}

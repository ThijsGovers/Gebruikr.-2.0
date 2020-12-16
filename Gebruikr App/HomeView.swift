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
                //title\
                HStack {
                Text("Hi!").font(.title) +
                Text(" \(userData.username)").font(.title).foregroundColor(Color("MainColor"))
                }.padding()
                
                //homeframe
                VStack (alignment: .leading){
                    if(userData.tripsitterActive == true){
                        
                        VStack (alignment: .leading){
                            Text("Laatste keer gebruikt").font(.headline)
                            Text("zoveel tijd geleden").font(.subheadline).padding(.bottom)
                        }.foregroundColor(Color("MainColor"))
                        
                        HStack(alignment: .bottom){
                            if (self.userData.minutesSinceLastPill >= 0){
                                Text("\(userData.hoursSinceLastPill)").font(.system(size: 55))
                                Text("uur").font(.title)
                                Text("\(userData.minutesSinceLastPill)").font(.system(size: 55))
                                if (self.userData.minutesSinceLastPill < 2 && self.userData.minutesSinceLastPill < 0){
                                    Text("minuut").font(.title)
                                } else{
                                    Text("minuten").font(.title)
                                }
                            } else {
                                ZStack(alignment: .center) {
                                    Image("BackgroundCircle")
                                    HStack(alignment: .bottom){
                                        Text("-").font(.system(size: 55))
                                        Text("uur").font(.title)
                                        Text("-- ").font(.system(size: 55))
                                        Text("Min").font(.title)
                                    }.foregroundColor(.white)
                                }.frame(width: 320, height: nil)
                            }
                            
                        
                        //.foregroundColor(.white)
                           // .frame(width: 320, height: 90)
                          //  .background(Color.backgroundColor).cornerRadius(10)
                    }
                        ScrollView(.vertical) {
                            VStack(alignment: .leading){
                                Text("Dit heb je al gebruikt:").font(.headline).padding(.top)
                                ForEach(userData.pillsUsed){ pill in
                                    HStack{
                                        if(pill.partsAmount != .unspecified){
                                            HStack{
                                                Image("klok").resizable()
                                                    .frame(width: 25.0, height: 25.0).foregroundColor(Color("TextColor"))
                                                Text("\(pill.time, formatter: Self.taskDateFormat)")
                                            }.frame(width: 110).padding(.trailing, 25)
                                        }
                                        if(pill.partsAmount == .full){
                                            Image("Hele").resizable()
                                                .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                                            Text("Hele - \(pill.partMg, specifier: "%.0f") mg")
                                        } else if (pill.partsAmount == .threeQuarters){
                                            Image("DrieKwart").resizable()
                                                .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                                            Text("Driekwart - \(pill.partMg, specifier: "%.0f") mg")
                                        } else if (pill.partsAmount == .half){
                                            Image("Half").resizable()
                                                .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                                            Text("Halfje - \(pill.partMg, specifier: "%.0f") mg")
                                        } else if (pill.partsAmount == .quarter){
                                            Image("Kwart").resizable()
                                                .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                                            Text("Kwartje - \(pill.partMg, specifier: "%.0f") mg")
                                        }
                                    }.padding(.bottom,5)
                                }
                            }
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
                        ZStack(alignment: .center) {
                            Image("BackgroundCircle")
                            HStack(alignment: .bottom){
                                Text("-").font(.system(size: 55))
                                Text("uur").font(.title)
                                Text("-- ").font(.system(size: 55))
                                Text("Min").font(.title)
                            }.foregroundColor(.white)
                        }.frame(width: 320, height: nil)
                        
                    // Uitgecomment voor eventuele aanvulling op homescreen testlocaties
                        
                       // NavigationLink(destination: BottomBarView()) {
                         //   HStack {
                           //     VStack(alignment: .leading) {
                             //       Text("Test je Drugs").font(.headline)
                               //     Text("Laat je drugs al vast testen bij één van de vele test punten").font(.subheadline).padding(.bottom)
                               // }
                                //Image("Home-test")
                                 //   .foregroundColor(.white)
                                  //  .font(.largeTitle)
                                  //  .frame(width: 80, height: 80)
                                 //   .background(Color.backgroundColor).cornerRadius(20)
                           // }.padding()
                       // }
                        Divider()
                        
                            HStack {
                                VStack(alignment: .center) {
                                    Text("Ga je feesten?").font(.headline).foregroundColor(Color("MainColor"))
                                    Text("Start je eerste keer gebruik met de tripsitter!").font(.subheadline).foregroundColor(.white).padding()
                                    NavigationLink(destination: MdmaInput()) {
                                    Image("Tripsitter")
                                        .foregroundColor(.black)
                                        .font(.largeTitle)
                                        .frame(width: 80, height: 80)
                                        .background(Color.backgroundColor).cornerRadius(20)
                                }
                            }.padding()
                        }
                    }
                    
                }.frame(width: 320).padding().background(Color("BackgroundGray")).cornerRadius(10).shadow(radius: 2)
            }
            Spacer()
        }
        .onAppear{
            userData.resetpill()
        }
    }
}
//Hier moet de .onAppear {} komen. (Om de UserData te resetten.)
//"MDMAPillSpecification" -> Moet gefixt worden.

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserData())
    }
}

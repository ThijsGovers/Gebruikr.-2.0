//
//  useAmountView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 30/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct useAmountView: View {
//    @ObservedObject var userData : UserData = UserData()
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack{
             VStack (alignment: .leading){
                       Text("Hoeveel Ga je gebruiken?").font(.title).foregroundColor(Color("TextColor"))
                       HStack{
                           Button(action: {
                               self.userData.partsAmount = .full
                               self.userData.calculatePartAmount()
                           }){
                               if userData.partsAmount == .full{
                                   VStack{
                                       Image("HeleSelected").resizable()
                                       .frame(width: 39.0, height: 39.0).foregroundColor(Color.white)
                                       Divider().background(Color.white).padding(.horizontal)
                                       Text("Hele").foregroundColor(Color.white)
                                       
                                   }.frame(width: 80, height: 90).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                               } else {
                                   VStack{
                                       Image("Hele").resizable()
                                       .frame(width: 39.0, height: 39.0).foregroundColor(Color("TextColor"))
                                       
                                       Divider().padding(.horizontal)
                                       Text("Hele").foregroundColor(Color("TextColor"))
                                   }.frame(width: 80, height: 90).background(Color.white).cornerRadius(10).shadow(radius: 2)
                               }
                               
                           }.buttonStyle(PlainButtonStyle())
                           Spacer()
                           Button(action: {
                               self.userData.partsAmount = .threeQuarters
                               self.userData.calculatePartAmount()
                           }){
                               if userData.partsAmount == .threeQuarters{
                                   VStack{
                                       Image("DrieKwartSelected").resizable()
                                       .frame(width: 39.0, height: 39.0).foregroundColor(Color.white)
                                       Divider().background(Color.white).padding(.horizontal)
                                       Text("3/4").foregroundColor(Color.white)
                                       
                                   }.frame(width: 80, height: 90).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                               } else {
                                   VStack{
                                       Image("DrieKwart").resizable()
                                       .frame(width: 39.0, height: 39.0).foregroundColor(Color("TextColor"))
                                       
                                       Divider().padding(.horizontal)
                                       Text("3/4").foregroundColor(Color("TextColor"))
                                   }.frame(width: 80, height: 90).background(Color.white).cornerRadius(10).shadow(radius: 2)
                               }
                               
                           }.buttonStyle(PlainButtonStyle())
                           
                           Spacer()
                           
                           Button(action: {
                               self.userData.partsAmount = .half
                               self.userData.calculatePartAmount()
                           }){
                               if userData.partsAmount == .half{
                                   VStack{
                                       Image("HalfSelected").resizable()
                                       .frame(width: 39.0, height: 39.0).foregroundColor(Color.white)
                                       Divider().background(Color.white).padding(.horizontal)
                                       Text("Halfje").foregroundColor(Color.white)
                                       
                                   }.frame(width: 80, height: 90).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                               } else {
                                   VStack{
                                       Image("Half").resizable()
                                       .frame(width: 39.0, height: 39.0).foregroundColor(Color("TextColor"))
                                       
                                       Divider().padding(.horizontal)
                                       Text("Halfje").foregroundColor(Color("TextColor"))
                                   }.frame(width: 80, height: 90).background(Color.white).cornerRadius(10).shadow(radius: 2)
                               }
                               
                           }.buttonStyle(PlainButtonStyle())
                           
                           Spacer()
                           
                           Button(action: {
                               self.userData.partsAmount = .quarter
                               self.userData.calculatePartAmount()
                           }){
                               if userData.partsAmount == .quarter{
                                   VStack{
                                       Image("KwartSelected").resizable()
                                       .frame(width: 39.0, height: 39.0).foregroundColor(Color.white)
                                       Divider().background(Color.white).padding(.horizontal)
                                       Text("Kwartje").foregroundColor(Color.white)
                                       
                                   }.frame(width: 80, height: 90).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                               } else {
                                   VStack{
                                       Image("Kwart").resizable()
                                       .frame(width: 39.0, height: 39.0).foregroundColor(Color("TextColor"))
                                       
                                       Divider().padding(.horizontal)
                                       Text("Kwartje").foregroundColor(Color("TextColor"))
                                   }.frame(width: 80, height: 90).background(Color.white).cornerRadius(10).shadow(radius: 2)
                               }
                               
                           }.buttonStyle(PlainButtonStyle())
                       }
                       Text("Dosis \(userData.partMg, specifier: "%.0f") mg *").padding().foregroundColor(Color("TextColor"))
                   }.frame(width: 325)
            
            
            VStack{
                Text("Max gebruik!").font(.title).frame(width: 325, alignment: .leading)
                if(userData.tripsitterActive == true){
                VStack(spacing: 0){
                    HStack{
                        Spacer()
                        Image("NogNietGebruikt").resizable()
                            .frame(width: 39.0, height: 39.0)
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Goed")
                            Text("Bezig")
                        }
                        Divider().background(Color("TextColor")).frame(height: 50)
                        Image("Kwart").resizable()
                            .frame(width: 39.0, height: 39.0)
                        Spacer()
                        Text("\(userData.maxMg, specifier: "%.0f") mg").font(.headline)
                        Spacer()
                    }.frame(width: 325, height:70).background(Color("BackgroundGray")).cornerRadius(10).shadow(radius: 2)
                        VStack{
                            ScrollView{
                            VStack(alignment: .leading){
                                Text("Dit heb je al gebruikt:").font(.headline).padding(.bottom)
                                ForEach(userData.pillsUsed){ pill in
                                    HStack{
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
                                Text("Neem in ieder geval niet meer dan:").font(.headline).padding(.top)
                                HStack{
                                    Text("1 X").font(.headline)
                                    Image("Kwart").resizable()
                                        .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                                    Text("Kwartje - 17,5 mg")
                                }.padding(.bottom,5)
                            }.padding()
                        }
                        }.frame(width: 310, height: 200).background(Color("BackgroundPillsUsed")).cornerRadius(10)
                }
                    }else{
                    VStack(spacing: 0){
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
                    }
                        Spacer()
                    }
                if (userData.maxMg < userData.partMg){
                    VStack(){
                        HStack{
                            VStack(alignment: .leading){
                                Text("Neem een kleinere dosis").font(.headline).padding(.bottom, 5)
                                Text("Het is beter om hierna niet  meer bij te nemen.")
                            }
                            Spacer()
                            Image("Kwart").resizable()
                                .frame(width: 30.0, height: 30.0).foregroundColor(Color("TextColor"))
                            
                        }.padding()
                    }.frame(width: 310, alignment: .leading).background(Color("BackgroundPillsUsed")).cornerRadius(10)
                } else if (userData.maxMg == userData.partMg){
                    VStack(){
                        HStack{
                            VStack(alignment: .leading){
                                Text("Je bereikt je max").font(.headline).padding(.bottom, 5)
                                Text("Het is beter om hierna niet  meer bij te nemen.")
                            }
                            Spacer()
                            Image("Kwart").resizable()
                                .frame(width: 30.0, height: 30.0).foregroundColor(Color("TextColor"))
                            
                        }.padding()
                    }.frame(width: 310, alignment: .leading).background(Color("BackgroundPillsUsed")).cornerRadius(10)
                } else{
                    Spacer()
                }
            }.foregroundColor(Color("TextColor"))
            Spacer().frame(height: 1)
            NavigationLink(destination: StartTripView()){
                Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
            }.padding(.top, 50)
        }.onAppear{
            self.userData.calculatePillAdvice()
        }
    }
}

struct useAmountView_Previews: PreviewProvider {
    static var previews: some View {
        useAmountView().environmentObject(UserData())
    }
}

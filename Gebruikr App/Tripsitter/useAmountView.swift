//
//  useAmountView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 30/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct useAmountView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack {
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer().frame(height: 20)
                VStack{
                    Text("Max gebruik!").font(.callout).frame(width: 325)
                    if(userData.tripsitterActive == true){
                    VStack{
                        HStack{
                            if (userData.calculatePillAdvice() - userData.getTotalMg() <= 0){
                            Spacer()
                            Image("NogNietGebruikt").resizable()
                                .frame(width: 39.0, height: 39.0)
                            Spacer()
                            VStack(alignment: .leading){
                                Text("Neem niet")
                                Text("meer bij")
                            }
                            Divider().background(Color("MainColor")).frame(height: 50)
                            Image("Kwart").resizable()
                                .frame(width: 39.0, height: 39.0)
                            Spacer()
                            
                                Text("0 mg").font(.headline)
                            }else{
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
                            Text("\(userData.calculatePillAdvice() - userData.getTotalMg(), specifier: "%.0f") mg").font(.headline)
                            }
                            Spacer()
                        }.frame(width: 325, height:70).background(Color("DarkGray")).cornerRadius(10).shadow(radius: 2)
                            VStack{
                                VStack{
                                    Text("Dit heb je al gebruikt:").font(.headline).padding(.horizontal ,35)
                                        ScrollView{
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
                                        Text("Advies van Gebruikr. :").font(.headline).padding(.top)
                                        userData.calculateAdvice()
                                    }
                                }
                                .frame (
                                    minHeight : 0,
                                    maxHeight : 145
                                )
                                .padding().background(Color("DarkGray")).cornerRadius(10)
                            }
                    }
                        }else{
                        VStack(spacing: 0){
                            HStack{
                                Spacer()
                                Image("NogNietGebruikt").resizable()
                                    .frame(width: 39.0, height: 39.0)
                                Spacer()
                                VStack(alignment: .leading){
                                    Text("Nog niks ")
                                    Text("gebruikt")
                                }
                                Divider().background(Color("TextColor")).frame(height: 50)
                                Image("Kwart").resizable()
                                    .frame(width: 39.0, height: 39.0)
                                Spacer()
                                Text("\(userData.calculatePillAdvice(), specifier: "%.0f") mg").font(.headline)
                                Spacer()
                            }.frame(width: 325, height:70).background(Color("systemGray6")).cornerRadius(10)
                        }
                        }
                    if (userData.calculatePillAdvice() - userData.getTotalMg() < userData.partMg){
                            HStack{
                                VStack{
                                    Text("Neem een kleinere dosis").font(.headline).padding()
                                    Text("Het is beter om niet meer te nemen dan je limiet.").padding(.bottom, 5)
                                }.padding(.horizontal)
                                Spacer()
                                Image("WaarschuwingsIcon").resizable()
                                    .frame(width: 30.0, height: 30.0).foregroundColor(Color("TextColor")).padding(.horizontal)
                                
                            }.padding(.bottom).frame(width: 340).background(Color("DarkGray")).cornerRadius(10)
                        Spacer()
                    } else if (userData.calculatePillAdvice() - userData.getTotalMg() == userData.partMg){
                            HStack{
                                VStack{
                                    Text("Je bereikt je max").font(.headline).padding(.bottom, 5)
                                    Text("Het is beter om hierna niet meer bij te nemen.")
                                }
                                Spacer()
                                Image("WaarschuwingsIcon").resizable()
                                    .frame(width: 30.0, height: 30.0).foregroundColor(Color("TextColor")).padding(.horizontal)
                                
                            }.padding().frame(width: 310, alignment: .leading).background(Color("BackgroundPillsUsed")).cornerRadius(10)
                        Spacer()
                    } else{
                        Spacer()
                    }
                }.foregroundColor(Color("TextColor"))
                
                
                 VStack{
                    Text("Hoeveel Ga je gebruiken?").font(.title).padding(.top, 5).foregroundColor(Color("TextColor"))
                           HStack{
                               Button(action: {
                                   self.userData.partsAmount = .full
                                   self.userData.calculatePartAmount()
                               }){
                                   if userData.partsAmount == .full{
                                       VStack{
                                           Image("HeleSelected").resizable()
                                           .frame(width: 39.0, height: 39.0).foregroundColor(Color.white)
                                        Divider().background(Color("systemGray6")).padding(.horizontal)
                                           Text("Hele").foregroundColor(Color("systemGray6"))
                                           
                                       }.frame(width: 80, height: 90).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                                

                                   } else {
                                       VStack{
                                           Image("Hele").resizable()
                                           .frame(width: 39.0, height: 39.0).foregroundColor(Color("TextColor"))
                                           
                                           Divider().background(Color("MainColor")).padding(.horizontal)
                                           
                                        Text("Hele").foregroundColor(Color("TextColor"))
                                       }.frame(width: 80, height: 90)
                                       .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("MainColor"), lineWidth: 2))
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
                                           Divider().background(Color("systemGray6")).padding(.horizontal)
                                           Text("3/4").foregroundColor(Color("systemGray6"))
                                           
                                       }.frame(width: 80, height: 90).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                                   } else {
                                       VStack{
                                           Image("DrieKwart").resizable()
                                           .frame(width: 39.0, height: 39.0).foregroundColor(Color("TextColor"))
                                           
                                           Divider().background(Color("MainColor")).padding(.horizontal)
                                           Text("3/4").foregroundColor(Color("TextColor"))
                                       }.frame(width: 80, height: 90)
                                       .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("MainColor"), lineWidth: 2))
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
                                           Divider().background(Color("systemGray6")).padding(.horizontal)
                                           Text("Halfje").foregroundColor(Color("systemGray6"))
                                           
                                       }.frame(width: 80, height: 90).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                                   } else {
                                       VStack{
                                           Image("Half").resizable()
                                           .frame(width: 39.0, height: 39.0).foregroundColor(Color("TextColor"))
                                           
                                           Divider().background(Color("MainColor")).padding(.horizontal)
                                        
                                           Text("Halfje").foregroundColor(Color("TextColor"))
                                       }.frame(width: 80, height: 90)
                                       .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("MainColor"), lineWidth: 2))
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
                                           Divider().background(Color("systemGray6")).padding(.horizontal)
                                           Text("Kwartje").foregroundColor(Color("systemGray6"))
                                           
                                       }.frame(width: 80, height: 90).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                                   } else {
                                       VStack{
                                           Image("Kwart").resizable()
                                           .frame(width: 39.0, height: 39.0).foregroundColor(Color("TextColor"))
                                           
                                           Divider().background(Color("MainColor")).padding(.horizontal)
                                        
                                           Text("Kwartje").foregroundColor(Color("TextColor"))
                                       }.frame(width: 80, height: 90)
                                       .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("MainColor"), lineWidth: 2))
                                   }
                                   
                               }.buttonStyle(PlainButtonStyle())
                           }
                    VStack {
                           Text("Dosis \(userData.partMg, specifier: "%.0f") mg *").padding().foregroundColor(Color("TextColor"))
                        if userData.partsAmount == .full{
                            Text("Gebruikr. adviseert om geen hele pil in een keer te nemen!").font(.caption)
                        }
                        else {
                            Text("")
                        }
                    }
                       }.frame(width: 325)
                
                if userData.partsAmount == .threeQuarters{
                    Spacer().frame(height: 1)
                    NavigationLink(destination: StartTripView().navigationBarTitle("Tripsitter", displayMode: .inline)){
                        Text("Volgende").foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
                    }.padding(.top, 50)
                }
                
                else if userData.partsAmount == .full{
                    Spacer().frame(height: 1)
                    NavigationLink(destination: StartTripView().navigationBarTitle("Tripsitter", displayMode: .inline)){
                        Text("Volgende").foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
                    }.padding(.top, 50)
                }
                
                else if userData.partsAmount == .half{
                    Spacer().frame(height: 1)
                    NavigationLink(destination: StartTripView().navigationBarTitle("Tripsitter", displayMode: .inline)){
                        Text("Volgende").foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
                    }.padding(.top, 50)
                }
                
                else if userData.partsAmount == .quarter{
                    Spacer().frame(height: 1)
                    NavigationLink(destination: StartTripView().navigationBarTitle("Tripsitter", displayMode: .inline)){
                        Text("Volgende").foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
                    }.padding(.top, 50)
                }
                
                else {
                    Text("Volgende").foregroundColor(Color.gray).padding(12).background(Capsule().fill(Color.backgroundColor)).padding(.top, 50)
                }
                
                

                
                
            }
        }
    }
}

struct useAmountView_Previews: PreviewProvider {
    static var previews: some View {
        useAmountView().environment(\.colorScheme, .dark).environmentObject(UserData())
    }
}

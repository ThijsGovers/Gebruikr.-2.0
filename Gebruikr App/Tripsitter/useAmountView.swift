//
//  useAmountView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 30/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct useAmountView: View {
    @ObservedObject var userData : UserData = UserData()
    
    var body: some View {
        VStack{
            Text("De hoeveelheid mdma in de pil is \(userData.mdma.amountInMg)")
            amountButtonsView().padding(.bottom, 20)
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
                    
                        VStack{
                            VStack(alignment: .leading){
                                Text("Dit heb je al gebruikt:").font(.headline).padding(.bottom)
                                HStack{
                                    Image("Kwart").resizable()
                                        .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                                    Text("Kwartje - 17,5 mg")
                                }.padding(.bottom,5)
                                HStack{
                                    Image("Kwart").resizable()
                                        .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                                    Text("Kwartje - 17,5 mg")
                                }.padding(.bottom,5)
                                Text("Neem in ieder geval niet meer dan:").font(.headline).padding(.top)
                                HStack{
                                    Text("1 X").font(.headline)
                                    Image("Kwart").resizable()
                                        .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                                    Text("Kwartje - 17,5 mg")
                                }.padding(.bottom,5)
                            }.padding()
                        }.frame(width: 310).background(Color("BackgroundPillsUsed")).cornerRadius(10)
                    
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
                        
                        //            if (userData.mdma.amountInMg > Int(userData.maxMg)){
                        //                VStack{
                        //                    Text("lol")
                        //                }
                        //            }
                        
                        
                    }
                        Spacer()
                    }
//                if (userData.mdma.amountInMg > Int(userData.maxMg)){
                    VStack(){
                        HStack{
                            VStack(alignment: .leading){
                                Text("Je neemt nu \(userData.partMg)").font(.headline).padding(.bottom, 5)
                                Text("Het is beter om hierna niet  meer bij te nemen.")
                            }
                            Spacer()
                            Image("Kwart").resizable()
                                .frame(width: 30.0, height: 30.0).foregroundColor(Color("TextColor"))
                            
                        }.padding()
                    }.frame(width: 310, alignment: .leading).background(Color("BackgroundPillsUsed")).cornerRadius(10)
//                }
            }.foregroundColor(Color("TextColor"))
            Spacer().frame(height: 1)
            NavigationLink(destination: StartTripView()){
                Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
            }.padding(.top, 50)
        }.padding(.top, 50)
    }
}

struct useAmountView_Previews: PreviewProvider {
    static var previews: some View {
        useAmountView()
    }
}

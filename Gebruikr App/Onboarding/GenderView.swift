//
//  GenderView.swift
//  Gebruikr gegevens
//
//  Created by Thijs Govers on 22/04/2020.
//  Copyright © 2020 Thijs Govers. All rights reserved.
//

import SwiftUI

struct GenderView: View {
    @EnvironmentObject var userData: UserData
    @State var showGenderExplanation = false
    
    @Binding public var step: Int
    
    @State var unspcifiedGender : Bool = false
    
    
    private var nextButton: some View {
        NavigationLink(destination: WeightView(step: $step)){
            Text("Volgende").foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
        }
    }
    var body: some View {
        
        VStack{
            
            Text("Nice to meet you").font(.largeTitle)
            Text("\(userData.username)").font(.largeTitle).foregroundColor(Color("MainColor")) +
            Text("!").font(.largeTitle)
            
            
            VStack{
                
                VStack{
                    Spacer()
                    Text("Oke!").font(.title)
                    Spacer()
                    HStack{
                    Text("Wat is je").font(.title)
                    Text("geslacht").foregroundColor(Color("MainColor")).font(.title) +
                    Text("?").font(.title)
                    }
                }
                
                Button(action: {
                    self.showGenderExplanation = true
                }) {
                    Image ("Info").resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                }.buttonStyle(PlainButtonStyle()).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                    
                    .sheet(isPresented: $showGenderExplanation) {
                        
                        GenderExplanationView()
                        
                }
                
            
            }.foregroundColor(Color("TextColor"))
            HStack{
                Button(action: {
                    self.userData.gender = "Man"
                }){
                    if userData.gender == "Man"{
                        VStack{
                            Image("masculine-2")
                            
                            Rectangle().fill(Color.black).frame(height: 2).padding(.horizontal)
                            
                            Text("Man").foregroundColor(Color.black)
                            
                        }.frame(width: 107, height: 122).background(Color.backgroundColor).cornerRadius(10)
                    } else {
                        VStack{
                            Image("masculine-1").foregroundColor(Color.orange)
                            
                            Rectangle()
                                .fill(Color("MainColor"))
                                .frame(height: 2).padding(.horizontal)
                            Text("Man").foregroundColor(Color("TextColor"))
                        }.frame(width: 75, height: 87)
                        .padding()
                        .foregroundColor(Color("MainColor"))
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("MainColor"), lineWidth: 2)
                        )
                    }
                    
                }.padding().buttonStyle(PlainButtonStyle())
                
                
                
                Button(action: {
                    self.userData.gender = "Vrouw"
                }){
                    if userData.gender == "Vrouw"{
                        VStack{
                            Image("femenine-2")
                                .foregroundColor(Color.black)
                            Rectangle()
                                .fill(Color.black)
                                .frame(height: 2).padding(.horizontal)
                            Text("Vrouw").foregroundColor(Color.black)
                            
                        }.frame(width: 107, height: 122).background(Color.backgroundColor).cornerRadius(10)
                    } else {
                        VStack{
                            Image("femenine-1")
                                
                            
                            Rectangle()
                                .fill(Color("MainColor"))
                                .frame(height: 2).padding(.horizontal)
                            Text("Vrouw").foregroundColor(Color("TextColor"))
                            
                        }.frame(width: 75, height: 87)
                        .padding()
                        .foregroundColor(Color("MainColor"))
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("MainColor"), lineWidth: 2)
                        )
                        //.border(Color("MainColor"), width: 2).cornerRadius(15)
                            
                            
                    }
                    
                }.padding().buttonStyle(PlainButtonStyle())
                
                
            }
            Spacer()
            Text("Liever niet? No biggie").font(.caption)
                .foregroundColor(Color("TextColor")).padding(.bottom, 10)
            
            
            NavigationLink(destination: WeightView(step: $step), isActive: $unspcifiedGender){
                Text("Overslaan").underline().font(.headline).onTapGesture {
                    // Execute code here.
                    self.userData.gender = "n.v.t."
                    self.unspcifiedGender = true
                }
            }.padding(.bottom, 30)
            
            nextButton
            HStack{
                Circle()
                    .fill(Color.gray)
                    .frame(width: 16, height: 16)
                Circle()
                    .fill(Color.backgroundColor)
                    .frame(width: 16, height: 16)
                Circle()
                    .fill(Color.gray)
                    .frame(width: 16, height: 16)
            }
        }.navigationBarTitle("").navigationBarBackButtonHidden(true)
        
    }
}


struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView(step: .constant(4)).environmentObject(UserData())
    }
}

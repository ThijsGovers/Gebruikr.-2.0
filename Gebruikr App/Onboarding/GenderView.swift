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
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
        }
    }
    var body: some View {
        
        VStack{
            Spacer(minLength: 150)
            Text("Nice to meet you").font(.largeTitle)
                Text("\(userData.username)").font(.largeTitle).foregroundColor(Color("MainColor")) +
            Text("!").font(.largeTitle)
            
            HStack{
                VStack{
                    Text("Wat is je").font(.title)
                    Text("geslacht").foregroundColor(Color("MainColor")).font(.title) +
                    Text("?").font(.title)
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
                            Image("masculine-2").foregroundColor(Color.white)
                            
                            Rectangle().fill(Color.white).frame(height: 2).padding(.horizontal)
                            
                            Text("Man").foregroundColor(Color.white)
                            
                        }.frame(width: 107, height: 118).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 5)
                    } else {
                        VStack{
                            Image("masculine-1").foregroundColor(Color.orange)
                            
                            Rectangle()
                                .fill(Color("TextColor"))
                                .frame(height: 2).padding(.horizontal)
                            Text("Man").foregroundColor(Color("TextColor"))
                        }.frame(width: 107, height: 118).background(Color.white).cornerRadius(10).shadow(radius: 2)
                    }
                    
                }.padding().buttonStyle(PlainButtonStyle())
                
                
                
                Button(action: {
                    self.userData.gender = "Vrouw"
                }){
                    if userData.gender == "Vrouw"{
                        VStack{
                            Image("femenine-2")
                                .foregroundColor(Color.white)
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 2).padding(.horizontal)
                            Text("Vrouw").foregroundColor(Color.white)
                            
                        }.frame(width: 107, height: 118).background(Color.backgroundColor).cornerRadius(10).shadow(radius: 2)
                    } else {
                        VStack{
                            Image("femenine-1")
                                .foregroundColor(Color.orange)
                            
                            Rectangle()
                                .fill(Color("TextColor"))
                                .frame(height: 2).padding(.horizontal)
                            Text("Vrouw").foregroundColor(Color("TextColor"))
                            
                        }.frame(width: 107, height: 118).background(Color.white).cornerRadius(10).shadow(radius: 2)
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

//
//  GenderView.swift
//  Gebruikr gegevens
//
//  Created by Thijs Govers on 22/04/2020.
//  Copyright © 2020 Thijs Govers. All rights reserved.
//

import SwiftUI

enum Gender {
    case male, female, unspecified
}

struct GenderView: View {
    @EnvironmentObject var userData: UserData
    
    @Binding public var step: Int

    
    private var nextButton: some View {
        NavigationLink(destination: WeightView(step: $step)){
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
        }
    }
    
    var body: some View {
        
        VStack{
            Spacer(minLength: 150)
            Text("Wat is je geslacht?").font(.title).padding(.bottom)
            HStack{
                Button(action: {
                    self.userData.gender = .male
                }){
                    if userData.gender == .male{
                        VStack{
                            Image("masculine-2").foregroundColor(Color.white)
                                .padding(40)
                                .background(Circle().fill(Color.backgroundColor).shadow(radius: 5))
                            Text("Man").font(.title).foregroundColor(Color("TextColor"))
                            
                        }
                    } else {
                        VStack{
                            Image("masculine-1").foregroundColor(Color.orange)
                                .padding(40)
                                .background(Circle().fill(Color.white).shadow(radius: 5))
                            Text("Man").font(.title).foregroundColor(Color("TextColor"))
                        }
                    }
                    
                }.padding().buttonStyle(PlainButtonStyle())
                
                
                
                Button(action: {
                    self.userData.gender = .female
                }){
                    if userData.gender == .female{
                        VStack{
                            Image("femenine-2")
                                .foregroundColor(Color.white)
                                .padding(40)
                                .background(Circle().fill(Color.backgroundColor).shadow(radius: 5))
                            Text("Vrouw").font(.title).foregroundColor(Color("TextColor"))
                            
                        }
                    } else {
                        VStack{
                            Image("femenine-1")
                                .foregroundColor(Color.orange)
                                .padding(40)
                                .background(Circle().fill(Color.white).shadow(radius: 10))
                                
                            Text("Vrouw").font(.title).foregroundColor(Color("TextColor"))
                            
                        }
                    }
                    
                }.padding().buttonStyle(PlainButtonStyle())
                
                
            }
            Spacer()
            Text("Liever niet? No biggie").font(.callout)
            Button(action: {
                self.step += 1
                self.userData.gender = .unspecified
            }) {
                Text("Overslaan").font(.headline)
            }.padding(.bottom)
            nextButton
        }
        
    }
}


struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView(step: .constant(1)).environmentObject(UserData())
    }
}

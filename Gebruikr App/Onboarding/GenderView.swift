//
//  GenderView.swift
//  Gebruikr gegevens
//
//  Created by Thijs Govers on 22/04/2020.
//  Copyright © 2020 Thijs Govers. All rights reserved.
//

import SwiftUI


struct GenderView: View {
    var backgroundColor = LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .top, endPoint: .bottom)
    var body: some View {
        
        VStack{
            Spacer(minLength: 150)
            Text("Wat is je geslacht?").font(.title).padding(.bottom)
            HStack{
                Button(action: {
                    
                }){
                    
                    VStack{
                        Image("manIcoon")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        Divider().background(Color.white)
                        Text("Man").foregroundColor(.white)
                            
                    }.frame(width: 80, height: 80).padding(35)
                        .background(backgroundColor).cornerRadius(20)
                }.padding()
                
                
                
                Button(action: {
                    
                }){
                   
                    VStack{
                        Image("vrouwIcoon")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        Divider().background(Color.white)
                        Text("Vrouw").foregroundColor(.white)
                        
                    }.frame(width: 80, height: 80).padding(35)
                        .background(backgroundColor).cornerRadius(20)
                }.padding()
                    
            
            }

            Spacer()
        }
        
    }
}


struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView()
    }
}

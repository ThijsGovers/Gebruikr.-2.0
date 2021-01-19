//
//  WeightView.swift
//  Gebruikr gegevens
//
//  Created by Thijs Govers on 22/04/2020.
//  Copyright © 2020 Thijs Govers. All rights reserved.
//

import SwiftUI

struct WeightView: View {
    @EnvironmentObject var userData: UserData
     @State var showWeightExplanation = false
    
    @Binding public var step: Int
    
    private var nextButton: some View {
        NavigationLink(destination: InformationOverview(step: $step)){
            Text("Volgende").foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
        }
    }
    
    var body: some View {
        VStack{
            Spacer(minLength: 150)
            VStack{
                HStack{
                    Text("Cool,")
                    Text("Thx").foregroundColor(Color("MainColor"))
                    Text("!")
                    Spacer()
                }.font(.title)
            HStack{
                Text("Wat is je").padding(.vertical, 30).font(.title)
                Text("gewicht").font(.title).foregroundColor(Color("MainColor"))
                Text("?").font(.title)
            }
            Button(action: {
                self.showWeightExplanation = true
            }) {
                Image ("Info").resizable()
                    .frame(width: 30, height: 30, alignment: .center).padding(.bottom, 30)
            }.buttonStyle(PlainButtonStyle()).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                
                .sheet(isPresented: $showWeightExplanation) {
                    
                    WeightExplanationView()
                    
            }
            }
            
            Slider(value: $userData.weight, in: 40...150, step: 1).padding(.horizontal,30)
            Text("\(userData.weight, specifier: "%.0f") kg").font(.title)
            Spacer()
            nextButton
            HStack{
                Circle()
                .fill(Color.gray)
                .frame(width: 16, height: 16)
                Circle()
                    .fill(Color.gray)
                .frame(width: 16, height: 16)
                Circle()
                .fill(Color.backgroundColor)
                .frame(width: 16, height: 16)
            }
        }.navigationBarTitle("").navigationBarBackButtonHidden(true).foregroundColor(Color("TextColor"))
        
    }
    
}


struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView(step: .constant(5)).environmentObject(UserData())
    }
}

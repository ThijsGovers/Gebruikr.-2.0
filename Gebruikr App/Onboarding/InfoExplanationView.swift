//
//  InfoExplanationView.swift
//  LandingPage
//
//  Created by Reamon Hoefakker on 20/05/2020.
//  Copyright © 2020 Reamon Hoefakker. All rights reserved.
//

import SwiftUI

struct InfoExplanationView: View {
        @State var showWeightExplanation = false
        @State var showGenderExplanation = false
    
    @Binding public var step: Int

    
    private var nextButton: some View {
        NavigationLink(destination: UserExplanationView(step: $step)){
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
        }.navigationBarTitle("Gebruikr.", displayMode: .inline)
    }
    
        var body: some View {

            VStack{
                Text("Hiervoor heeft Gebruikr. wel wat info nodig")
                    .font(.largeTitle).lineLimit(nil)
                    .frame(width: 350, height: 90, alignment: .leading)
                    Spacer ()
                        .frame(height: 20)
            
                VStack(alignment: .center) {
                    Text("Wil je weten waarom?")
                        .font(.headline)
                
                Text("Tap de icon!")
                    .font(.headline)
                }
                
                VStack(alignment: .center) {
                    Spacer ()
                        .frame(height: 60)

                Button(action: {
                    self.showWeightExplanation = true
                }) {
                    Image ("WeightIcon")
                        .frame(width: 110, height: 110, alignment: .center)
                }.buttonStyle(PlainButtonStyle())

                .sheet(isPresented: $showWeightExplanation) {

                    WeightExplanationView()

                }
                
                Spacer ()
                    .frame(height: 20)
                
                Button(action: {
                    self.showGenderExplanation = true
                       }) {
                           Image ("GenderIcon")
                               .frame(width: 110, height: 110, alignment: .center)
                       }.buttonStyle(PlainButtonStyle())

                       .sheet(isPresented: $showGenderExplanation) {

                           GenderExplanationView()
                }
            }
                Spacer()
                nextButton


            }.frame(width: 350, height: 650, alignment: .topLeading)
            .foregroundColor(Color("TextColor"))
        }
    }

struct InfoExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        InfoExplanationView(step: .constant(1)).environmentObject(UserData())
    }
}

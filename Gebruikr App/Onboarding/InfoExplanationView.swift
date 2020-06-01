//
//  InfoExplanationView.swift
//  LandingPage
//
//  Created by Reamon Hoefakker on 20/05/2020.
//  Copyright © 2020 Reamon Hoefakker. All rights reserved.
//

import SwiftUI

struct InfoExplanationView: View {
    //    @ObservedObject var userData : UserData = UserData()
    @State var showWeightExplanation = false
    @State var showGenderExplanation = false
    @EnvironmentObject var userData: UserData
    @State var resetCounter : Bool = false
    
    @Binding public var step: Int
    
    private var nextButton: some View {
        NavigationLink(destination: UserExplanationView(step: $step), isActive: $resetCounter){
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor)).onTapGesture {
                // Execute code here.
                self.userData.timeCount = 15
                self.resetCounter = true
            }
        }.navigationBarTitle("Gebruikr.", displayMode: .inline)
    }
    
    var body: some View {
        
        VStack{
            if userData.timeCount > 9{
                Text("Hiervoor heeft Gebruikr. wel wat info nodig").transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                    .font(.largeTitle).lineLimit(nil)
                    .frame(width: 350, height: 90, alignment: .leading)
                Spacer ()
                    .frame(height: 20)
            }
            
            VStack(alignment: .center) {
                if userData.timeCount > 10{
                    Text("Wil je weten waarom?").transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        .font(.headline)
                }
                if userData.timeCount > 11{
                    Text("Tap de icon!").transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        .font(.headline)
                }
            }
            
            VStack(alignment: .center) {
                Spacer ()
                    .frame(height: 60)
                if userData.timeCount > 12{
                    Button(action: {
                        self.showWeightExplanation = true
                    }) {
                        Image ("WeightIcon")
                            .frame(width: 110, height: 110, alignment: .center)
                    }.buttonStyle(PlainButtonStyle()).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        
                        .sheet(isPresented: $showWeightExplanation) {
                            
                            WeightExplanationView()
                            
                    }
                }
                
                Spacer ()
                    .frame(height: 20)
                if userData.timeCount > 13{
                    Button(action: {
                        self.showGenderExplanation = true
                    }) {
                        Image ("GenderIcon")
                            .frame(width: 110, height: 110, alignment: .center)
                    }.buttonStyle(PlainButtonStyle()).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        
                        .sheet(isPresented: $showGenderExplanation) {
                            
                            GenderExplanationView()
                    }
                }
            }
            Spacer()
            if userData.timeCount > 14{
                nextButton.transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
            }
            
        }.animation(.default).frame(width: 350, height: 650, alignment: .topLeading)
            .foregroundColor(Color("TextColor"))
        //                .onAppear{self.userData.timeCount = 0}
    }
}

struct InfoExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        InfoExplanationView(step: .constant(1)).environmentObject(UserData())
    }
}

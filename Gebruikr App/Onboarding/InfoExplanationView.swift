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
    @EnvironmentObject var timerData : TimerData
    @State var resetCounter : Bool = false
    
    @Binding public var step: Int
    
    private var nextButton: some View {
        NavigationLink(destination: UserExplanationView(step: $step).environmentObject(timerData), isActive: $resetCounter){
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor)).onTapGesture {
                // Execute code here.
                self.timerData.timeCount = 15
                self.resetCounter = true
            }
        }
    }
    
    var body: some View {
        
        VStack{
            if timerData.timeCount > 9{
                Text("Hiervoor heeft Gebruikr. wel wat info nodig").transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                    .font(.largeTitle).lineLimit(nil)
                    .frame(width: 350, height: 90, alignment: .leading)
                Spacer ()
                    .frame(height: 20)
            }
            
            VStack(alignment: .center) {
                if timerData.timeCount > 10{
                    Text("Wil je weten waarom?").transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        .font(.headline)
                }
                if timerData.timeCount > 11{
                    Text("Tap de icon!").transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        .font(.headline)
                }
            }
            
            VStack(alignment: .center) {
                Spacer ()
                    .frame(height: 60)
                if timerData.timeCount > 12{
                    Button(action: {
                        self.showWeightExplanation = true
                    }) {
                        Image ("WeightIcon").resizable()
                            .frame(width: 110, height: 125, alignment: .center)
                    }.buttonStyle(PlainButtonStyle()).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        
                        .sheet(isPresented: $showWeightExplanation) {
                            
                            WeightExplanationView()
                            
                    }
                }
                
                Spacer ()
                    .frame(height: 60)
                if timerData.timeCount > 13{
                    Button(action: {
                        self.showGenderExplanation = true
                    }) {
                        Image ("GenderIcon").resizable()
                            .frame(width: 130, height: 110, alignment: .center)
                    }.buttonStyle(PlainButtonStyle()).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        
                        .sheet(isPresented: $showGenderExplanation) {
                            
                            GenderExplanationView()
                    }
                }
            }
            Spacer()
            if timerData.timeCount > 14{
                nextButton.transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
            }
            
        }.animation(.default).frame(width: 350, height: 650, alignment: .topLeading)
            .navigationBarTitle("").navigationBarHidden(true).navigationBarBackButtonHidden(true).foregroundColor(Color("TextColor"))
    }
}

struct InfoExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        InfoExplanationView(step: .constant(1))
    }
}

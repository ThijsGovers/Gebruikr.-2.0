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
            Text("Volgende").foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor)).onTapGesture {
                // Execute code here.
                self.timerData.timeCount = 15
                self.resetCounter = true
            }
        }
    }
    
    var body: some View {
        
        ZStack{
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
        
        VStack{
            if timerData.timeCount > 9{
                Text("Hiervoor heeft Gebruikr.") .transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                    .font(.largeTitle).lineLimit(nil)
                Text("wel wat info nodig").transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                    .font(.largeTitle).lineLimit(nil).padding(.bottom, 10)
            }
            
            
            VStack(alignment: .center) {
                Spacer ()
                    .frame(height :20)

                if timerData.timeCount > 10{
                    Button(action: {
                        self.showWeightExplanation = true
                    }) {
                        Image ("WeightIcon").resizable()
                            .frame(width: 110, height: 125, alignment: .center).padding()
                    }.buttonStyle(PlainButtonStyle()).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        
                        .sheet(isPresented: $showWeightExplanation) {
                            
                            WeightExplanationView()
                            
                    }
                }
                
                Spacer ()
                    .frame(height: 20)
                if timerData.timeCount > 11{
                    Button(action: {
                        self.showGenderExplanation = true
                    }) {
                        Image ("GenderIcon").resizable()
                            .frame(width: 110, height: 125, alignment: .center).padding()
                    }.buttonStyle(PlainButtonStyle()).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        
                        .sheet(isPresented: $showGenderExplanation) {
                            
                            GenderExplanationView()
                    }
                }
                
                
                if timerData.timeCount > 12{
                    Text("Why?!").transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        .font(.largeTitle)
                }
                
                if timerData.timeCount > 13{
                    Text("Tap de icons!").transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        .font(.headline)
                }
            }
            Spacer()
            if timerData.timeCount > 14{
                nextButton.transition(AnyTransition.opacity.combined(with: .move(edge: .bottom))).padding()
            }
            Spacer()
            
        }.animation(.default).frame(width: 350, height: 650, alignment: .topLeading)
            .navigationBarTitle("").navigationBarBackButtonHidden(true).foregroundColor(Color("TextColor"))
    }
}
}

struct InfoExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        InfoExplanationView(step: .constant(1)).environment(\.colorScheme, .dark)
    }
}


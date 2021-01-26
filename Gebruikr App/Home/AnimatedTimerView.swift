//
//  AnimatedTimerView.swift
//  Gebruikr App
//
//  Created by Reamon Hoefakker on 19/01/2021.
//  Copyright © 2021 Sander Paping. All rights reserved.
//

import SwiftUI



struct AnimatedTimerView: View {
    @ObservedObject var modelTimerTwee = TimerViewModel()
    @EnvironmentObject var userData: UserData
    
    var body: some View {
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.3)
                    .foregroundColor(Color.white)

                Circle()
                    .trim(from: 0.0, to: CGFloat(min(modelTimerTwee.percentageTwee, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color("MainColor"))
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)

                

 //if userData.tripsitterActive {
                //modelTimerTwee.startTimerTwee()
            }.frame(width: 340, height: 340, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

    }
    
    
}


struct AnimatedTimerView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedTimerView().environmentObject(UserData()).environmentObject(TimerViewModel()).environment(\.colorScheme, .dark)
    }
}

//
//  AnimatedTimerView.swift
//  Gebruikr App
//
//  Created by Reamon Hoefakker on 19/01/2021.
//  Copyright © 2021 Sander Paping. All rights reserved.
//

import SwiftUI

class ViewModel : ObservableObject {
    @Published var percentage : Float = 0
    var timer : Timer?

    func timeElapsed () {
        print ("poing")
        if self.percentage + 0.1 > 1.2 {
            self.percentage = 0
        }
        else {
            self.percentage += 0.1
        }
    }
    
    func startTimer () {
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats:true) {_ in
            self.timeElapsed()
        }

    }
}

struct AnimatedTimerView: View {
    @ObservedObject var model = ViewModel()
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack {
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Circle()
                    .stroke(lineWidth: 5)
                    .opacity(0.3)
                    .foregroundColor(Color.white)

                Circle()
                    .trim(from: 0.0, to: CGFloat(min(model.percentage, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color("MainColor"))
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)

    //De button beneden moet vervangen worden met Tripsitteractivestate = true.            if userData.tripsitterActive {
                //model.startTimer()
                
                
            }
        .frame (width:320, height:320)
        .onAppear() {
                if userData.tripsitterActive == true{
                    model.startTimer()
                }
                
            }
        }

    }
    
    
}


struct AnimatedTimerView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedTimerView().environmentObject(UserData()).environment(\.colorScheme, .dark)
    }
}

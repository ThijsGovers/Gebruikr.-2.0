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
            Circle()
                .stroke(lineWidth: 5)
                .opacity(0.3)
                .foregroundColor(Color.gray)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(model.percentage, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.gray)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)

//De button beneden moet vervangen worden met Tripsitteractivestate = true.
            
            Button(action: {
                model.startTimer()
            }) {
                    Image (systemName: "play")
                        .font(Font.system(size: 50))
            }
            .buttonStyle(PlainButtonStyle())
            .padding()
        }
        .frame (width:80, height:80)

    }
    
    
}


struct AnimatedTimerView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedTimerView().environmentObject(UserData())
    }
}

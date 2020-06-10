//
//  ContentView.swift
//  Gebruikr gegevens
//
//  Created by Thijs Govers on 21/04/2020.
//  Copyright © 2020 Thijs Govers. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
            VStack{
                WizardView()
            }.navigationBarBackButtonHidden(true)
            .foregroundColor(Color("TextColor"))
    }
}
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView().environmentObject(UserData())
    }
}

struct WizardView : View{
    @State var step: Int = 0
    
    var body: some View{
        VStack{
            if step == 0 {
                InformationView(step: $step)
            }
            else if step == 1 {
                InfoExplanationView(step: $step)
            }
            else if step == 2 {
                UserExplanationView(step: $step)
            }
            else if step == 3 {
                NameView(step: $step)
            }
            else if step == 4 {
                GenderView(step: $step)
            }
            else if step == 5 {
                WeightView(step: $step)
            }
            else if step == 6 {
                InformationOverview(step: $step)
            }
        }
    }
}




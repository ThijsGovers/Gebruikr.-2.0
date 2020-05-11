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
        NavigationView {
            VStack{
                WizardView()
            }
            .navigationBarTitle("Gebruikr", displayMode: .inline).foregroundColor(Color("TextColor"))
        }
    }
}
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct WizardView : View{
    var backgroundColor = LinearGradient(gradient: Gradient(colors: [Color("SecondaryColor"), Color("MainColor")]), startPoint: .leading, endPoint: .trailing)
    
    
    private var nextButton: some View {
        Button(action: {
            self.step += 1
        }) {
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(backgroundColor))
        }
    }
    
    @State var step: Int = 0
    
    var body: some View{
        VStack{
            if step == 0 {
                InformationView()
                nextButton
            }
            else if step == 1 {
                NameView()
                nextButton
            }
            else if step == 2 {
                GenderView(step: $step)
                nextButton
            }
            else if step == 3 {
                WeightView()
                nextButton
            }
            else if step == 4 {
                InformationOverview()
                nextButton
            }
        }
    }
}




//
//  ContentView.swift
//  Gebruikr gegevens
//
//  Created by Thijs Govers on 21/04/2020.
//  Copyright © 2020 Thijs Govers. All rights reserved.
//

import SwiftUI

enum Gender {
    case male, female, unspecified
}


struct Information {
    
    var gender: Gender = .unspecified
}

struct OnboardingView: View {
    
    var body: some View {
        NavigationView {
            VStack{
                
                
               WizardView()
                
    }
            .navigationBarTitle("Gebruikr", displayMode: .inline).foregroundColor(Color.blue)
        }
        

}
}
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct WizardView : View{
    @State var step: Int = 0
    
    var body: some View{
        VStack{
            if step == 0 {
                NameView()
            }
            else if step == 1 {
                GenderView()
            }
            else if step == 2 {
                WeightView()
            }
            Button(action: {
                self.step += 1
            }) {
                Text("Volgende")
            }
        }
    }
}




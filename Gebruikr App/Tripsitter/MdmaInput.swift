//
//  ContentView.swift
//  Gebruikr
//
//  Created by Raymond van Dongelen on 15/04/2020.
//  Copyright © 2020 Raymond van Dongelen. All rights reserved.
//

import SwiftUI

struct MdmaInput: View {
    func makeUserData () -> UserData {
        let g = UserData()
        g.weight = 100
        
        return g
    }
    var body: some View {
        MdmaWizard(userData: makeUserData())
    }
}

struct MdmaWizard : View {
    @ObservedObject var userData : UserData
    
    @State var step : Int = 0
    @State var mdmInMG : String = ""
    
    func mdmaScreen () -> AnyView {
        switch (userData.mdma) {
            case .unspecified: return AnyView (
                VStack {
                    Text ("Vul in")
                    TextField ("", text: $mdmInMG)
                    
                    Button(action: {
                        self.userData.mdma = .specified(amountInMG: Int (self.mdmInMG)!) // <--dit is riskant
                    }) {
                        Text("Voer mdma in")
                    }

                    
                    Button(action: {
                        self.userData.mdma = .unknown
                    }) {
                        Text("Weet ik niet")
                    }
                }
            )
            case .unknown: return AnyView (
                Text ("Even testen joh, hoeveelheid is nu \(userData.mdma.amountInMg)")
            )
            case .specified( _): return AnyView (
                Text("De hoeveelheid mdma in de pil is \(userData.mdma.amountInMg)")
            )
        }
    }
    
    var body : some View {
        VStack {
            mdmaScreen()

        }
    }
}

struct MdmaInput_Previews: PreviewProvider {
    static var previews: some View {
        MdmaInput()
    }
}



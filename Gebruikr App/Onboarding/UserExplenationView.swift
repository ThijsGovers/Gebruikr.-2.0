//
//  ContentView.swift
//  LandingPage
//
//  Created by Reamon Hoefakker on 13/05/2020.
//  Copyright © 2020 Reamon Hoefakker. All rights reserved.
//

import SwiftUI

struct UserExplanationView: View {
    @Binding public var step: Int

    
    private var nextButton: some View {
        NavigationLink(destination: NameView(step: $step)){
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
        }.navigationBarTitle("Gebruikr.", displayMode: .inline)
    }
    
    var body: some View {
        
        VStack {
        VStack(alignment: .leading) {
            Text("Oh,")
                .font(.largeTitle)
            Text("En no worries.")
                .font(.title)
            Spacer ()
                .frame(height: 20)
            Text("Gebruikr.  deelt niets.")
                .font(.title)
            Text("Niks, nada, noppes.")
                .font(.headline)
            Spacer ()
                .frame(height: 50)
            Text("Alle informatie die je deelt blijft van jou, en jou alleen!")
                .font(.headline)
            }
            Spacer()
            
            VStack{
                Text("Let's Go!")
                    .font(.title)
                NavigationLink(destination: NameView(step: $step)){
                Image("GebruikrIcon")
                .frame(width: 90, height: 90)
                }.buttonStyle(PlainButtonStyle())

            }
        }.frame(width: 350, height: 600, alignment: .topLeading)
        .foregroundColor(Color("TextColor"))
    }
}

struct UserExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        UserExplanationView(step: .constant(2)).environmentObject(UserData())
    }
}	

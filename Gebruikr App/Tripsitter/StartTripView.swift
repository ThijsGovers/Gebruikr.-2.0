//
//  StartTripView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 30/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct StartTripView: View {
    @EnvironmentObject var userData: UserData
    @State var startTrip : Bool = false
    
    @State var minutes: Double = 0
    
    var body: some View {
        VStack{
            Text("Over hoeveel tijd  ga je gebruiken?").padding(30).font(.title)
            Spacer()
            Slider(value: $minutes, in: 00...30, step: 5).padding(.horizontal,30)
            Text("\(minutes, specifier: "%.0f") Min").font(.title)
            Spacer()
            NavigationLink(destination: DoorgegevenView().navigationBarTitle("Tripsitter", displayMode: .inline), isActive: $startTrip){
                Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor)).onTapGesture {

                    self.userData.addPill(intakeTime: self.minutes * 60)
                    self.userData.mdma = .unspecified
                    self.startTrip = true
                }
            }
        }.padding(.top, 50).foregroundColor(Color("TextColor"))
        
    }
}

struct StartTripView_Previews: PreviewProvider {
    static var previews: some View {
        StartTripView().environmentObject(UserData())
    }
}

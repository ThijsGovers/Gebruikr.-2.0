//
//  DoorgegevenView.swift
//  LandingPage
//
//  Created by Reamon Hoefakker on 04/06/2020.
//  Copyright © 2020 Reamon Hoefakker. All rights reserved.
//

import SwiftUI

struct DoorgegevenView: View {
    @State var showbijneemtip = false
    @EnvironmentObject var userData: UserData
    var body: some View {
        VStack{
            Text("Thanks voor het doorgeven!").font(.title)
        ScrollView(.vertical) {
            VStack{
                
            if(userData.tripsitterActive == false){
            TipBoxView(header: "Effecten", image: "", paragraph: "De effecten van XTC zal je na 30 - 60 minuten wel gaan voelen en houden ongeveer tot 4 uur aan. Let wel op dat je niet te snel bijneemt!")
                }
                
            else {
            //Deze tip moet worden opgeroepen wanneer tripsittr active = true
            TipBoxView(header: "Effecten", image: "", paragraph: "Over het algemeen kickt het bijnemen van XTC wat sneller in. Houd hier rekening mee!")
                }
                Text("Tips").font(.title)
                
            TipBoxView(header: "App je vrienden", image: "Whapp icon", paragraph: "Laat je vrienden even weten dat je gaat bijnemen. Dan zijn zij in ieder geval ook op de hoogte")
                
            TipBoxView(header: "Drink niet te veel", image: "drink icon", paragraph: "zorg dat je ongeveer 1 tot 2 glazen per uur drinkt. Met een droge mond drink al snel te veel")
                
            TipBoxView (header: "Ga je een beetje hard?", image: "te hard gaan icon", paragraph: "Geef het even aan bij je vrienden en zoek even een rustige plek om te zitten.")
                
                Spacer()
                            
            }
        }
            NavigationLink(destination: BottomBarView()){
                Text("Home").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
            }

        }.foregroundColor(Color("TextColor"))
    }
}

struct DoorgegevenView_Previews: PreviewProvider {
    static var previews: some View {
        DoorgegevenView().environmentObject(UserData())
    }
}

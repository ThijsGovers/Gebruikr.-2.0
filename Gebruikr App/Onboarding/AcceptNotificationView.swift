//
//  AcceptNotificationView.swift
//  Gebruikr App
//
//  Created by Reamon Hoefakker on 18/06/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import UserNotifications
import SwiftUI

struct AcceptNotificationView: View {
    @State var alertShown: Bool = false
    @State var showNotificationExplanation: Bool = false
    
    var body: some View {
        
        ZStack{
            Color("systemGray6")
                .edgesIgnoringSafeArea(.all)
            
        VStack {
            Spacer().frame(height: 20)
            ExplanationTitleView (title: "Gebruikr. notifacties")
            ExplanationSectionView(header: "Waarom?", paragraph: "Gebruikr. zal jouw mobiele tripsitter zijn, accepteer de notifiacties zodat hij met jou in contact kan blijven!")
            Spacer()
            Button(action: {
                self.showNotificationExplanation = true
            }) {
                Text("Tap hier voor meer informatie").font(.caption)
                .foregroundColor(Color("TextColor"))
                ZStack(alignment: .topTrailing ){
                
                    
                        Image (systemName: "bubble.left.fill").resizable()
                            .frame(width: 80, height: 80).foregroundColor(Color("TextColor"))
                        Image ("Info").resizable()
                            .frame(width: 30, height: 30)
                        
                    
                }.frame(width: 90, height: 90).padding()
                    .background(Color("BackgroundPillsUsed"))
                    .cornerRadius(10).shadow(radius: 2)
                    
            }.buttonStyle(PlainButtonStyle()).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                
                .sheet(isPresented: $showNotificationExplanation) {
                    
                    NotificationExplanationView()
            }
            Spacer()
            
            if(self.alertShown == true){
                NavigationLink(destination: BottomBarView()){
                    Text("Home").frame(width: 70).foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
                }
            } else{
                Button(action: {
                    
                    UNUserNotificationCenter.current()
                        .requestAuthorization(options: [.alert, .badge, .sound])  { success, error in
                            if success {
                                print ("All set!")
                                self.alertShown = true
                            } else if let error = error {
                                print(error.localizedDescription)
                                self.alertShown = true
                            }
                    }
                }) {
                    Text("Accepteren").frame(width: 100).foregroundColor(Color.black).padding(12).background(Capsule().fill(Color.backgroundColor))
                }.buttonStyle(PlainButtonStyle())
                
            }
        }
    }
}

struct TestNotView {
    var body: some View {
        Button ("Schedule Notification") {
            let content = UNMutableNotificationContent ()
            content.title = "🍹🏝Hey Sugar 🏝🍹"
            content.subtitle = "Ga je lekker? Misschien is een fanta wel wat voor jou😏"
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
        }
    }
}
}

struct AcceptNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptNotificationView().environment(\.colorScheme, .dark)
    }
}


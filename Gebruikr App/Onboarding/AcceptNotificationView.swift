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
    var body: some View {
        VStack {
            Button(action: {
                
                UNUserNotificationCenter.current()
                    .requestAuthorization(options: [.alert, .badge, .sound])  { success, error in
                        if success {
                            print ("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                            
                        }
                    }
            }) {
                Image("DrieKwart")
                    .frame(width: 150, height: 60, alignment: .center)
            }.buttonStyle(PlainButtonStyle())
            
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



struct AcceptNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptNotificationView()
    }
}

//
//  SettingsForm.swift
//  Gebruikr App
//
//  Created by Sander Paping on 28/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct SettingsForm: View {
    @State var addPill: Bool = false
    @State var food: Bool = false
    @State var drinking: Bool = false
    @State var rest: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var userData : UserData = UserData()
    var genders = ["Man", "Vrouw", "n.v.t."]
    @State var refresh: Bool = false
    
    init() {
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nickname"), content: {
                TextField("Username", text: $userData.username).padding(2).textFieldStyle(RoundedBorderTextFieldStyle())
                })
                Section(header: Text("App data"), content: {
                    Picker(selection: $userData.gender, label: Text("Geslacht")) {
                        ForEach(genders, id: \.self) { gender in
                            Text(gender)
                        }
                    }
                    Stepper(value: $userData.weight, in: 40...150) {
                        
                        HStack {
                            Text("Gewicht")
                            Spacer()
                            Text("\(userData.weight, specifier: "%.0f") kg")
                        }
                    }
                    Text("Ervaring").foregroundColor(.red)
                })
                
                Section(header: Text("Reminders"), footer: Text("None of those action are working yet ;)"), content: {
                    
                    Toggle(isOn: $addPill) {
                        Text("Bijnemen")
                    }
                    Toggle(isOn: $food) {
                        Text("Eten")
                    }
                    Toggle(isOn: $drinking) {
                        Text("Drinken")
                    }
                    Toggle(isOn: $rest) {
                        Text("Uitrusten")
                    }
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("0.0.1")
                    }
                    
                })
                Section {
                    Button(action: {
                        self.userData.resetAll()
                        self.refresh.toggle()
                    }) {
                        Text("Reset All Settings")
                    }
                }
            }.navigationBarItems(
                trailing: Button(action: {
                    self.userData.calculatePillAdvice()
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Opslaan").foregroundColor(Color("TextColor")).font(.headline)
                }))
                .navigationBarTitle(Text("Instellingen").foregroundColor(Color("TextColor"))).accentColor(Color("TextColor"))
        }
    }
}

struct SettingsForm_Previews: PreviewProvider {
    static var previews: some View {
        SettingsForm()
    }
}

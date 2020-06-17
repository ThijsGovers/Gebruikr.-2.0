//
//  UserData.swift
//  Gebruikr App
//
//  Created by Sander Paping on 11/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI
import Combine
import Foundation
enum Gender: String {
    case male = "Man"
    case female = "Vrouw"
    case unspecified = "n.v.t."
}

enum Experience {
    case experienced, unexperienced
}

enum Parts : String, Codable{
    case full, threeQuarters, half, quarter, unspecified
}

enum MDMAPillSpecification {
    case unspecified, unknown
    case specified (amountInMG : Double)
    
    var amountInMg : Double {
        if case let MDMAPillSpecification.specified(amountInMG) = self {
            return amountInMG
        }
        else {
            return 172 // Sensible default
        }
    }
}

struct TripAdvice {
    var amountInQuarters : Int
    var explanation : String
}

class TimerData : ObservableObject {
    
    @Published var timeCount = 0
    var timer : Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
    }
    
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
}

struct Pill: Identifiable, Codable{
    var id = UUID()
    var partsAmount: Parts
    var partMg: Double
    var time: Date
}

// Single source of truth
class UserData: ObservableObject  {
    
    @Published var pillsUsed: [Pill] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(pillsUsed) {
                UserDefaults.standard.set(encoded, forKey: "pillsUsed")
            }
        }
    }
    
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    
    @Published var gender: String {
        didSet {
            UserDefaults.standard.set(gender, forKey: "gender")
        }
    }
    @Published var weight: Double {
        didSet {
            UserDefaults.standard.set(weight, forKey: "weight")
        }
    }
    
    @Published var tripsitterActive: Bool {
        didSet {
            UserDefaults.standard.set(tripsitterActive, forKey: "tripsitterActive")
        }
    }
    
    @Published var pillAmount : Double = 0
    @Published var partsAmount: Parts = .unspecified
    @Published var currentPage: String
    @Published var experience : Experience?
    @Published var mdma : MDMAPillSpecification = .unspecified
    @Published var partMg : Double = 0
    @Published var hoursSinceLastPill: Int = 0
    @Published var minutesSinceLastPill: Int = 0
    
    init() {
        if let pillsUsed = UserDefaults.standard.data(forKey: "pillsUsed") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Pill].self, from: pillsUsed) {
                
                self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
                self.gender = UserDefaults.standard.object(forKey: "gender") as? String ?? "n.v.t."
                self.weight = UserDefaults.standard.object(forKey: "weight") as? Double ?? 60
                
                //        UserDefaults.standard.set(false, forKey: "tripsitterActive")
                self.tripsitterActive = UserDefaults.standard.object(forKey: "tripsitterActive") as? Bool ?? false
                self.pillsUsed = []
                
                //            UserDefaults.standard.set(false, forKey: "didLaunchBefore")
                if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
                    UserDefaults.standard.set(true, forKey: "didLaunchBefore")
                    currentPage = "OnboardingView"
                } else {
                    currentPage = "BottomBarView"
                }
                
                self.pillsUsed = decoded
                getTime()
                return
            }
        }
        
        self.pillsUsed = []
        
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.gender = UserDefaults.standard.object(forKey: "gender") as? String ?? "n.v.t."
        self.weight = UserDefaults.standard.object(forKey: "weight") as? Double ?? 60
        
        //        UserDefaults.standard.set(false, forKey: "tripsitterActive")
        self.tripsitterActive = UserDefaults.standard.object(forKey: "tripsitterActive") as? Bool ?? false
        
        //            UserDefaults.standard.set(false, forKey: "didLaunchBefore")
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "OnboardingView"
        } else {
            currentPage = "BottomBarView"
        }
        
    }
    
    // update timer homeview
    func getTime(){
        let lastPill = pillsUsed.last
        let lastPillUsed = lastPill?.time ?? Date()
        let currentDate = Date()
        let timeSinceLastPill = currentDate - lastPillUsed
        hoursSinceLastPill = Int(timeSinceLastPill) / 3600
        minutesSinceLastPill = (Int(timeSinceLastPill) % 3600) / 60
    }
    
    // reset alle userdefaults
    func resetAll() {
        UserDefaults.standard.set(false, forKey: "didLaunchBefore")
        UserDefaults.standard.set(false, forKey: "tripsitterActive")
        UserDefaults.standard.set("", forKey: "username")
        UserDefaults.standard.set("n.v.t.", forKey: "gender")
        UserDefaults.standard.set(60, forKey: "weight")
        self.pillsUsed = []
    }
    
    // voeg pill to aan array
    func addPill(intakeTime: Double) {
        pillsUsed.append(Pill(partsAmount: partsAmount, partMg: partMg, time: Date().addingTimeInterval(intakeTime)))
        getTime()
    }
    
    // telt het mg mdma van alle genomen pillen bij elkaaar op
    func getTotalMg() -> Double{
        var sum : Double = 0
        for pill in pillsUsed {
            sum = sum + pill.partMg
        }
        return sum
    }
    
    // berekent het max mg wat de gebruikr mag hebben
    func calculatePillAdvice() -> Double {
        var maxMgPill : Double = 0
        let workingWeight = weight
        if gender == "Man" {
            maxMgPill = 1.25 * workingWeight
        } else if gender == "Vrouw"{
            maxMgPill = workingWeight
        }
        
        return maxMgPill
        
    }
    
    // berekent het aantal mg voor de pilkeuze
    func calculatePartAmount (){
        if partsAmount == .full{
            partMg = mdma.amountInMg
        } else if partsAmount == .threeQuarters{
            partMg = mdma.amountInMg * 0.75
        }
        else if partsAmount == .half{
            partMg = mdma.amountInMg * 0.5
        }
        else if partsAmount == .quarter{
            partMg = mdma.amountInMg * 0.25
        }
    }
    
    //berekent het advies
    func calculateAdvice() -> AnyView{
        var maxMgPill: Double = 0
        maxMgPill = calculatePillAdvice() - getTotalMg()
        
        if (maxMgPill < mdma.amountInMg * 0.25){
            return AnyView(
            HStack{
                Text("neem niet meer bij plss")
            }.padding(.bottom,5)
                )
        } else if (maxMgPill < mdma.amountInMg * 0.5 ){
            return AnyView(
            HStack{
                Text("1 X").font(.headline)
                Image("Kwart").resizable()
                    .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                Text("Kwartje - \(mdma.amountInMg * 0.25, specifier: "%.0f") mg")
            }.padding(.bottom,5)
                )
        } else if (maxMgPill < mdma.amountInMg * 0.75){
            return AnyView(
            HStack{
                Text("1 X").font(.headline)
                Image("Half").resizable()
                    .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                Text("Halfje - \(mdma.amountInMg * 0.5, specifier: "%.0f") mg")
            }.padding(.bottom,5)
                )
        } else if (maxMgPill < mdma.amountInMg){
            return AnyView(
            HStack{
                Text("1 X").font(.headline)
                Image("Driekwart").resizable()
                    .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                Text("Driekwart - \(mdma.amountInMg * 0.75, specifier: "%.0f") mg")
            }.padding(.bottom,5)
                )
        }
        else if (maxMgPill == mdma.amountInMg){
            return AnyView(
            HStack{
                Text("1 X").font(.headline)
                Image("Hele").resizable()
                    .frame(width: 20.0, height: 20.0).foregroundColor(Color("TextColor"))
                Text("Hele - \(mdma.amountInMg, specifier: "%.0f") mg")
            }.padding(.bottom,5)
                )
        }
        return AnyView(Text("hallo"))
        
    }
    
}

//extension voor het berekenen van de tijddelta tussen de laatstgenomen pil en de huidige tijd
extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}

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
    //    let id: Int
    var partsAmount: Parts
    var partMg: Double
    var time: Date
}


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
    @Published var maxMg : Double = 0
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
                
//                maxMg = 0
//                partMg = 0
//                mdma = .unspecified
//                pillAmount = 0
//                partsAmount = .unspecified
//                calculatePillAdvice()
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
        
//        maxMg = 0
//        partMg = 0
//        mdma = .unspecified
//        pillAmount = 0
//        partsAmount = .unspecified
//        calculatePillAdvice()
        
    }
    
    
    //
    //    func calculateTripAdvice () -> TripAdvice {
    //        var workingWeight = weight
    //        if gender == "Man" {
    //            workingWeight *= 1.25
    //        } else if gender == "Vrouw"{
    //            workingWeight *= 1
    //        }
    //
    //        let amount = Int(floor(workingWeight / (Double(mdma.amountInMg) / 4)))
    //
    //        return TripAdvice(amountInQuarters: amount, explanation: "Hier de berekening uitleggen of zo?")
    //    }
    
    
    
    
    func getTime(){
        let lastPill = pillsUsed.last
        let lastPillUsed = lastPill?.time ?? Date()
        let currentDate = Date()
        let timeSinceLastPill = currentDate - lastPillUsed
        hoursSinceLastPill = Int(timeSinceLastPill) / 3600
        minutesSinceLastPill = (Int(timeSinceLastPill) % 3600) / 60
    }
    
    func resetAll() {
        UserDefaults.standard.set(false, forKey: "didLaunchBefore")
        UserDefaults.standard.set(false, forKey: "tripsitterActive")
        UserDefaults.standard.set("", forKey: "username")
        UserDefaults.standard.set("n.v.t.", forKey: "gender")
        UserDefaults.standard.set(60, forKey: "weight")
        self.pillsUsed = []
    }
    
    func addPill() {
        pillsUsed.append(Pill(partsAmount: partsAmount, partMg: partMg, time: Date()))
        getTime()
    }
    
    func getTotalMg() -> Double{
        var sum : Double = 0
        for pill in pillsUsed {
            sum = sum + pill.partMg
        }
        return sum
    }
    
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
    
    func calculateAdvice(){
        var maxMgPill: Double = 0
        var part: Double = 0
        maxMgPill = calculatePillAdvice() - getTotalMg()
        
        if partsAmount == .full{
            part = mdma.amountInMg
        } else if partsAmount == .threeQuarters{
            part = mdma.amountInMg * 0.75
        }
        else if partsAmount == .half{
            part = mdma.amountInMg * 0.5
        }
        else if partsAmount == .quarter{
            part = mdma.amountInMg * 0.25
        }
        
        if (part > maxMgPill){
            
        }
        
        
    }
    
}

extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}

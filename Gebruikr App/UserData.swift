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
enum Gender {
    case male, female, unspecified
}

enum Experience {
    case experienced, unexperienced
}

enum MDMAPillSpecification {
    case unspecified, unknown
    case specified (amountInMG : Int)
    
    var amountInMg : Int {
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

struct AdvicePill {
    var maxAmount : Double
}


class UserData: ObservableObject  {
    
    init() {
//            UserDefaults.standard.set(false, forKey: "didLaunchBefore")
           if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
               UserDefaults.standard.set(true, forKey: "didLaunchBefore")
               currentPage = "OnboardingView"
           } else {
               currentPage = "BottomBarView"
           }
       }
       
    @Published var currentPage: String
    @Published var gebruikrName: String = ""
    @Published var gender: Gender = .unspecified
    @Published var weight: Double = 60
    @Published var experience : Experience?
    @Published var mdma : MDMAPillSpecification = .unspecified
    @Published var maxMg : Double = 160
    //    @Published var maxMg : Double = AdvicePill(maxAmount: Double)

    
    func calculateTripAdvice () -> TripAdvice {
        var workingWeight = weight
        if gender == .male {
            workingWeight *= 1.25
        } else if gender == .female{
            workingWeight *= 1
        }
        
        let amount = Int(floor(workingWeight / (Double(mdma.amountInMg) / 4)))
        
        return TripAdvice(amountInQuarters: amount, explanation: "Hier de berekening uitleggen of zo?")
    }
    
    func calculatePillAdvice () -> AdvicePill {
        var amount: Double = 0
        if gender == .male {
            amount = weight * 1.25
        } else if gender == .female{
            amount = weight * 1
        }
        
        return AdvicePill(maxAmount: amount)
    }

}

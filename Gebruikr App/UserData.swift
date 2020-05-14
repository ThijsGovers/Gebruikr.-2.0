//
//  UserData.swift
//  Gebruikr App
//
//  Created by Sander Paping on 11/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI
import Combine

class UserData: ObservableObject  {
    
    enum Gender {
        case male, female, unspecified
    }

    
    @Published var gebruikrName: String = ""
    @Published var gender: Gender = .unspecified
    @Published var weight: Double = 60
//    @Published var test: String = "test"

}

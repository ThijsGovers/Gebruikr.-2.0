//
//  ColorManager.swift
//  Gebruikr App
//
//  Created by Sander Paping on 22/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

// ColorManager.swift created by Brady Murphy
import SwiftUI

struct ColorManager {
    // create static variables for custom colors
    static let mainColor = Color("MainColor")
    
    static let secondaryColor = Color("SecondaryColor")
    
    var gradientColor1 = LinearGradient(gradient: Gradient(colors: [mainColor, secondaryColor]), startPoint: .top, endPoint: .bottom)

    //... add the rest of your colors here
}

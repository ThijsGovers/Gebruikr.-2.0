//
//  BottomBarItem.swift
//  BottomBar
//
//  Created by Sander Paping on 20/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//


import SwiftUI

public struct BottomBarItem {
    public let icon: String
    public let title: String
    public let color: Color
    
    public init(icon: String,
                title: String) {
        self.icon = icon
        self.title = title
        self.color = Color("TextColor")
    }
}

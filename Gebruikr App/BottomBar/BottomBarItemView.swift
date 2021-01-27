//
//  BottomBarItemView.swift
//  BottomBar
//
//  Created by Sander Paping on 20/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

public struct BottomBarItemView: View {
    public let isSelected: Bool
    public let item: BottomBarItem
    
    public var body: some View {
        VStack {
            
            if isSelected {
                Image(item.icon)
                    .imageScale(.large)
                    .foregroundColor(Color("MainColor"))
                
                Text(item.title)
                    .foregroundColor(item.color)
                
            }
            else{
                Image(item.icon)
                    .foregroundColor(.white)
                Text(item.title)
                    .foregroundColor(.white).font(.system(size: 11))

            }
        }
        
    }
}

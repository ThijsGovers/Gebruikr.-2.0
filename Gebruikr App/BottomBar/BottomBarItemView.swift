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
            Image(systemName: item.icon)
                .imageScale(.large)
                .foregroundColor(isSelected ? item.color : .white)
            
            if isSelected {
                Text(item.title)
                    .foregroundColor(item.color)
            }
            else{
                Text(item.title)
                    .foregroundColor(.white).font(.system(size: 11))
            }
        }
        .padding(isSelected ? 15 : 0)
        .background(
            Circle()
                .fill(isSelected ? Color.white : Color.clear)
        )
    }
}

//
//  BottomBar.swift
//  BottomBar
//
//  Created by Sander Paping on 20/04/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

public struct BottomBar : View {
    
    var backgroundColor = LinearGradient(gradient: Gradient(colors: [Color("SecondaryColor"), Color("MainColor")]), startPoint: .leading, endPoint: .trailing)
    
    @Binding public var selectedIndex: Int
    
    public let items: [BottomBarItem]
    
    public init(selectedIndex: Binding<Int>, items: [BottomBarItem]) {
        self._selectedIndex = selectedIndex
        self.items = items
    }
    
    func itemView(at index: Int) -> some View {
        Button(action: {
            self.selectedIndex = index
        }) {
            BottomBarItemView(isSelected: index == selectedIndex, item: items[index])
        }
    }
    
    public var body: some View {
        HStack(alignment: .center) {
            ForEach(0..<items.count) { index in
                self.itemView(at: index)
                
                if index != self.items.count-1 {
                    Spacer().frame(width: -3)
                }
            }
        }
        .padding()
        .frame(width: 420, height: 110)
        .background(backgroundColor)
    
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -2)
        .edgesIgnoringSafeArea(.bottom)
    }
}


#if DEBUG
struct BottomBar_Previews : PreviewProvider {
    static var previews: some View {
        BottomBar(selectedIndex: .constant(2), items: [
            BottomBarItem(icon: "tracker", title: "Tracker"),
            BottomBarItem(icon: "test services", title: "Testen"),
            BottomBarItem(icon: "home icon", title: "Home"),
            BottomBarItem(icon: "drugs info", title: "Drugs"),
            BottomBarItem(icon: "ehbo", title: "EHBO")        ])
    }
}
#endif


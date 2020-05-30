//
//  useAmountView.swift
//  Gebruikr App
//
//  Created by Sander Paping on 30/05/2020.
//  Copyright © 2020 Sander Paping. All rights reserved.
//

import SwiftUI

struct useAmountView: View {
    var body: some View {
        VStack{
            amountButtonsView().padding(.bottom, 50)
            PillAdvice()
            Spacer()
        }.padding(.top, 50)
    }
}

struct useAmountView_Previews: PreviewProvider {
    static var previews: some View {
        useAmountView()
    }
}

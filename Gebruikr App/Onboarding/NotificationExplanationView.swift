//
//  NotificationExplanationView.swift
//  LandingPage
//
//  Created by Reamon Hoefakker on 10/06/2020.
//  Copyright © 2020 Reamon Hoefakker. All rights reserved.
//

import UserNotifications
import SwiftUI

struct NotificationExplanationView: View {
    var body: some View {
        VStack {
            ExplanationTitleView(title: "Waarom wilt Gebruikr. mij notificaties sturen?")
            
            ExplanationSectionView(header: "Gebruikr. wilt met jou communiceren!", paragraph: "Om te zorgen dat Gebruikr. jou goed kan ondersteunen op een festival, is het nodig om notificaties naar jou te kunnen sturen.")
            
            ExplanationSectionView(header: "Wat voor notificaties krijg ik?", paragraph: "Deze notificaties zullen voornamelijk over tips gaan en je herinneringen sturen over bijvoorbeeld eten en drinken.")
            
            ExplanationSectionView(header: "How you doin?😏", paragraph: "Verder zal Gebruikr.  je af en toe vragen hoe het met je gaat, zodat jij aan kan geven hoe het gaat en Gebruikr.  jou hier nog wat extra tips over kan geven als het even niet zo goed gaat!")
            Spacer()
            
            AcceptNotificationView()
        }
    }
}

struct NotificationExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationExplanationView()
    }
}

//
//  HomeView.swift
//  K-R-B
//
//  Created by Omar Khaled on 21/10/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        if settings.loggedIn {
            return AnyView(HomeTappedView())
        }else{
            return AnyView(LoginView())
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

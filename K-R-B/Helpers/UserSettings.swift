//
//  UserSettings.swift
//  K-R-B
//
//  Created by Omar Khaled on 25/10/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var loggedIn: Bool = CustomerController.customerExist()
    @Published var cart = Cart()
}

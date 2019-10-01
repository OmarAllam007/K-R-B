//
//  Cart.swift
//  K-R-B
//
//  Created by Omar Khaled on 25/10/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import SwiftUI

struct Cart: View {
    var body: some View {
        ZStack(alignment: .trailing){
            Image("products", bundle: nil, label: Text("Products"))
            Text("1")
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}

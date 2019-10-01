//
//  HomeTappedView.swift
//  K-R-B
//
//  Created by Omar Khaled on 25/10/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import SwiftUI


struct HomeTappedView: View {
    @State private var badgeNumber: Int = 1
    private var badgePosition: CGFloat = 2
    private var tabsCount: CGFloat = 5
    
    @EnvironmentObject var cart:Cart

    
    var body: some View {
        
        GeometryReader{ geometry in
            
            ZStack(alignment: .bottomLeading) {
                TabView{
                    ProductsView().tabItem{
                        Image("products")
                            .foregroundColor(MAIN_COLOR)
                        Text("Products")
                    }.tag(0)
                    
                    CartView().tabItem{
                        ZStack{
                            Image("cart")
                                .foregroundColor(MAIN_COLOR)
                            Text("Cart").font(.caption)
                            
                        }
                    }.tag(1)
                    
                    Text("Orders").tabItem{
                        Image("orders")
                            .foregroundColor(MAIN_COLOR)
                        Text("orders")
                    }.tag(2)
                    
                    Text("Inquires").tabItem{
                        Image("inquiry")
                            .foregroundColor(MAIN_COLOR)
                        Text("Inquiries")
                    }.tag(3)
                    
                    Text("Profile").tabItem{
                        Image("user")
                            .foregroundColor(MAIN_COLOR)
                        Text("Profile")
                    }.tag(4)
                }.accentColor(MAIN_COLOR)
                
                
                ZStack {
                    Circle()
                        .foregroundColor(.red)
                    
                    Text("\(self.cart.items.count)")
                        .foregroundColor(.white)
                        .font(Font.system(size: 12))
                }
                .frame(width: 20, height: 20)
                .offset(x: ( ( 2 * self.badgePosition) - 1 ) * ( geometry.size.width / ( 2 * self.tabsCount ) ), y: -30)
                .opacity(self.badgeNumber == 0 ? 0 : 1)
            }
        }
        
    }
}

struct HomeTappedView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeTappedView()
    }
}

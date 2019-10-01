
//
//  CartView.swift
//  K-R-B
//
//  Created by Omar Khaled on 21/10/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cart:Cart
    @State var quantity:String = ""
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(red: 229/255, green: 34/255, blue: 77/255,alpha:1.0)
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
    }
    
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    
                    ForEach(cart.items){ product in
                                        HStack{
                                            Image("prodcut_img")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(Rectangle())
                                                .shadow(radius: 2.0)
                        
                                    
                                            VStack{
                                                Text(product.name)
                                                    .font(.headline)
                                                
                                                Text(product.description)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                            }
                                            Spacer()
                                            
                                            VStack{
                                                Text("Quantity")
                                                    .font(.callout)
                                                TextField("", text: self.$quantity)
                                                    .keyboardType(.numberPad)
                                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                                    .stroke(MAIN_COLOR, lineWidth: 1))
                                                
                                            }
                                            
                                            
                                        }.padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(MAIN_COLOR, lineWidth: 1)
                                        )
                                    }
                }
                
                
            }
            .navigationBarTitle(
                Text("Cart")
                    .foregroundColor(MAIN_COLOR)
                    . 
            )
        }.background(Color.gray)
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

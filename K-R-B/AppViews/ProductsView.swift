//
//  ProductsView.swift
//  K-R-B
//
//  Created by Omar Khaled on 21/10/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import SwiftUI

struct ProductsView: View {
    
    let productsObj = ProductController()
    @State var products: [Product] = []
    @State var filteredProducts: [Product] = []
    @State private var filterType = 0
    @EnvironmentObject var cart:Cart
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                Picker(selection: $filterType, label: Text("Select Type")) {
                    Text("All").tag(0)
                    Text("Concrete").tag(1)
                    Text("Block").tag(2)
                }.pickerStyle(SegmentedPickerStyle()).padding()
                
                
                List{
                    
                    ForEach(self.filteredProducts.filter{self.filterType > 0 ? $0.type == self.filterType : true}) { product in
                        HStack{
                            
                            
                            Image("prodcut_img")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .padding()
                                .shadow(radius: 2)
                            
                            VStack{
                                Text(product.name)
                                    .font(.headline)
                                
                                Text(product.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            
                            Spacer()
                            
                            Image(systemName: "cart.badge.plus")
                                .resizable()
                                .frame(width: 35, height: 30,alignment: .trailing)
                                .foregroundColor(MAIN_COLOR)
                                .padding()
                                .shadow(radius: 1.0)
                                
                                .onTapGesture {
                                    self.addToCart(product:product)
                            }
                            .animation(.easeOut)
                            .opacity(!self.cart.hasProduct(product: product) ? 1 : 0)
                            
                            
                            
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(MAIN_COLOR, lineWidth: 1)
                        )
                        
                    }
                    
                    
                }
                
                    
                .navigationBarTitle(Text("Products").foregroundColor(MAIN_COLOR))
                
                
            }
            
            
        }.onAppear(perform: fetch)
            .background(Image("bg2").resizable())
        
        
        
    }
    
    private func addToCart(product:Product){
        cart.addToCart(product: product)
    }
    
    private func fetch() {
        if self.products.count > 0 {
            return
        }
        productsObj.getAllProducts { (products) in
            self.products = products
            self.filteredProducts = products
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}

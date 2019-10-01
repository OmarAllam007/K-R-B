//
//  Cart.swift
//  K-R-B
//
//  Created by Omar Khaled on 27/10/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation
import Combine

class Cart: ObservableObject {
    
    @Published var items:[Product] = []
    
    init() {
        self.items = self.getItems()
    }
    func getItems() ->[Product] {
        
        guard let data = UserDefaults.standard.object(forKey: "products") as? Data else {
            return []
        }
        
        let products = try! JSONDecoder().decode([Product].self, from: data)
        
        return products
    }
    
    func addToCart(product:Product){
        
        if !self.hasProduct(product: product){
            
            self.items.append(product)
            
            if let dataDecoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(dataDecoded, forKey: "products")
            }
            
        }
    }
    
    func removeFromCart(product:Product){
        
    }
    
    func hasProduct(product:Product) -> Bool{
        
        guard let data = UserDefaults.standard.object(forKey: "products") as? Data else {
            return false
        }
        
        let products = try! JSONDecoder().decode([Product].self, from: data)
        
        return products.contains{$0.id == product.id}
        
    }
}

//
//  Product.swift
//  K-R-B
//
//  Created by Omar Khaled on 25/10/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation

struct Product:Codable,Identifiable {
    var id:Int
    var code:String
    var name:String
    var description:String
    var unit_id:Int?
    var deleted_at:String?
    var created_at: String
    var updated_at: String?
    var type:Int?
    var unit:Int?
    var quantity:Int?
    var price:Double?
}

//
//  Customer.swift
//  K-R-B
//
//  Created by Omar Khaled on 23/10/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation

struct Customer :Codable{
    var id:Int
    var name:String
    var mobile:String
    var phone:String
    var email:String
    var city_id:String
    var business_unit_id:Int
    var branch_id:Int
    var national_id:String
    var type_id:Int
    var created_at:String
    var updated_at:String
    var credit:Double
    var pending_orders:Int64
    var available_balance:Double
    var id_number:Int?
    var city:City
}

struct City :Codable{
    var id:Int
    var name:String
    var region_id:Int
    var deleted_at:String?
    var created_at:String
    var updated_at:String
}

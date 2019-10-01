//
//  ProductController.swift
//  K-R-B
//
//  Created by Omar Khaled on 25/10/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation
import Alamofire

class ProductController {
    
    func getAllProducts(completion:@escaping(_ products:[Product])-> Void){
        
        AF.request(BASE_URL+"display-products",method: .get).response { response in
            switch response.result {
                
            case .success:
                
                if let responseData = response.data {
                    
                    let products = try? JSONDecoder().decode([Product].self, from: responseData)
                    completion(products!)

                }
                
            case .failure(let error):
                print(error)
                
            }
            
            
        }
    }
    
    
}

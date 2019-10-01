import Foundation
import Alamofire

class CustomerController {
    static func customerExist() -> Bool {
        if UserDefaults.standard.object(forKey: "customer") != nil {
//            let decodedCustomer = try? JSONDecoder().decode(Customer.self, from: customer)
            return true
        }
        
        return false
    }
    
    func login(customer_id:String,password:String,completion:@escaping (_ result:Bool)-> Void) {
        
        AF.request(BASE_URL+"balance/login",
                   method: .post,
                   parameters: ["customer_id": customer_id,"password":password],
                   encoder: JSONParameterEncoder.default).response { (response) in
                    
                    switch response.result {
                        
                    case .success:
                        guard let data = response.data else {return}
                        
                        do{
                            let customer = try JSONDecoder().decode(Customer.self, from: data)
                            
                            if let encodedCustomer = try? JSONEncoder().encode(customer){
                                UserDefaults.standard.set(encodedCustomer, forKey: "customer")
                                completion(true)
                            }
                            
                        }
                        catch{
                            completion(false)
                        }
                        
                    case .failure:
                        completion(false)
                    }
                    
        }
        
    }


    
}


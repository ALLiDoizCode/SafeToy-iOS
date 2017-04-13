//
//  Client.swift
//  SafeToy
//
//  Created by Jonathan on 4/13/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Client {
    
    let headers: HTTPHeaders = [
        
        "Content-Type" : "application/json"
    ]
    
    func newToy(toy:ToyModel,completion:@escaping (_ success:Bool) ->Void) {
        
        var parameters:[String:String]! = [:]
        
        parameters["name"] = toy.name!
        parameters["image"] = toy.image!
        parameters["description"] = toy.description!
      
        Alamofire.request(baseURL(endpoint:"toy/save"), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: self.headers).responseString { (response) in
            
            let success = Bool(response.result.value!)
            
            print("Added Toy \(success)")
            
            completion(success!)
            
        }
    }
}

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
    
    func getToys(limit:Int,skip:Int,completion:@escaping (_ success:Bool) ->Void) {
        
        var parameters:[String:String]! = [:]
        
        parameters["skip"] = "\(skip)"
        parameters["limit"] = "\(limit)"
        
        Alamofire.request(baseURL(endpoint:"toy/find"), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: self.headers).responseJSON { (response) in
            
            
            guard response.result.value != nil else {
                
                print("response is nil")
                
                completion(false)
                
                return
            }
            
            print("response is not nil")
            
            let json = JSON(response.result.value!)
            
            for object in json {
                
                let name = object.1["name"].stringValue
                let description = object.1["description"].stringValue
                let image = object.1["image"].stringValue
                
                let toy = ToyModel(name: name, description: description, image: image)
                
                DataStore.setToyList(toy: toy)
            }
            
           DataStore.setSkip(skip: DataStore().getSkip() + json.count)
            
            print("new skips is \(DataStore().getSkip())")
            
           completion(true)
            
        }
    }
}

//
//  Presenter.swift
//  SafeToy
//
//  Created by Jonathan on 4/13/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import Foundation

class Presenter {
    
    func getToys(completion:@escaping (_ success:Bool) -> Void){
        
        DispatchQueue.global(qos: .userInitiated).async {
        
            Client().getToys(limit: DataStore().getLimit(), skip: DataStore().getSkip()) { (success) in
                
                DispatchQueue.main.async {
                    
                    completion(success)
                }
            }
            
        }
    }
    
    func saveToy(toy:ToyModel,path:String,content:String,completion:@escaping (_ success:Bool) -> Void){
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            AWSClient().upload(path: path,content:content) { (url) in
                
                toy.image = url
                
                Client().newToy(toy: toy, completion: { (success) in
                    
                    DispatchQueue.main.async {
                    
                        completion(success)
                    }
                })
            }
        }
    }
}

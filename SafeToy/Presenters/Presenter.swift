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
        
        Client().getToys(limit: DataStore().getLimit(), skip: DataStore().getSkip()) { (success) in
            
            completion(success)
        }
    }
    
    func saveToy(toy:ToyModel,path:String,content:String,completion:@escaping (_ success:Bool) -> Void){
    
        AWSClient().upload(path: path,content:content) { (url) in
            
            toy.image = url
            
            Client().newToy(toy: toy, completion: { (success) in
                
                completion(success)
                
            })
        }
    }
}

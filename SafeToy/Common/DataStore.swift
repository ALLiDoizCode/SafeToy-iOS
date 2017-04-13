//
//  DataStore.swift
//  SafeToy
//
//  Created by Jonathan on 4/13/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import Foundation

class DataStore {
    
    static var currentToy:ToyModel!
    static var toyList:[ToyModel] = []
    
    func getToy() -> ToyModel {
        
        return DataStore.currentToy
    }
    
    func getToyList() -> [ToyModel] {
        
        return DataStore.toyList
    }
    
    static func setToy(toy:ToyModel){
        
        currentToy = toy
    }
    
    static func setToyList(toys:[ToyModel]){
        
        for toy in toys {
            
            toyList.append(toy)
        }
    }
}

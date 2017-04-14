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
    static var limit:Int = 20
    static var skip:Int = 0
    
    func getLimit() -> Int {
        
        return DataStore.limit
    }
    
    func getSkip() -> Int {
        
        return DataStore.skip
    }
    
    func getToy() -> ToyModel {
        
        return DataStore.currentToy
    }
    
    func getToyList() -> [ToyModel] {
        
        return DataStore.toyList
    }
    
    static func setToy(toy:ToyModel){
        
        currentToy = toy
    }
    
    static func setLimit(limit:Int){
        
        self.limit = limit
    }
    
    static func setSkip(skip:Int){
        
        self.skip = skip
    }
    
    static func setToyList(toy:ToyModel){
        
        toyList.append(toy)
    }
}

//
//  ToyModel.swift
//  SafeToy
//
//  Created by Jonathan on 4/13/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import Foundation

class ToyModel {
    
    var name:String!
    var description:String!
    var image:String!
    
    init(name:String,description:String!,image:String) {
        
        self.name = name
        self.description = description
        self.image = image
    }
}

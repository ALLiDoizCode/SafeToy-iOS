//
//  Constants.swift
//  SafeToy
//
//  Created by Jonathan on 4/12/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import Foundation
import UIKit

let awsAccessKey = "AKIAJLTTLJW3CNWAJNYQ"
let awsSecretKey = "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"

let largeFont = UIScreen.main.bounds.width * 0.06
let mainFont = UIScreen.main.bounds.width * 0.03


let PRODUCTION = "https://safetoy.herokuapp.com/"

func baseURL(endpoint:String) -> String{
    
    return "\(PRODUCTION)\(endpoint)"
}

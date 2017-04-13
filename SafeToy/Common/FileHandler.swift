//
//  FileHandler.swift
//  SafeToy
//
//  Created by Jonathan on 4/12/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import UIKit

class FileHandler {
    
    func saveImageDocumentDirectory(data:Data,path:String){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(path)
        print(paths)
        //let imageData = UIImageJPEGRepresentation(image, 0.5)
        fileManager.createFile(atPath: paths as String, contents: data, attributes: nil)
    }
    
    func createDirectory(path:String){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(path)
        if !fileManager.fileExists(atPath: paths){
            try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
        }else{
            print("Already dictionary created.")
        }
    }
    
}


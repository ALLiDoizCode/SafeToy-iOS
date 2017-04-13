//
//  AWSClient.swift
//  SafeToy
//
//  Created by Jonathan on 4/12/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import Foundation
import AWSS3
import AWSCore

class AWSClient {
    
    func save(){
        
        func upload(path:String,completion:@escaping (_ url:String) -> Void){
            
            var urlString = ""
            
            let fm = FileManager.default
            let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let myurl = docsurl.appendingPathComponent(path)
            
            let credentialsProvider = AWSStaticCredentialsProvider(accessKey: awsAccessKey, secretKey: awsSecretKey)
            let configuration = AWSServiceConfiguration(region: AWSRegionType.USWest2, credentialsProvider: credentialsProvider)
            AWSServiceManager.default().defaultServiceConfiguration = configuration
            
            let url = myurl
            let remoteName = path
            let S3BucketName = "mo-b"
            let uploadRequest = AWSS3TransferManagerUploadRequest()!
            uploadRequest.body = url
            uploadRequest.key = remoteName
            uploadRequest.bucket = S3BucketName
            uploadRequest.contentType = "image/jpeg"
            uploadRequest.acl = .publicRead
            
            let transferManager = AWSS3TransferManager.default()
            transferManager.upload(uploadRequest).continueWith { (task) -> Any? in
                
                if let error = task.error {
                    print("Upload failed with error: (\(error.localizedDescription))")
                }
                
                if task.result != nil {
                    let url = AWSS3.default().configuration.endpoint.url
                    let publicURL = url?.appendingPathComponent(uploadRequest.bucket!).appendingPathComponent(uploadRequest.key!)
                    urlString = (publicURL?.absoluteString)!
                    print("Uploaded to:\(publicURL?.absoluteString)")
                }
                
                completion(urlString)
                
                return urlString
            }
        }
    }
}

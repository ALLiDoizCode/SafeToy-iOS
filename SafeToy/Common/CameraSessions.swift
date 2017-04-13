//
//  CameraSessions.swift
//  SafeToy
//
//  Created by Jonathan on 4/12/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension AddVideoViewController {
    
    func showCamera(){
        
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        
        for device in devices! {
            if ((device as AnyObject).hasMediaType(AVMediaTypeVideo)) {
                if((device as AnyObject).position == AVCaptureDevicePosition.front) {
                    captureDevice = device as? AVCaptureDevice
                    if captureDevice != nil {
                        print("Capture device found")
                        beginSession()
                    }
                }
            }
        }
    }
    
    func capture(_ captureOutput: AVCaptureFileOutput!, didStartRecordingToOutputFileAt fileURL: URL!, fromConnections connections: [Any]!) {
        
    }
    
    func capture(_ captureOutput: AVCaptureFileOutput!, didFinishRecordingToOutputFileAt outputFileURL: URL!, fromConnections connections: [Any]!, error: Error!) {
        
    }
    
    func startRecording(filePath:String){
        let recordingDelegate:AVCaptureFileOutputRecordingDelegate? = self
        let url = URL(string: filePath)
        self.captureSession.addOutput(videoFileOutput)
        videoFileOutput.startRecording(toOutputFileURL: url, recordingDelegate: recordingDelegate)
    }
    
    func stopRecording(){
        
        videoFileOutput.stopRecording()
    }
    
    func beginSession() {
        configureDevice()
        let err : NSError? = nil
        do{
            try captureSession.addInput(AVCaptureDeviceInput(device: captureDevice))
        }catch{
            print("error")
        }
        if err != nil {
            print("error: \(err?.localizedDescription)")
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        // thumbnail is a ui container, your camera shows inside this container
        //previewLayer?.frame = thumbnail.layer.bounds
        previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.landscapeLeft
        previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
        //thumbnail.layer.addSublayer(previewLayer!)
        captureSession.startRunning()
    }
    
    func configureDevice() {
        if let device = captureDevice {
            do{
                try device.lockForConfiguration()
                
            }catch{
                print("error")
            }
        }
    }
    
    
}

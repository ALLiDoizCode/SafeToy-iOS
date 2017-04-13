//
//  AddVideoViewController.swift
//  SafeToy
//
//  Created by Jonathan on 4/12/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import UIKit
import AVFoundation
import Material

class AddVideoViewController: UIViewController,AVCaptureFileOutputRecordingDelegate {
    
    var captureDevice : AVCaptureDevice? // check capture device availability
    let captureSession = AVCaptureSession() // to create capture session
    var previewLayer : AVCaptureVideoPreviewLayer? // to add video inside container
    let devices = AVCaptureDevice.devices()
    let videoFileOutput = AVCaptureMovieFileOutput()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

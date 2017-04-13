//
//  AddToyViewController.swift
//  SafeToy
//
//  Created by Jonathan on 4/12/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import UIKit
import Material

class AddToyViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    var previewView = UIView()
    var recordBtn = FlatButton()
    
    let picker = UIImagePickerController()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(previewView)
        self.view.addSubview(recordBtn)
        self.navigationController?.isNavigationBarHidden = true
        
        picker.delegate = self
        
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
        
        
        //camera
        /*
         picker.allowsEditing = false
         picker.sourceType = UIImagePickerControllerSourceType.camera
         picker.cameraCaptureMode = .photo
         picker.modalPresentationStyle = .fullScreen
         present(picker,animated: true,completion: nil)*/

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        
        recordBtn.backgroundColor = Color.grey.lighten5
    }
    
    func constrainViews(){
        
        previewView.translatesAutoresizingMaskIntoConstraints = false
        previewView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        previewView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        previewView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        previewView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        recordBtn.translatesAutoresizingMaskIntoConstraints = false
        recordBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        recordBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        recordBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        recordBtn.heightAnchor.constraint(equalTo: recordBtn.widthAnchor, multiplier: 1).isActive = true
    }
    
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let imageData = UIImageJPEGRepresentation(chosenImage, 0.5)
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
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

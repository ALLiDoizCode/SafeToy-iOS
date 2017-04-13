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
    var cameraBtn = FlatButton()
    var albumBtn = FlatButton()
    
    let picker = UIImagePickerController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(previewView)
        self.view.addSubview(cameraBtn)
        self.view.addSubview(albumBtn)
        
        self.navigationController?.isNavigationBarHidden = true
        
        picker.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        
        previewView.backgroundColor = Color.black
        
        albumBtn.backgroundColor = Color.grey.lighten5
        albumBtn.setTitle("Album", for: .normal)
        albumBtn.titleColor = Color.grey.darken4
        albumBtn.titleLabel?.font = RobotoFont.bold(with: largeFont)
        albumBtn.addTarget(self, action: #selector(AddToyViewController.fromAlbum), for: .touchUpInside)
        
        cameraBtn.backgroundColor = UIColor.clear
        cameraBtn.borderColor = Color.grey.lighten5
        cameraBtn.borderWidth = 3
        cameraBtn.setTitle("Camera", for: .normal)
        cameraBtn.titleColor = Color.grey.lighten5
        cameraBtn.titleLabel?.font = RobotoFont.bold(with: largeFont)
        cameraBtn.addTarget(self, action: #selector(AddToyViewController.fromCamera), for: .touchUpInside)
        
    }
    
    func fromAlbum(){
        
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    func fromCamera(){
        
        picker.allowsEditing = false
        picker.sourceType = UIImagePickerControllerSourceType.camera
        picker.cameraCaptureMode = .photo
        picker.modalPresentationStyle = .fullScreen
        present(picker,animated: true,completion: nil)
    }
    
    func constrainViews(){
        
        previewView.translatesAutoresizingMaskIntoConstraints = false
        previewView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        previewView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        previewView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        previewView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        cameraBtn.translatesAutoresizingMaskIntoConstraints = false
        cameraBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        cameraBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 20).isActive = true
        cameraBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        cameraBtn.heightAnchor.constraint(equalTo: cameraBtn.widthAnchor, multiplier: 1).isActive = true
        
        albumBtn.translatesAutoresizingMaskIntoConstraints = false
        albumBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        albumBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -20).isActive = true
        albumBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        albumBtn.heightAnchor.constraint(equalTo: albumBtn.widthAnchor, multiplier: 1).isActive = true
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

//
//  AddToyViewController.swift
//  SafeToy
//
//  Created by Jonathan on 4/12/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import UIKit
import Material

class AddImageViewController: BaseViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    var previewView = UIImageView()
    var cameraBtn = FlatButton()
    var albumBtn = FlatButton()
    var nextBtn = FlatButton()
    var nextBtnPosition:NSLayoutConstraint!
    let picker = UIImagePickerController()
    var media:Data!
    var backButton = FlatButton()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Color.black
        
        self.view.addSubview(previewView)
        self.view.addSubview(cameraBtn)
        self.view.addSubview(albumBtn)
        self.view.addSubview(nextBtn)
        self.view.addSubview(backButton)
        
        self.navigationController?.isNavigationBarHidden = true
        
        picker.delegate = self
        
        constrainViews()
        setup()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        
        backButton.image = UIImage(named: "back")
        backButton.imageView?.contentMode = .scaleAspectFill
        backButton.addTarget(self, action: #selector(AddImageViewController.back), for: .touchUpInside)
        
        let image = UIImage(named: "default")
        previewView.image = image
        previewView.contentMode = .scaleAspectFill
        
        albumBtn.backgroundColor = Color.teal.darken1
        albumBtn.setTitle("Album", for: .normal)
        albumBtn.titleColor = Color.grey.lighten4
        albumBtn.cornerRadius = 3
        albumBtn.titleLabel?.font = RobotoFont.bold(with: largeFont)
        albumBtn.addTarget(self, action: #selector(AddImageViewController.fromAlbum), for: .touchUpInside)
        
        cameraBtn.backgroundColor = UIColor.clear
        cameraBtn.borderColor = Color.teal.darken1
        cameraBtn.borderWidth = 3
        cameraBtn.cornerRadius = 3
        cameraBtn.setTitle("Camera", for: .normal)
        cameraBtn.titleColor = Color.teal.darken1
        cameraBtn.titleLabel?.font = RobotoFont.bold(with: largeFont)
        cameraBtn.addTarget(self, action: #selector(AddImageViewController.fromCamera), for: .touchUpInside)
        
        nextBtn.backgroundColor = Color.teal.darken1
        nextBtn.cornerRadius = 3
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.titleColor = Color.grey.lighten4
        nextBtn.titleLabel?.font = RobotoFont.bold(with: largeFont)
        nextBtn.addTarget(self, action: #selector(AddImageViewController.saveImage), for: .touchUpInside)
        
    }
    
    func constrainViews(){
        
        previewView.translatesAutoresizingMaskIntoConstraints = false
        previewView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        previewView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        previewView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        previewView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        cameraBtn.translatesAutoresizingMaskIntoConstraints = false
        cameraBtn.bottomAnchor.constraint(equalTo: nextBtn.topAnchor, constant: -50).isActive = true
        cameraBtn.leftAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 20).isActive = true
        cameraBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        cameraBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        
        albumBtn.translatesAutoresizingMaskIntoConstraints = false
        albumBtn.bottomAnchor.constraint(equalTo: nextBtn.topAnchor, constant: -50).isActive = true
        albumBtn.rightAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -20).isActive = true
        albumBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        albumBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtnPosition = nextBtn.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: nextBtn.height)
        nextBtnPosition.isActive = true
        nextBtn.rightAnchor.constraint(equalTo: cameraBtn.rightAnchor, constant: 0).isActive = true
        nextBtn.leftAnchor.constraint(equalTo: albumBtn.leftAnchor, constant: 0).isActive = true
        nextBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.09).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        backButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        backButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1).isActive = true
        backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor, multiplier: 1).isActive = true
    }
    
    func back(){
        
        let controller = ListViewController()
        
        self.navigationController?.pushViewController(controller, animated: true)
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
    
    func saveImage(){
        
        let controller = DescriptionViewController()
        controller.media = media
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        previewView.image = chosenImage
        let imageData = UIImageJPEGRepresentation(chosenImage, 0.5)
        media = imageData
        dismiss(animated:true, completion: nil)
        
        nextBtnPosition.isActive = false
        nextBtnPosition = nextBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50)
        nextBtnPosition.isActive = true
        
        UIView.animate(withDuration: 0.3) {
            
            self.view.layoutIfNeeded()
        }
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

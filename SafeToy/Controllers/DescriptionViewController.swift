//
//  DescriptionViewController.swift
//  SafeToy
//
//  Created by Jonathan on 4/13/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import UIKit
import Material
import NVActivityIndicatorView

class DescriptionViewController: UIViewController,NVActivityIndicatorViewable {
    
    var titleField = TextField()
    var descriptionField = TextView()
    var saveBtn = FlatButton()
    var backButton = FlatButton()
    var media:Data!
    var path:String!
    var content:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(titleField)
        self.view.addSubview(descriptionField)
        self.view.addSubview(saveBtn)
        self.view.addSubview(backButton)
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Color.grey.lighten2
        
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
        backButton.addTarget(self, action: #selector(DescriptionViewController.back), for: .touchUpInside)
        
        titleField.font = RobotoFont.regular(with: largeFont)
        titleField.textColor = Color.grey.base
        titleField.placeholder = "Name"
        titleField.autocorrectionType = .no
        
        descriptionField.font = RobotoFont.regular(with: largeFont)
        descriptionField.textColor = Color.grey.base
        descriptionField.autocorrectionType = .no
        
        saveBtn.backgroundColor = Color.teal.darken1
        saveBtn.cornerRadius = 3
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.titleColor = Color.grey.lighten4
        saveBtn.titleLabel?.font = RobotoFont.bold(with: largeFont)
        saveBtn.addTarget(self, action: #selector(DescriptionViewController.save), for: .touchUpInside)
        
    }
    
    func constrainViews() {
        
        titleField.translatesAutoresizingMaskIntoConstraints = false
        titleField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        titleField.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06).isActive = true
        titleField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        titleField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        descriptionField.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 20).isActive = true
        descriptionField.bottomAnchor.constraint(equalTo: saveBtn.topAnchor, constant: -20).isActive = true
        descriptionField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        descriptionField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        saveBtn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        saveBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        saveBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.09).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        backButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        backButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1).isActive = true
        backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor, multiplier: 1).isActive = true
    }
    
    func back(){
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func save(){
        
        startAnimating(self.view.frame.size, type: .ballScale , color: Color.teal.darken1, padding: 0, displayTimeThreshold: 0, minimumDisplayTime: 0, backgroundColor: Color.black.withAlphaComponent(0.6))
        
        guard titleField.text != "" else {
            
            return
        }
        
        guard descriptionField.text != "" else {
            
            return
        }
        
        let newToy = ToyModel(name: titleField.text!, description: descriptionField.text, image: "")
        
        if media != nil {
            
            path = NSUUID().uuidString
            
            FileHandler().saveImageDocumentDirectory(data: media, path: path)
            
            content = "image/jpeg"
            
        }else {
            
            content = "video/mp4"
        }
        
        Presenter().saveToy(toy: newToy, path: path,content:content) { (success) in
            
            guard success == true else {
                
                self.stopAnimating()
                return
            }
            
            Presenter().getToys { (success) in
                
                self.stopAnimating()
                let controller = ListViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
            
        }
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

//
//  BaseViewController.swift
//  SafeToy
//
//  Created by Jonathan on 4/13/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import UIKit
import Material

class BaseViewController: UIViewController {
    
    var tabBar = TabBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tabBar)
        
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tabBar.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        tabBar.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: -5).isActive = true
        tabBar.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 5).isActive = true
        
        tabBar.tab2.icon.image = UIImage(named: "list")
        tabBar.tab2.label.text = "Toys"
        tabBar.tab4.icon.image = UIImage(named: "camera")
        tabBar.tab4.label.text = "Camera"
        tabBar.tab4.gesture.addTarget(self, action: #selector(BaseViewController.gotoCamera))
        
     
        
        tabBar.tab1 .isHidden = true
        tabBar.tab3 .isHidden = true
        tabBar.tab5 .isHidden = true
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func gotoCamera(){
        
        let controller = AddImageViewController()
        self.navigationController?.pushViewController(controller, animated: true)
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

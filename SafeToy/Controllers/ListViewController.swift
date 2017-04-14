//
//  ListViewController.swift
//  SafeToy
//
//  Created by Jonathan on 4/13/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import UIKit
import Material
import SDWebImage
import NVActivityIndicatorView

class ListViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,NVActivityIndicatorViewable {
    
    var tableView:UITableView!

    var toyList:[ToyModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAnimating(self.view.frame.size, type: .ballScale , color: Color.teal.darken1, padding: 0, displayTimeThreshold: 0, minimumDisplayTime: 0, backgroundColor: Color.black.withAlphaComponent(0.6))
        
        self.navigationController?.isNavigationBarHidden = true
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "list")
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        guard DataStore().getToyList().count == 0 else {
            
            self.tableView.reloadData()
            self.stopAnimating()
            
            return
        }
        
        Presenter().getToys { (success) in
            
            self.tableView.reloadData()
            self.stopAnimating()
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataStore().getToyList().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    /*func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath) as! ListTableViewCell
        
        let image = URL(string: DataStore().getToyList()[indexPath.row].image)
        
        cell.toyImage.sd_setImage(with: image)
        cell.toyName.text = DataStore().getToyList()[indexPath.row].name
        cell.descriptionLabel.text = DataStore().getToyList()[indexPath.row].description
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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

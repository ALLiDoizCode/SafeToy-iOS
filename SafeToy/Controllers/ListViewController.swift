//
//  ListViewController.swift
//  SafeToy
//
//  Created by Jonathan on 4/13/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import UIKit
import Material

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!

    var toyList:[ToyModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "list")
        tableView.separatorStyle = .none
        
        for i in 1..<4{
            
            let image = "toy\(i)"
            
            if i == 3 {
                
                 let newToy = ToyModel(name: "Toy \(i)", description: "adnhahdaklfhausadsadasdhfauifhuifhiufhadnhahdaklfhausadsadasdhfauifhuifhiufhadnhahdaklfhausadsadasdhfauifhuifhiufhadnhahdaklfhausadsadasdhfauifhuifhiufhadnhahdaklfhausadsadasdhfauifhuifhiufhadnhahdaklfhausadsadasdhfauifhuifhiufhadnhahdaklfhausadsadasdhfauifhuifhiufhadnhahdaklfhausadsadasdhfauifhuifhiufhadnhahdaklfhausadsadasdhfauifhuifhiufhadnhahdaklfhausadsadasdhfauifhuifhiufh", image: image)
                
                toyList.append(newToy)
                
            }else {
                
                 let newToy = ToyModel(name: "Toy \(i)", description: "adnhahdaklfhauhfauifhuifhiufh", image: image)
                
                toyList.append(newToy)
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toyList.count
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
        
        let image = UIImage(named: toyList[indexPath.row].image)
        
        cell.toyImage.image = image
        cell.toyName.text = toyList[indexPath.row].name
        cell.descriptionLabel.text = toyList[indexPath.row].description
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

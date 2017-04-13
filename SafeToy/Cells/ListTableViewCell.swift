//
//  ListTableViewCell.swift
//  SafeToy
//
//  Created by Jonathan on 4/13/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import UIKit
import Material

class ListTableViewCell: UITableViewCell {
    
    var toyImage = UIImageView()
    var toyName = UILabel()
    var descriptionLabel = UILabel()
    var nameBg = UIView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = Color.grey.lighten4
        
        self.addSubview(toyImage)
        self.addSubview(nameBg)
        self.addSubview(toyName)
        self.addSubview(descriptionLabel)
        
        self.clipsToBounds = true
        constrainView()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setup(){
        
        toyImage.contentMode = .scaleAspectFill
        toyImage.clipsToBounds = true
        
        nameBg.backgroundColor = Color.grey.darken4.withAlphaComponent(0.6)
        
        toyName.font = RobotoFont.medium(with: largeFont)
        toyName.textColor = Color.grey.lighten5
        toyName.numberOfLines = 2
        toyName.textAlignment = .center
        
        descriptionLabel.font = RobotoFont.medium(with: largeFont)
        descriptionLabel.textColor = Color.grey.lighten1
        descriptionLabel.numberOfLines = 0
    }
    
    func constrainView(){
        
        toyImage.translatesAutoresizingMaskIntoConstraints = false
        toyImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        toyImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        toyImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        toyImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3).isActive = true
        
        toyName.translatesAutoresizingMaskIntoConstraints = false
        toyName.topAnchor.constraint(equalTo: toyImage.topAnchor, constant: 20).isActive = true
        toyName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        //toyName.widthAnchor.constraint(equalTo: toyImage.widthAnchor, multiplier: 0.25).isActive = true
        
        nameBg.translatesAutoresizingMaskIntoConstraints = false
        nameBg.topAnchor.constraint(equalTo: toyName.topAnchor, constant: 0).isActive = true
        nameBg.leftAnchor.constraint(equalTo: toyName.leftAnchor, constant: -10).isActive = true
        nameBg.rightAnchor.constraint(equalTo: toyName.rightAnchor, constant: 10).isActive = true
        nameBg.heightAnchor.constraint(equalTo: toyName.heightAnchor, multiplier: 1).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: toyImage.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }

}

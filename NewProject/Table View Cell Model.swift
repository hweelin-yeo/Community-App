//
//  Helper1.swift
//  NewProject
//
//  Created by Yeo Hwee Lin on 6/17/17.
//  Copyright © 2017 Yeo Hwee Lin. All rights reserved.
//

import Foundation
import UIKit

class MessageTableViewCell: UITableViewCell {
    
    static let REUSE_ID = "MessageTableViewCell"
    
    let nameLabel : UILabel = UILabel()
    let bodyLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.numberOfLines = 0
        
        self.addSubview(nameLabel)
        self.addSubview(bodyLabel)
        
        let views = ["nameLabel": nameLabel, "bodyLabel": bodyLabel]
        /**
        //Horizontal constraints
        let nameLabelHorizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[nameLabel]-10-|", options: nil, metrics: nil, views: views)
        
        let bodyLabelHorizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[bodyLabel]-10-|", options: nil, metrics: nil, views: views)
        
        self.addConstraints(nameLabelHorizontalConstraints)
        self.addConstraints(bodyLabelHorizontalConstraints)
        
        //Vertical constraints
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[nameLabel]-5-[bodyLabel]-10-|", options: nil, metrics: nil, views: views)
        self.addConstraints(verticalConstraints)
        */
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

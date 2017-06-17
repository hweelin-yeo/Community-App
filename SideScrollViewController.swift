//
//  SideScrollViewController.swift
//  NewProject
//
//  Created by Yeo Hwee Lin on 6/10/17.
//  Copyright © 2017 Yeo Hwee Lin. All rights reserved.
//

import UIKit

var sectionNames = ["Food", "Household Services", "Transport", "Health Services", "Beauty and Wellness"]

var settingNames = ["Profile", "Saved Searches"]


class SideScrollViewController: UITableViewController {
    
    var locationName: String!
    var tapGestureFastDel: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 210/255.0, green: 35/255.0, blue: 42/255.0, alpha: 1.0)
        self.tableView.tableFooterView = UIView()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated. UITapGestureRecognizer(target: self, action: #selector (resultFastestViewTapped))
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        let header = view as! UITableViewHeaderFooterView
        let background = UIView()
        background.backgroundColor = UIColor(red: 230, green: 57, blue: 55, alpha: 1.0)
        header.backgroundView = UIView()
        header.textLabel?.textAlignment = NSTextAlignment.center
        header.textLabel?.textColor = UIColor.white
        
        if (section == 0) {
            header.textLabel?.text = locationName
            
        }
        else {
            header.textLabel?.text = "Settings"
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(red: 210/255.0, green: 35/255.0, blue: 42/255.0, alpha: 1.0)
        
        cell.textLabel?.textColor = UIColor.white
        if indexPath.section == 0 {
            cell.textLabel?.text = sectionNames[indexPath.row]
        }
        else {
            cell.textLabel?.text = settingNames[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return sectionNames.count
        }
        else {
            return settingNames.count
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}

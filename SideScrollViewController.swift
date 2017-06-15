//
//  SideScrollViewController.swift
//  NewProject
//
//  Created by Yeo Hwee Lin on 6/10/17.
//  Copyright © 2017 Yeo Hwee Lin. All rights reserved.
//

import UIKit

var sectionNames = ["Channel", "Quora", "Events", "Profile", "Settings"]


class SideScrollViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 210/255.0, green: 35/255.0, blue: 42/255.0, alpha: 1.0)
        self.tableView.tableFooterView = UIView()
        
        
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Home"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = sectionNames[indexPath.row]
        cell.backgroundColor = UIColor(red: 210/255.0, green: 35/255.0, blue: 42/255.0, alpha: 1.0)
        
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionNames.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
}

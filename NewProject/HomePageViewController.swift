//
//  LoginPageViewController.swift
//  NewProject
//
//  Created by Yeo Hwee Lin on 6/10/17.
//  Copyright © 2017 Yeo Hwee Lin. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    var locationName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addSideVC ()
        
    }
    
    func addSideVC() {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sideScroll") as! SideScrollViewController
        self.addChildViewController(popUpVC)
        popUpVC.locationName = locationName
        popUpVC.view.frame = CGRect(x: 0, y: 0, width: 200, height: 900)
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParentViewController: self)
        
    }
    
    
}

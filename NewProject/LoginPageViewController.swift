//
//  LoginPageViewController.swift
//  NewProject
//
//  Created by Yeo Hwee Lin on 6/10/17.
//  Copyright © 2017 Yeo Hwee Lin. All rights reserved.
//

import UIKit
import CoreLocation

class LoginPageViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationHERE: String!
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        }
        addSideVC ()
        
    }
    
    
    func addSideVC() {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sideScroll")
        self.addChildViewController(popUpVC)
        
        popUpVC.view.frame = CGRect(x: 0, y: 0, width: 150, height: 900)
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParentViewController: self)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print (location.coordinate.latitude)
            print (location.coordinate.longitude)
            push(latitude: CGFloat(location.coordinate.latitude), longitude: CGFloat(location.coordinate.longitude))
            locationManager.stopUpdatingLocation()
        
        }
}
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled", message: "In order to see which channel you are from, we need your location", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let openAction = UIAlertAction(title: "Open settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(openAction)
        
        self.present(alertController, animated:  true, completion: nil)
        
        
    }
    func push(latitude: CGFloat, longitude: CGFloat) {
        var request = URLRequest(url: URL(string: "http://192.168.0.51:5000/geo?lat=1.274367&long=103.842926")!)
            
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            // Check for error
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            
            // Print out response string
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print("responseString = \(responseString)")
            
            
            // Convert server json response to NSDictionary
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    
                    // Print out dictionary
                    print(convertedJsonIntoDict)
                    
                    // Get value by key
                    let location = convertedJsonIntoDict["?"] as? String
                    print(location!)
                    self.locationHERE = location
                    
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
        
        }
    override func viewDidAppear(_ animated: Bool) {
        <#code#>
    }

}

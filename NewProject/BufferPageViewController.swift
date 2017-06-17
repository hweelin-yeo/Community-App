
//
//  BufferPageViewController.swift
//  NewProject
//
//  Created by Yeo Hwee Lin on 6/16/17.
//  Copyright © 2017 Yeo Hwee Lin. All rights reserved.
//

import UIKit
import CoreLocation
import JSQMessagesViewController

class BufferPageViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var locationHERE: String!
    let locationManager = CLLocationManager()
    var lat: Double!
    var long: Double!
    var coords: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            activityIndicator.startAnimating()
            activityIndicator.hidesWhenStopped = true
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            
            DispatchQueue.main.async {
                self.locationManager.startUpdatingLocation()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            lat = location.coordinate.latitude
            long = location.coordinate.longitude
            print (lat)
            push(latitude: CGFloat(location.coordinate.latitude), longitude: CGFloat(location.coordinate.longitude))
            locationManager.stopUpdatingLocation()
            coords = location.coordinate.latitude
            
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
        var request = URLRequest(url: URL(string: "https://desolate-peak-93885.herokuapp.com/api/geo?lat=1.296742&long=103.786664")!)
        
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
            
            self.locationHERE = responseString! as String!
            print(self.locationHERE)
            
            /**
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
            */
        }
        
        task.resume()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if self.locationHERE != nil {
            self.perform(#selector(goNext), with: nil, afterDelay: 1.2)
        }
        
        DispatchQueue.main.async {
            self.perform(#selector(self.goNext), with: nil, afterDelay: 8)
        }
    }
    
    
    func goNext() {
        self.activityIndicator.stopAnimating()
        let homePageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homePage") as! HomePageViewController
        if (locationHERE == nil) {locationHERE = "Ayer Rajah"}
        homePageVC.locationName = locationHERE
        self.present(homePageVC, animated: true, completion: nil)
    }

    
    
}

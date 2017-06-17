//
//  ViewController.swift
//  NewProject
//
//  Created by Yeo Hwee Lin on 6/10/17.
//  Copyright © 2017 Yeo Hwee Lin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBAction func loginButton(_ sender: UIButton) {
        let loadingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loading")
        present(loadingVC, animated: true, completion: nil)

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLogin.layer.cornerRadius = 5

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension LoginViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) {
        if textField == passwordTextField {
            let loadingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loading")
            present(loadingVC, animated: true, completion: nil)
        }
    }
    
    
}


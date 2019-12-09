//
//  LoginViewController.swift
//  ProjectIOS
//
//  Created by Dinara on 11/13/19.
//  Copyright © 2019 Dinara Sadykova. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        errorLabel.alpha = 0
    }

    @IBAction func loginTapped(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil{
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else{
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "tabBarView") 
                self.present(newViewController, animated:true, completion:nil)
                print("почему")
            }
        }
        
        
    }
  
    @IBAction func goBackButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeView") as! ViewController
        self.present(newViewController, animated:true, completion:nil)
    }
}

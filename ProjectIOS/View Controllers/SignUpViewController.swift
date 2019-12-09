//
//  SignUpViewController.swift
//  ProjectIOS
//
//  Created by Dinara on 11/13/19.
//  Copyright © 2019 Dinara Sadykova. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        errorLabel.alpha = 0
    }
    func validateFields() -> String?{
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all the fields"
        }
        
        return nil
    }
    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil{
            showError(error!)
            
        }
        else{
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showError(err!.localizedDescription)
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstName" : firstName, "lastName": lastName, "uid": result!.user.uid]) { (error) in
                        if error != nil{
                            self.showError("Error saving data")
                        }
                    }
                    let alert = UIAlertController(title: "Success", message: "You are in our database", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                    
                    
                }
            }
        }
    }
    
    @IBAction func goBackButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeView") as! ViewController
        self.present(newViewController, animated:true, completion:nil)

    }
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
        
    }

}

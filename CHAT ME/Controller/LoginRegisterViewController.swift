//
//  ViewController.swift
//  CHAT ME
//
//  Created by Djennelbaroud Hadj Cheikh on 03/06/2021.
//

import UIKit
import CLTypingLabel
import FirebaseAuth
import Firebase

class LoginRegisterViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    @IBOutlet weak var RegisterLoginSegmentedC: UISegmentedControl!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginRegisterButton: UIButton!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var usernameStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        usernameTF.delegate = self
        emailTF.delegate = self
        passwordTF.delegate = self
        titleLabel.text = "CHAT ME"
        loginRegisterButton.setTitle("Register", for: .normal)
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.toolbar.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        
        
    }
    
    @IBAction func SegmentSelected(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            emailTF.text = ""
            passwordTF.text = ""
            usernameStackView.isHidden = true
            loginRegisterButton.setTitle("Login", for: .normal)
            
        }else{
            emailTF.text = ""
            passwordTF.text = ""
            usernameTF.text = ""
            usernameStackView.isHidden = false
            loginRegisterButton.setTitle("Register", for: .normal)
            
        }
        
    }
    
 
    
    @IBAction func LoginOrRegisterTapped(_ sender: UIButton) {
        if sender.currentTitle == "Login" {
            // User logging
            
            if let email = emailTF.text , let password = passwordTF.text {
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                    if error != nil {
                        print(error!)
                        let al = UIAlertController(title: "Loging Failed", message: error?.localizedDescription, preferredStyle: .actionSheet)
                        al.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: .none))
                        self!.present(al, animated: true, completion: nil)
                        
                        return
                    }
                    let identifier = "Logged"
                    self!.transitionOfViewsC(identifier: identifier)
                    
                }
            }
            
        }else{
            // User registring
            
            if let email = emailTF.text , let password = passwordTF.text , let username = usernameTF.text{
                if isPasswordValid(password) {
                    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                        if error != nil {
                            print(error!.localizedDescription)
                            let al = UIAlertController(title: "Registring Failed", message: error?.localizedDescription, preferredStyle: .actionSheet)
                            al.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: .none))
                            self.present(al, animated: true, completion: nil)
                            
                            return
                        }else {
                            let db = Firestore.firestore()
                            db.collection("users").addDocument(data: ["username": username , "email": email , "uid": result!.user.uid  ]) { (err) in
                                if err != nil {
                                    print("\n The error on adding data is : ",err!.localizedDescription)
                                    
                                }
                                
                            }
                            let idetifier = "ContinueRegistering"
                            self.transitionOfViewsC(identifier: idetifier)
                            
                        }
                    }
                }else {
                    let al = UIAlertController(title: "Registering Problem", message: "Please make sure your password is at least 8 characters, contains a special character and a number and one capital letter", preferredStyle: .actionSheet)
                    al.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: .none))
                    present(al, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        
        return passwordTest.evaluate(with: password)
    }
    
    func transitionOfViewsC(identifier i : String)  {
        if i == "ContinueRegistering" {
            self.emailTF.text = ""
            self.passwordTF.text = ""
            self.usernameTF.text = ""
            self.performSegue(withIdentifier: i , sender: self)
            
        }else{
            
            self.emailTF.text = ""
            self.passwordTF.text = ""
            self.performSegue(withIdentifier: i, sender: self)
            
        }
        
    }
    
    
    
    
}


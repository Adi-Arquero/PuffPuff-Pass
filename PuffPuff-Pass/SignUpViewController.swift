//
//  SignUpViewController.swift
//  PuffPuff-Pass
//
//  Created by Adrian Knapp on 3/10/20.
//  Copyright © 2020 Adrian Knapp. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ProgressHUD

class SignUpViewController: UIViewController {
    
    
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var fullnameContainerView: UIView!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        setupTitlelabel()
        setupAvatar()
        setupFullNameTextField()
        setupEmailTextField()
        setupPasswrdTextField()
        setupSignUpButton()
        setupSignInButton()
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func validateFields() {
        guard let username = self.fullnameTextField.text, !username.isEmpty else {
            ProgressHUD.showError("Please enter a username")
            return
        }
        guard let email = self.emailTextField.text, !email.isEmpty else {
            ProgressHUD.showError("Please enter an email address")
            return
        }
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            ProgressHUD.showError("Please enter a password")
            return
        }
    }
    
    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        self.view.endEditing(true)
        self.validateFields()
        
        guard let imageSelected = self.image else {
            ProgressHUD.showError("Please choose a profile image")
            return
        }
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
            return
        }
        
        
        
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (authDataResult, error) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                print(authData.user.email)
                var dict: Dictionary<String, Any> = [
                    "uid": authData.user.uid,
                    "email": authData.user.email,
                    "username": self.fullnameTextField.text,
                    "profileImageUrl": "",
                    "status": "Welcome to PuffPuff-Pass"
                ]
                
                let storageRef = Storage.storage().reference(forURL: "gs://puffpuff-pass-341b3.appspot.com")
                let storageProfileRef = storageRef.child("profile").child(authData.user.uid)
                
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                // might need a completion here
                storageProfileRef.putData(imageData, metadata: metadata, completion: { (storageMetaData, error) in
                    if error != nil {
                        print(error?.localizedDescription)
                        return
                    }
                    storageProfileRef.downloadURL(completion: { (url, error) in
                        if let metaImageUrl = url?.absoluteString {
                            dict["profileImageUrl"] = metaImageUrl
                            
                            
                            Database.database().reference().child("users").child(authData.user.uid).updateChildValues(dict,withCompletionBlock: { (error, ref) in
                                if error == nil {
                                    print("Done")
                                }
                            })
                        }
                    })
                })
                
            }
        }
        
    }
}

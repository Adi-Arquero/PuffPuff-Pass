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
    
    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        
        guard let imageSelected = self.image else {
            print("Avatar is nil")
            return
        }
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
            return
        }
        
        
        
        Auth.auth().createUser(withEmail: "test004@gmail.com", password: "123456") { (authDataResult, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                print(authData.user.email)
                let dict: Dictionary<String, Any> = [
                    "uid": authData.user.uid,
                    "email": authData.user.email,
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
                })
                
                //                let storageRef = Storage.storage().reference(forURL:"https://puffpuff-pass-341b3.firebaseio.com/")
                //                let storageProfileRef = storageRef.child("profile").child(authData.user.uid)
                //
                //                let metadata = StorageMetadata()
                //                metadata.contentType = "image/jpg"
                //                storageProfileRef.putData(imageData, metadata: metadata, completion: { (storageMetaData, error) in
                //                    if error != nil {
                //                        print(error?.localizedDescription)
                //                        return
                //                }
                //
                //
                //                })
                Database.database().reference().child("users").child(authData.user.uid).updateChildValues(dict,withCompletionBlock: { (error, ref) in
                    if error == nil {
                        print("Done")
                    }
                })
            }
        }
        
    }
}

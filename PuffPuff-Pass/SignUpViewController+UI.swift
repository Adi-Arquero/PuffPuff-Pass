//
//  SignUpViewController+UI.swift
//  PuffPuff-Pass
//
//  Created by Adrian Knapp on 3/10/20.
//  Copyright © 2020 Adrian Knapp. All rights reserved.
//

import UIKit

extension SignUpViewController {
    
    func setupTitlelabel(){
        let title = "Sign Up"
          
           
           let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black
           ])
          
           titleTextLabel.attributedText = attributedText
        
    }
    
    func setupAvatar(){
        avatar.layer.cornerRadius = 40
        avatar.clipsToBounds = true
    }
    
    func setupFullNameTextField() {
        fullnameContainerView.layer.borderWidth = 1
        fullnameContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        fullnameContainerView.layer.cornerRadius = 3
        fullnameContainerView.clipsToBounds = true
        
        fullnameTextField.borderStyle = .none
        
        
        let placeholderAttr = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        fullnameTextField.attributedPlaceholder = placeholderAttr
        fullnameTextField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        
    }
    
    func setupEmailTextField() {
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
               emailContainerView.layer.cornerRadius = 3
               emailContainerView.clipsToBounds = true
               
               emailTextField.borderStyle = .none
               
               
               let placeholderAttr = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
               emailTextField.attributedPlaceholder = placeholderAttr
        
    }
    
    func setupPasswrdTextField() {
        passwordContainerView.layer.borderWidth = 1
        passwordContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
               passwordContainerView.layer.cornerRadius = 3
               passwordContainerView.clipsToBounds = true
               
               passwordTextField.borderStyle = .none
               
               
               let placeholderAttr = NSAttributedString(string: "Password (6+ Characters)", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
               passwordTextField.attributedPlaceholder = placeholderAttr
        
    }
    
    func setupSignUpButton(){
        signUpButton.setTitle("Sign Up", for: UIControl.State.normal)
                      signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
                      signUpButton.backgroundColor = UIColor.black
                      signUpButton.layer.cornerRadius = 5
                      signUpButton.clipsToBounds = true
        signUpButton.setTitleColor(.white, for: UIControl.State.normal)
        
    }
    
    func setupSignInButton(){
        let attributedText = NSMutableAttributedString(string: "Already have an Account? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)
                           ])
                      
        let attributedSubText = NSMutableAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.black
                      ])
                      attributedText.append(attributedSubText)
        signInButton.setAttributedTitle(attributedText, for: UIControl.State.normal)
                      
        
                      
        
    }
}

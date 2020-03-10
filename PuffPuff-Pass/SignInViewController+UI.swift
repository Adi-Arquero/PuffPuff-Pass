//
//  SignInViewController+UI.swift
//  PuffPuff-Pass
//
//  Created by Adrian Knapp on 3/10/20.
//  Copyright © 2020 Adrian Knapp. All rights reserved.
//

import UIKit

extension SignInViewController {
    
        func setupTitlelabel(){
        let title = "Sign In"
          
           
           let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black
           ])
          
           titleTextLabel.attributedText = attributedText
        
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
    
    func setupSignInButton(){
        signInButton.setTitle("Sign Up", for: UIControl.State.normal)
                      signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
                      signInButton.backgroundColor = UIColor.black
                      signInButton.layer.cornerRadius = 5
                      signInButton.clipsToBounds = true
        signInButton.setTitleColor(.white, for: UIControl.State.normal)
        
    }
    
    func setupSignUpButton(){
        let attributedText = NSMutableAttributedString(string: " Don't already have an Account? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)
                           ])
                      
        let attributedSubText = NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.black
                      ])
                      attributedText.append(attributedSubText)
        signUpButton.setAttributedTitle(attributedText, for: UIControl.State.normal)
                      
        
                      
        
    }
}

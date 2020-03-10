//
//  ForgotPasswordViewController+UI.swift
//  PuffPuff-Pass
//
//  Created by Adrian Knapp on 3/10/20.
//  Copyright © 2020 Adrian Knapp. All rights reserved.
//

import UIKit

extension ForgotPasswordViewController {
    func setupEmailTextField() {
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
               emailContainerView.layer.cornerRadius = 3
               emailContainerView.clipsToBounds = true
               
               emailTextField.borderStyle = .none
               
               
               let placeholderAttr = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
               emailTextField.attributedPlaceholder = placeholderAttr
        
    }
    
    func setupResetButton(){
          resetButton.setTitle("Reset Password", for: UIControl.State.normal)
                        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
                        resetButton.backgroundColor = UIColor.black
                        resetButton.layer.cornerRadius = 5
                        resetButton.clipsToBounds = true
          resetButton.setTitleColor(.white, for: UIControl.State.normal)
          
      }
    
}

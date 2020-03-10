//
//  ForgotPasswordViewController.swift
//  PuffPuff-Pass
//
//  Created by Adrian Knapp on 3/10/20.
//  Copyright © 2020 Adrian Knapp. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupUI()
        }
        
        func setupUI(){
           
            setupEmailTextField()
            setupResetButton()
        }
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

//
//  ProfileVC.swift
//  Groupy
//
//  Created by Develop on 5/10/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var currenetPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "الصفحة الشخصية"
        
        nameTextField.underLined()
        phoneNumberTextField.underLined()
        emailTextField.underLined()
        currenetPasswordTextField.underLined()
        newPasswordTextField.underLined()
        confirmPasswordTextField.underLined()	
    }
    @IBAction func ForgotPasswordClickedButton(_ sender: UIButton) {
    }
    
    @IBAction func ResetPasswordClickedButton(_ sender: Any) {
    }
    
    

}

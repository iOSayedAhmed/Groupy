//
//  LoginVC.swift
//  Groupy
//
//  Created by Develop on 5/8/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func forgotPasswordClickedButton(_ sender: UIButton) {
        print("forgot password")
    }
    @IBAction func loginClickedButton(_ sender: UIButton) {
        
                //TODO
                // login
        if let email = emailTextField.text , let password = passwordTextField.text , !email.isEmpty && !password.isEmpty  {
            DispatchQueue.global(qos: .background).async {
                APIServices.shared.loginRequest(url: "student_login.php", email: email, password: password, idAddress: "") { (userResponse:UserModel?,error) in
                    if let error = error {
                        //TODO
                        //Alart
                        DispatchQueue.main.async {
                            self.showAlert("Error", error.localizedDescription, "OK")
                        }
                        print(error)
                        
                    }else {
                        print(" Successful Login")
                        print(userResponse?.email)
                        print(userResponse?.name)
                        
                        DispatchQueue.main.async {
                            self.presentHomeVC()
                        }
                        
                    }
                    
                }
            }
        }else {
            DispatchQueue.main.async {
                self.showAlert("خطأ", "من فضلك أملأ جميع البيانات", "تم")
            }
            
        }
    }
    @IBAction func registerClickedButton(_ sender: UIButton) {
        presentRegisterVC()
    }
    
    
    
}

extension UITextField {
    
    func isValid() -> Bool {
        guard let text = self.text,
              !text.isEmpty else {
            print("Please fill the field.")
            return false
        }
        return true
    }
    
}


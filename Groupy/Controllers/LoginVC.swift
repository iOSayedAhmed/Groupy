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
    
    var parameters = [String:String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        [emailTextField,passwordTextField].forEach {
            $0?.delegate = self
        }
    
    }
    
    @IBAction func forgotPasswordClickedButton(_ sender: UIButton) {
        print("forgot password")
    }
    @IBAction func loginClickedButton(_ sender: UIButton) {
        
                //TODO
                // login
            loginUser()
    }
    
    @IBAction func registerClickedButton(_ sender: UIButton) {
        presentRegisterVC()
    }
    
    func loginUser() {
        if let email = emailTextField.text , let password = passwordTextField.text , !email.isEmpty && !password.isEmpty  {
            parameters = ["email":email,"password":password,"id_addess":""]
            DispatchQueue.global(qos: .background).async {
                APIServices.shared.postRequest(url: "student_login.php", parameter: self.parameters, method: nil, headers: nil ){ (userResponse:UserModel?,error) in
                    if let error = error {
                        //TODO
                        //Alart
                        DispatchQueue.main.async {
                            self.showAlert("خطأ ❌", "من فضلك تأكد من البريد الإلكتروني وكلمة السر ", "تـم")
                        }
                        print(error)
                        
                    }else {
                        print(" Successful Login")
                        print(userResponse?.phone)
                        print(userResponse?.name)
                        guard let userData = userResponse else {return}
                        let userInfo : [String:Any] = ["id":userData.id,"name":userData.name,"email":userData.email,"phone":userData.phone]
                        LocalState.userInfo = userInfo
                        self.presentHomeVC()
//                        DispatchQueue.main.async {
//                            let alert = UIAlertController(title: "تم بنجاح", message: "تم تسجيل الدخول بنجاح ✅", preferredStyle: .alert)
//                            alert.addAction(UIAlertAction(title: "تـم", style: .cancel, handler: { _ in
//                                self.presentHomeVC()
//                            }))
//
//                            self.present(alert, animated:true)
//
//                        }
                        
                    }
                    
                }
            }
        }else {
            DispatchQueue.main.async {
                self.showAlert("خطأ", "من فضلك أملأ جميع البيانات", "تم")
            }
            
        }
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
extension LoginVC : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.endEditing(true)
         passwordTextField.endEditing(true)
    return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}

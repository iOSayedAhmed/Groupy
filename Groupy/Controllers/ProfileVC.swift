//
//  ProfileVC.swift
//  Groupy
//
//  Created by Develop on 5/10/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var currenetPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    var parameters = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "الصفحة الشخصية"
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let userInfo = LocalState.userInfo as? [String:String] else {return}
        userNameLabel.text = userInfo["name"]
        userEmailLabel.text = userInfo["email"]
        nameTextField.text = userInfo["name"]
        phoneNumberTextField.text = userInfo["phone"]
        emailTextField.text = userInfo["email"]
    }
    @IBAction func editUserImageClickedButton(_ sender: UIButton) {
        print("editUserImageClickedButton")
        
    }
    
    @IBAction func updateUserInfoClickedButton(_ sender: UIButton) {
        updateUserInfo()
        
        
    }
    
    @IBAction func ForgotPasswordClickedButton(_ sender: UIButton) {
        print("ForgotPasswordClickedButton")
    }
    
    @IBAction func ResetPasswordClickedButton(_ sender: Any) {
        
        print("ResetPasswordClickedButton")
    }
    
    
    
}
extension ProfileVC {
    //MARK: - Functions
    
    func updateUserInfo(){
        if let name = nameTextField.text , let email = emailTextField.text , let phone = phoneNumberTextField.text , let id = LocalState.userInfo["id"] as? String {
            parameters = ["id":id ,"name":name,"email":email,"phone":phone]
            
            DispatchQueue.global(qos: .background).async {
                APIServices.shared.postMSGRequest(url: "update_info_student.php", parameters: self.parameters) { responseMSG in
                    if responseMSG == "0" {
                        DispatchQueue.main.async {
                            self.showAlert("تنبية ⚠️", "لم يتم تحديث البيانات", "تم")
                        }
                    }else {
                        DispatchQueue.main.async {
                            self.showAlert("تنبية", "تم تحديث البيانات بنجاح", "تم")
                            self.userNameLabel.text = name
                            self.userEmailLabel.text = email
                            LocalState.userInfo["name"] = name
                            LocalState.userInfo["email"] = email
                            
                        }
                    }
                }
            }
        }
    }
    
    
}

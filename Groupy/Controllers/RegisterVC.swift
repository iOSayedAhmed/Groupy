//
//  RegisterVC.swift
//  Groupy
//
//  Created by Develop on 5/9/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit
import DropDown
import Alamofire
import SwiftyJSON

class RegisterVC: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var educationalLevelContainer: UIView!
    @IBOutlet weak var educationalLevelLabel: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var parameters = [String:String]()
    
    
    var educationalLevel : DropDown = {
        let list = DropDown()
        list.dataSource = [
            "الصف الأول الثانوي",
            "الصف الثاني الثانوي",
            "الصف الثالث الثانوي"
        ]
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailTextField,userNameTextField,phoneNumberTextField,passwordTextField].forEach {
            $0?.delegate = self
        }
        setupDropDwonList()
        
    }
    
    //MARK: - Functions
    
    func setupDropDwonList(){
        educationalLevel.anchorView = educationalLevelContainer
        educationalLevel.bottomOffset = CGPoint(x: 0, y: (educationalLevelLabel.frame.height))
        educationalLevel.topOffset = CGPoint(x: 0, y: -(educationalLevelLabel.frame.height))
        educationalLevel.direction = .bottom
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(educationalLevelListClicked))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        educationalLevelLabel.addGestureRecognizer(gesture)
        educationalLevel.translatesAutoresizingMaskIntoConstraints = false
        
        
        // DropDwonList for Category Field
        educationalLevel.selectionAction = {index , item in
            self.educationalLevelLabel.text = item
            self.educationalLevelLabel.textColor = .black
            print("selected : \(index)and title : \(item)")
        }
    }
    
    
    
    @objc func educationalLevelListClicked(){
        
        educationalLevel.show()
    }
    
    
    @IBAction func registerClickedButton(_ sender: Any) {
        
        //TODO
        // 1- insert Student
        registerNewUser()
        
    }
    
    @IBAction func loginClickedButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
extension RegisterVC : UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    //MARK: - Functions
    
    func registerNewUser()  {
        if let name = userNameTextField.text , let password = passwordTextField.text, let email = emailTextField.text, let phase = educationalLevelLabel.text , let phone = phoneNumberTextField.text , !email.isEmpty && !password.isEmpty , !name.isEmpty , !phase.isEmpty , !phone.isEmpty {
            parameters = ["email":email,"password":password,"name":name,"phone":phone,"phase":phase]
            
            if phone.count == 11 {
                DispatchQueue.global(qos: .background).async {
                    APIServices.shared.registerRequest(url: "insert_student.php", parameters: self.parameters) { responseMSG , isSuccess in
                        print(responseMSG)
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "تنبية", message: responseMSG, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "تـم", style: .cancel, handler: { _ in
                                if isSuccess {
                                    let userInfo : [String:Any] = ["name":name,"email":email,"phone":phone]
                                    self.presentLoginVC()
                                    
                                }else {
                                    print("can't Register..")
                                }
                                
                            }))
                            
                            self.present(alert, animated:true)
                            
                        }
                    }
                }
                
            }else {
                DispatchQueue.main.async {
                    self.showAlert("تنبية", "رقم الموبايل يجب ان يكون ١١ رقم ❌", "تـم")
                }
            }
        } else {
            DispatchQueue.main.async {
                self.showAlert("تنبية ", "من فضلك أملأ جميع البيانات ❌", "تـم")
            }
            
        }
    }
}

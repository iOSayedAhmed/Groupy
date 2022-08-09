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
        if let name = userNameTextField.text , let password = passwordTextField.text, let email = emailTextField.text, let phase = educationalLevelLabel.text , let phone = phoneNumberTextField.text , !email.isEmpty && !password.isEmpty , !name.isEmpty , !phase.isEmpty , !phone.isEmpty {
            
            if phone.count == 11 {
                DispatchQueue.global(qos: .background).async {
                    APIServices.shared.registerRequest(url: "insert_student.php", email: email, name: name, password: password, phone: phone, phase: phase) { responseMSG in
                        DispatchQueue.main.async {
                            self.showAlert("خطأ", responseMSG!, "Ok")
                        }
                        
                    }
                }
                
            }else {
                DispatchQueue.main.async {
                    self.showAlert("خطأ", "رقم الموبايل يجب ان يكون ١١ رقم", "تم")
                }
                
            }
        } else {
            DispatchQueue.main.async {
                self.showAlert("خطأ", "من فضلك أملأ جميع البيانات", "تم")
            }
            
            
        }
        
    }
    
    @IBAction func loginClickedButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}

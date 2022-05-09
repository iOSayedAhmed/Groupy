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
    func presentRegisterVC() {
          // let vc = UIViewController(nibName: "RegisterVC", bundle: nil)
           let vc = storyboard?.instantiateViewController(identifier: "RegisterVC") as! RegisterVC
           vc.modalPresentationStyle = .fullScreen
           present(vc, animated: true, completion: nil)
       }
    
    @IBAction func forgotPasswordClickedButton(_ sender: UIButton) {
        print("forgot password")
    }
    
    @IBAction func loginClickedButton(_ sender: UIButton) {
        
        
    }
    @IBAction func registerClickedButton(_ sender: UIButton) {
        presentRegisterVC()
    }
    

}

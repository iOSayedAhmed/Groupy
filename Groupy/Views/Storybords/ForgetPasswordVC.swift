//
//  ForgetPasswordVC.swift
//  Groupy
//
//  Created by Develop on 09/10/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class ForgetPasswordVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendCodeClickedButton(_ sender: Any) {
        let code = random(digits: 6)
        guard let email = emailTextField.text else {return}
        
        APIServices.shared.postRequst(email: email, code: code) { message in
            if message as! String == "success" {
                let vc = VerifyCodeVC.loadFromNib()
                vc.code = code
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else if message as! String == "error" {
                self.showAlert("خطأ", "من فضلك أملأ البريد الإلكتروني الخاص بك ", "تـم")
            }else {
                self.showAlert("خطأ", "البريد الإلكتروني خطأ ", "تـم")
            }
        }
        

       
    }

}

extension ForgetPasswordVC {
    //MARK: Functions
    
    func random(digits:Int) -> String {
        var number = String()
        for _ in 1...digits {
           number += "\(Int.random(in: 1...9))"
        }
        return number
    }
}

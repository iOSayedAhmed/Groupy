//
//  ConfirmPasswordVC.swift
//  Groupy
//
//  Created by Develop on 09/10/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class VerifyCodeVC: UIViewController {

    @IBOutlet weak var verifyCodeTextField: OneTimeCodeTextField!
    
    var code:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        verifyCodeTextField.configure()
    }


    @IBAction func ConfirmCodeClickedButton(_ sender: UIButton) {
    
        if code == verifyCodeTextField.text {
            let vc = ConfirmPasswordVC.loadFromNib()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }else {
            showAlert("خطأ", "الكود غير صحيح", "تـم")
        }
     
        
        
        
    }
    

}

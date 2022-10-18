//
//  ConfirmPasswordVC.swift
//  Groupy
//
//  Created by Develop on 12/10/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class ConfirmPasswordVC: UIViewController {

    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func confirmPasswordClickedButton(_ sender: UIButton) {
        
        print("Confirmed >>>>")
    }
}

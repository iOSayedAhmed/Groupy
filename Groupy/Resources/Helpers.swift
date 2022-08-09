//
//  Helpers.swift
//  Groupy
//
//  Created by Develop on 09/08/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import Foundation
import UIKit
 
extension UIViewController {
    
    func presentLoginVC() {
       // let vc = UIViewController(nibName: "LoginVC", bundle: nil)
        let vc = storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}

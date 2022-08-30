//
//  Resources.swift
//  Groupy
//
//  Created by Develop on 5/10/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField:UITextField {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        underLined()
    }
    
    let padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12)
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)

    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)

    }
  @objc  func underLined() {
       let bottomLine = CALayer()
       bottomLine.frame = CGRect(x: 0, y: self.frame.height - 2, width: self.frame.width , height: 2 )
       bottomLine.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
       //self.borderStyle = .none
       self.layer.addSublayer(bottomLine)

   }

}



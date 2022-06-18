//
//  VideosList.swift
//  Groupy
//
//  Created by Develop on 5/10/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class VideosList: UIViewController {
    
//    let leftBarButton : UIButton = {
//        let backButton = UIButton(type: UIButton.ButtonType.custom)
//              backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
//              backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
//
//          return backButton
//      }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "قوائم الفيديوهات"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow.left"), style: .done, target: self, action: #selector(backButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    //MARK:- Functions
    
    @objc func backButtonClicked() {
        print("Back")
        self.dismissDetail()
    }
    
    
   

}

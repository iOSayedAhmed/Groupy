//
//  ViewControllerExt.swift
//  GoalDone
//
//  Created by Develop on 2/6/20.
//  Copyright © 2020 Develop. All rights reserved.
//

import UIKit
extension UIViewController  {
    
    // Set Indentifier to View Controller using it's name
    
    static var indenteifier:String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: indenteifier) as! Self
    }
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
    
    
    // Alert Controller
    func showAlert( _ title:String , _ message:String , _ actionTitle:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .cancel))
        present(alert, animated: true)
    }
    
    //present Onboarding View Controller
    func presentOnboardVC() {
        let vc = UIStoryboard(name: "Main", bundle: nibBundle).instantiateViewController(identifier: "OnboardVC") as! OnboardVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    //present Register View Controller
    func presentRegisterVC() {
        // let vc = UIViewController(nibName: "RegisterVC", bundle: nil)
        let vc = storyboard?.instantiateViewController(identifier: "RegisterVC") as! RegisterVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    //present home View Controller
    func presentHomeVC() {
        let vc = UIStoryboard(name: "Main", bundle: nibBundle).instantiateViewController(identifier: "TabBarContainer") as! TabBarContainer
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true, completion: nil)
    }
    
    
    // present login View Controller
    func presentLoginVC() {
        // let vc = UIViewController(nibName: "LoginVC", bundle: nil)
        let vc = storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    // custom func for present View Controller as Navigation Controller
    func presentDetail(_ viewControllerTopresent : UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewControllerTopresent, animated: false, completion: nil)
    }
    
    func presentSecondaryDetail(_ viewControllerTopresent : UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        guard let presentsdViewController = presentedViewController else {return}
        presentsdViewController.dismiss(animated: false, completion: {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerTopresent, animated: false, completion: nil)
        })
        
        
    }
    
    // custom func for dismiss View Controller as Navigation Controller
    func dismissDetail(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
    
    // Function To create Bar Button item
    
    func createBarButtonItem()  {
             title = "قوائم الفيديوهات"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow.left"), style: .done, target: self, action: #selector(ButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    @objc func ButtonClicked() {
        self.dismissDetail()
    }
    
}

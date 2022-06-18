//
//  HomeVC.swift
//  Groupy
//
//  Created by Develop on 5/10/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    let leftBarButton : UIButton = {
        let backButton = UIButton()
            backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
            backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        
        return backButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.1929970086, green: 0.2383353114, blue: 0.285562396, alpha: 1)
        tabBarController?.tabBar.backgroundColor = #colorLiteral(red: 0.1929970086, green: 0.2383353114, blue: 0.285562396, alpha: 1)
        
        
    }
    //MARK:- Functions
    
    @objc func backButtonClicked() {
        self.dismissDetail()
    }
    
    
    @IBAction func videosListClickedButton(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(identifier: "VideosList") as! VideosList
        let nav = UINavigationController(rootViewController: vc)
//        nav.navigationBar.tintColor = #colorLiteral(red: 0.1929970086, green: 0.2383353114, blue: 0.285562396, alpha: 1)
//        nav.navigationBar.backgroundColor = #colorLiteral(red: 0.1929970086, green: 0.2383353114, blue: 0.285562396, alpha: 1)
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(red: 0.19, green: 0.238, blue: 0.2855, alpha: 1)
            appearance.titleTextAttributes = [.foregroundColor : UIColor.white]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        nav.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
	        vc.title  = "قوائم الفيديوهات"
        nav.modalPresentationStyle = .fullScreen
        presentDetail(nav)
    }
    
    func showAlert( _ title:String , _ message:String , _ actionTitle:String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: actionTitle, style: .cancel))
           present(alert, animated: true)
       }
    @IBAction func examsListClickedButton(_ sender: UIButton) {
        print("Present Exams List ----> ")
       showAlert("تنوية", "نعمل من أجل حضراتكم ..  يتم العمل عليها ", "إلغاء")

    }
    
    
    

}

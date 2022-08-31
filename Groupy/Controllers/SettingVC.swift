//
//  SettingVC.swift
//  Groupy
//
//  Created by Develop on 11/08/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    var parameters = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func videosListClickedButton(_ sender: UIButton) {
        guard let grade = LocalState.userInfo["grade"] as? String , let groupId = LocalState.userInfo["groubId"] as? String else {return}
        
      if groupId == "0" {
          showAlert("تنبية", "من فضلك تواصل مع المدرس لإضافتك لمجموعة", "تم")
      } else {
          parameters = ["grade":grade]
          self.getVideosLists()
      }
        
    }
    
    @IBAction func examsListClickedButton(_ sender: UIButton) {
        print("Present Exams List ----> ")
        showAlert("تنوية", "نعمل من أجل حضراتكم ..  يتم العمل عليها ", "إلغاء")
    }

    @IBAction func logoutClickedButton(_ sender: UIButton) {
        print("LoggedOut")
    }
    
    
    //MARK: - Functions
    
    
    func getVideosLists() {
      
        APIServices.shared.postRequest(url: "select_viedo_list.php", parameter: self.parameters, method: nil, headers: nil) { [self]  (lists:[VideoListsModel]? , error) in
            
            if let error = error {
                print("faild in fetch data",error.localizedDescription)
            }else {
                guard let lists = lists else {return}
                
                DispatchQueue.main.async
                { print("Success ", lists)
                    let vc = storyboard?.instantiateViewController(identifier: "VideosLists") as! VideosLists
                    vc.lists = lists
                    let nav = UINavigationController(rootViewController: vc)
                    nav.navigationBar.tintColor = #colorLiteral(red: 0.1929970086, green: 0.2383353114, blue: 0.285562396, alpha: 1)
                    nav.navigationBar.backgroundColor = #colorLiteral(red: 0.1929970086, green: 0.2383353114, blue: 0.285562396, alpha: 1)
                    if #available(iOS 15, *) {
                        let appearance = UINavigationBarAppearance()
                        appearance.configureWithOpaqueBackground()
                        appearance.backgroundColor = UIColor(red: 0.19, green: 0.238, blue: 0.2855, alpha: 1)
                        appearance.titleTextAttributes = [.foregroundColor : UIColor.white]
                        UINavigationBar.appearance().standardAppearance = appearance
                        UINavigationBar.appearance().scrollEdgeAppearance = appearance
                        
                        nav.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
                        vc.title  = "قوائم الفيديوهات"
                        nav.modalPresentationStyle = .fullScreen
                    }
                    self.presentDetail(nav)
                }
                
            }
            
            
            
        }
        
        func presentNAVListVideos() {
            let vc = storyboard?.instantiateViewController(identifier: "VideosLists") as! VideosLists
            
            let nav = UINavigationController(rootViewController: vc)
            nav.navigationBar.tintColor = #colorLiteral(red: 0.1929970086, green: 0.2383353114, blue: 0.285562396, alpha: 1)
            nav.navigationBar.backgroundColor = #colorLiteral(red: 0.1929970086, green: 0.2383353114, blue: 0.285562396, alpha: 1)
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
            
            self.presentDetail(nav)
        }
        
    }
}

//
//  ExamsVC.swift
//  Groupy
//
//  Created by Develop on 02/10/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class ExamsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createBarButtonItem()
        tableView.register(UINib(nibName: "ExamTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
       
    }
    

}
extension ExamsVC :UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExamTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
}

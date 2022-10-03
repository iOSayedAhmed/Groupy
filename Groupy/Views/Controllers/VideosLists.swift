//
//  VideosList.swift
//  Groupy
//
//  Created by Develop on 5/10/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class VideosLists: UIViewController  {
    
    
    var lists = [VideoListsModel]()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBarButtonItem()
        [collectionView].forEach {
            $0?.delegate = self
            $0?.dataSource = self
        }
        
    }
    
    
}
extension VideosLists : UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VideosListsCell
        cell.videoListTitle.text = lists[indexPath.item].listName
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = (view.frame.width-30)/2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        APIServices.shared.postRequest(url: "select_videos.php", parameter: ["video_list_id":lists[indexPath.item].id], method: nil, headers: nil) {(listOfVideos:[VideosModel]? , error) in
            if let error = error {
                //Error
                print("faild to fetch data" , error.localizedDescription)
            }else {
                //Success
                guard let listOfVideos = listOfVideos else { return }
                DispatchQueue.main.async {
                    let vc =  ListsOfVideos.instantiate()
                    vc.listOfVideos = listOfVideos
                    vc.indexFlag = indexPath.item
                    let nav = UINavigationController(rootViewController: vc)
                    nav.navigationBar.tintColor = #colorLiteral(red: 0.1929970086, green: 0.2383353114, blue: 0.285562396, alpha: 1)
                    nav.navigationBar.backgroundColor = #colorLiteral(red: 0.1929970086, green: 0.2383353114, blue: 0.285562396, alpha: 1)
                    nav.modalPresentationStyle = .fullScreen
                    self.presentDetail(nav)
                }
            }
            
        }
       
    }
  
}

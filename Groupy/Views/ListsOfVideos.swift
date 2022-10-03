//
//  ListsOfVideos.swift
//  Groupy
//
//  Created by Develop on 16/08/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
import DropDown

class ListsOfVideos: UIViewController, YTPlayerViewDelegate {

    var listOfVideos = [VideosModel]()
    var indexFlag = Int()
    var urlArray = [String]()
    
    
    @IBOutlet weak var playerView: YTPlayerView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var listVideosTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Foo >>>>",listOfVideos)
        getVideoID()
        print("Array :" , urlArray)
        listVideosTitleLabel.text = listOfVideos[indexFlag].titleVideo
        print(view.frame.height / 3)
        [tableView].forEach{
            $0?.delegate = self
            $0?.dataSource = self
        }
        tableView.register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "VideoCell")
       
        createBarButtonItem()
        listVideosTitleLabel.setUnderLine(x: listVideosTitleLabel.frame.width / 4 ,y: listVideosTitleLabel.frame.height - 12, width: listVideosTitleLabel.frame.width / 2 ,height: 3)
        
        
        
    }
    //MARK: - Functions
    func getVideoID() {
        for i in listOfVideos {
            if   i.url.contains("https")
            {
                   guard let url  = i.url.youtubeID else {return}
                   urlArray.append(url)
            }else{
                urlArray.append("hyjsxH9PAOk")
            }
               }
    }


}
extension ListsOfVideos:UITableViewDelegate,UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfVideos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        cell.backgroundColor = .systemBackground
        cell.PlayerView.delegate = self
       // cell.PlayerView.backgroundColor = .black
        cell.numberOfVideoLabel.text = "\(indexPath.item + 1)"
        cell.PlayerView.load(withVideoId: urlArray[indexPath.item])
       
     

        return cell
    }



    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (view.frame.height / 4)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}
extension String {
    var youtubeID: String? {
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/)|(?<=shorts/))([\\w-]++)"

        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)

        guard let result = regex?.firstMatch(in: self, range: range) else {
            return nil
        }

        return (self as NSString).substring(with: result.range)
    }
}

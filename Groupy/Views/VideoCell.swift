//
//  VideoCell.swift
//  Groupy
//
//  Created by Develop on 18/08/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit
import youtube_ios_player_helper


class VideoCell: UITableViewCell, YTPlayerViewDelegate {

    @IBOutlet weak var PlayerView: YTPlayerView!
    @IBOutlet weak var numberOfVideoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

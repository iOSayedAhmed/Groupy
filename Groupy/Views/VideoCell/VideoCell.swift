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
    
    @IBOutlet weak var videoNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    
}

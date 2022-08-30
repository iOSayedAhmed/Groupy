//
//  OnboardCell.swift
//  Groupy
//
//  Created by Develop on 5/8/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit


class OnboardCell: UICollectionViewCell {
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func setUp(_ slide : SlideModel) {
        self.ImageView.image = slide.image
        self.descriptionLabel.text = slide.description
    }
}

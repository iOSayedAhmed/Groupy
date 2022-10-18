//
//  PDFsCell.swift
//  Groupy
//
//  Created by Develop on 18/10/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class PDFsCell: UITableViewCell {

    @IBOutlet weak var pdfImageView: UIImageView!
    @IBOutlet weak var pdfTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

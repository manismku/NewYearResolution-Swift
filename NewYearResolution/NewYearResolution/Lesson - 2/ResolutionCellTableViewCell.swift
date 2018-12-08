//
//  ResolutionCellTableViewCell.swift
//  NewYearResolution
//
//  Created by Manish Kumar on 05/12/18.
//  Copyright © 2018 manish. All rights reserved.
//

import UIKit

class ResolutionCellTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgCheckMark: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

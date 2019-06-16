//
//  SectionTitleTableViewCell.swift
//  WeVol
//
//  Created by Thiago Lucena on 13/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class SingleLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

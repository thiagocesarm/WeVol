//
//  OpportunityTableViewCell.swift
//  WeVol
//
//  Created by Thiago Lucena on 13/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class OpportunityTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bottomLineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

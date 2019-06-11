//
//  InstitutionTableViewCell.swift
//  WeVol
//
//  Created by Thiago Lucena on 11/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class InstitutionTableViewCell: UITableViewCell {

    @IBOutlet weak var institutionImageView: UIImageView!
    @IBOutlet weak var institutionNameLabel: UILabel!
    @IBOutlet weak var institutionCategoryLabel: UILabel!
    
    var institution: Institution! {
        didSet {
            institutionImageView.image = UIImage(named: institution.image)
            institutionNameLabel.text = institution.name
            institutionCategoryLabel.text = institution.category
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

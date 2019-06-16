//
//  ShareViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    @IBOutlet weak var institutionNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var institution: Institution!

    override func viewDidLoad() {
        descriptionLabel.text = "Compartilhe o trabalho do(a) \(institution.name) para que mais pessoas possam conhecer a instituição"
        descriptionLabel.attributedText = descriptionLabel.text?.attributedText(boldString: institution.name, font: descriptionLabel.font)
    }
    
    @IBAction func closeShareScreen(_ sender: Any) {
        self.dismiss(animated: true)
    }

}

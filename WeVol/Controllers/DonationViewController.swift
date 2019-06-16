//
//  DonationViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class DonationViewController: UIViewController {
    
    @IBOutlet weak var institutionNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var institution: Institution!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = "Você pode realizar transações financeiras para o(a) \(institution.name) através dos dados bancários abaixo"
        descriptionLabel.attributedText = descriptionLabel.text?.attributedText(boldString: institution.name, font: descriptionLabel.font)

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func closeDonationScreen(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension DonationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return institution.bankAccountList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let bankAccountCell = tableView.dequeueReusableCell(withIdentifier: "BankAccountTableViewCell") as? BankAccountTableViewCell else {
            return UITableViewCell()
        }
        
        bankAccountCell.bankAccount = institution.bankAccountList[indexPath.row]
        
        if indexPath.row == institution.bankAccountList.count - 1 {
            bankAccountCell.bottomLineView.isHidden = true
        }
        
        return bankAccountCell
    }
    
    
}

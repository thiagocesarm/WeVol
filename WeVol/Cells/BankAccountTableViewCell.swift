//
//  BankAccountTableViewCell.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class BankAccountTableViewCell: UITableViewCell {

    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var bankAccountAgency: UILabel!
    @IBOutlet weak var bankAccountNumber: UILabel!
    @IBOutlet weak var bottomLineView: UIView!
    
    var bankAccount: BankAccount! {
        didSet {
            bankName.text = bankAccount.bankName
            bankAccountAgency.text = "Agência: \(bankAccount.agencyNumber)"
            bankAccountNumber.text = "Conta: \(bankAccount.accountNumber)"
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

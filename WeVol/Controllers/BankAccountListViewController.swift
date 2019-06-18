//
//  BankAccountListViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 17/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class BankAccountListViewController: UIViewController {

    let bankAccountToShow = BankAccount(bankName: "Caixa Econômica Federal", agencyNumber: "XXXX-X", accountNumber: "XXXXX-X")
    @IBOutlet weak var tableView: UITableView!
    
    var shouldShowTableView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if shouldShowTableView {
            tableView.isHidden = false
            tableView.reloadData()
        } else {
            tableView.isHidden = true
        }
    }
    
    @IBAction func goToAddAccountPage() {
        shouldShowTableView = true
        performSegue(withIdentifier: "showAddBankAccount", sender: self)
    }
    
}

extension BankAccountListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bankAccountCell = Bundle.main.loadNibNamed("BankAccountTableViewCell", owner: self, options: nil)?.first as! BankAccountTableViewCell
        bankAccountCell.bankAccount = bankAccountToShow
        return bankAccountCell
    }
    
}

//
//  UserMenuViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 17/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class UserMenuViewController: UIViewController {
    
    @IBOutlet weak var institutionNameLabel: UILabel!
    
    var institution: Institution!
    var shouldPresentAlert = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "WeVol"
        self.navigationItem.hidesBackButton = true
        
        institutionNameLabel.text = institution.name
        
        if shouldPresentAlert {
            let alert = UIAlertController(title: "", message: "Instituição cadastrada com sucesso!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Sim", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let addBankAccountViewController = segue.destination as! BankAccountListViewController
//        let institution = DatabaseSimulator.getInstitutionData().first
//        addBankAccountViewController.institution = institution
//    }
    
    @IBAction func goToAddBankAccountScreen() {
        performSegue(withIdentifier: "bankAccountList", sender: self)
    }
    

}

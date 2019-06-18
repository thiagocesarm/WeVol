//
//  AddBankAccountViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 17/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class AddBankAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func closeAddBankAccountScreen() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addBankAccount() {
        let alert = UIAlertController(title: "Sucesso ✅", message: "Cadastro realizado com sucesso!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.closeAddBankAccountScreen()
        })
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
}

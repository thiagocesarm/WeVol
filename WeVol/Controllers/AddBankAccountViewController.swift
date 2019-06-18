//
//  AddBankAccountViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 17/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit
import DropDown

class AddBankAccountViewController: UIViewController {

    @IBOutlet weak var bankNameTextField: UITextField!
    @IBOutlet weak var bankAccountAgencyTextField: UITextField!
    @IBOutlet weak var bankAccountNumber: UITextField!
    @IBOutlet weak var bankNameAnchorView: UIView!
    
    let bankNameDropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        bankNameTextField.delegate = self
        
        bankNameDropDown.anchorView = bankNameAnchorView
        bankNameDropDown.dataSource = ["Banco do Brasil", "Caixa Econômica Federal", "Itaú", "Santander"]
        
        bankNameDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.bankNameTextField.text = item
        }
    }
    
    @IBAction func closeAddBankAccountScreen() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addBankAccount() {
        DatabaseSimulator.bankAccountToShow = BankAccount(bankName: bankNameTextField.text!, agencyNumber: bankAccountAgencyTextField.text!, accountNumber: bankAccountNumber.text!)
        
        let alert = UIAlertController(title: "Sucesso ✅", message: "Cadastro realizado com sucesso!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.closeAddBankAccountScreen()
        })
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
}

extension AddBankAccountViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        bankNameDropDown.show()
        return false
    }
}

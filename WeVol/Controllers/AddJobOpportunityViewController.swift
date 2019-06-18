//
//  AddJobOpportunityViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 18/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit
import DropDown

class AddJobOpportunityViewController: UIViewController {

    @IBOutlet weak var jobTypeTextField: UITextField!
    @IBOutlet weak var jobTypeAnchorView: UIView!
    @IBOutlet weak var jobDatePicker: UIDatePicker!
    @IBOutlet weak var jobDetailsTextView: UITextView!
    
    let jobTypeDropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobTypeTextField.delegate = self
        hideKeyboardWhenTappedAround()
        jobTypeDropDown.anchorView = jobTypeAnchorView
        jobTypeDropDown.dataSource = DatabaseSimulator.getAllJobTypes().map { $0.string }
        
        jobTypeDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.jobTypeTextField.text = item
        }
        jobDetailsTextView.layer.borderWidth = 1
        jobDetailsTextView.layer.borderColor = UIColor.lightGray.cgColor
        jobDetailsTextView.layer.cornerRadius = 5.0
    }
    
    @IBAction func closeJobOpportunityScreen() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addJobOpportunity() {
        DatabaseSimulator.opportunityToShow = Opportunity(date: jobDatePicker.date.toString, title: jobTypeTextField.text!, description: jobDetailsTextView.text)
        
        let alert = UIAlertController(title: "Sucesso ✅", message: "Cadastro realizado com sucesso!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.closeJobOpportunityScreen()
        })
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
}

extension Date {
    var toString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd/MM/yyyy"
        
        let dateString = formatter.string(from: self)
        return dateString
    }
}

extension AddJobOpportunityViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        jobTypeDropDown.show()
        return false
    }
}

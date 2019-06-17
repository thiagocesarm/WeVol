//
//  InstitutionSignUpViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class InstitutionSignUpViewController: UIViewController {

    @IBOutlet weak var institutionNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }

    @IBAction func goToInstitutionMapSignUp() {
        performSegue(withIdentifier: "InstitutionMapSignUp", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InstitutionMapSignUp"{
            let institutionMapSignUpViewController = segue.destination as! InstitutionMapSignUpViewController
            institutionMapSignUpViewController.institutioName = institutionNameTextField.text
        }
    }
}

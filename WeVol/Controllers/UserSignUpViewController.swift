//
//  UserSignUpViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class UserSignUpViewController: UIViewController {

    @IBOutlet weak var confirmSignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        confirmSignUpButton.roundButton()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func confirmSignUp() {
        DatabaseSimulator.isLoggedIn = true
        let alert = UIAlertController(title: "Sucesso ✅", message: "Cadastro realizado com sucesso!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.tabBarController?.selectedIndex = 1
        })
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
}

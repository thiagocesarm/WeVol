//
//  SignInViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func goToUserPage() {
    }
    
    @IBAction func goToSignUpPage() {
        performSegue(withIdentifier: "SignUp", sender: self)
    }

}

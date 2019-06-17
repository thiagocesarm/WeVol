//
//  SignInViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        signInButton.roundButton()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if DatabaseSimulator.isLoggedIn {
            let perfilVC = storyboard?.instantiateViewController(withIdentifier: "UserMenu") as! UserMenuViewController
            navigationController?.pushViewController(perfilVC, animated: false)
        }
    }
    
    @IBAction func goToUserPage() {
    }
    
    @IBAction func goToSignUpPage() {
        performSegue(withIdentifier: "SignUp", sender: self)
    }

}

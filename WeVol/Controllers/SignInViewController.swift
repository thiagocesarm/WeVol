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
        if DatabaseSimulator.isLoggedIn, DatabaseSimulator.loggedInstitution != nil {
            let perfilVC = storyboard?.instantiateViewController(withIdentifier: "UserMenu") as! UserMenuViewController
            
            perfilVC.institution = DatabaseSimulator.loggedInstitution!
            navigationController?.pushViewController(perfilVC, animated: false)
        }
    }
    
    @IBAction func goToUserPage() {
        DatabaseSimulator.isLoggedIn = true
        DatabaseSimulator.loggedInstitution = DatabaseSimulator.simulatedInstitutionLogged
        
        let perfilVC = storyboard?.instantiateViewController(withIdentifier: "UserMenu") as! UserMenuViewController
        
        perfilVC.institution = DatabaseSimulator.loggedInstitution!
        navigationController?.pushViewController(perfilVC, animated: false)
    }
    
    @IBAction func goToSignUpPage() {
        performSegue(withIdentifier: "SignUp", sender: self)
    }

}

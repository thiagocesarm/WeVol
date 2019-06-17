//
//  SelectSignUpTypeViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class SelectSignUpTypeViewController: UIViewController {

    @IBOutlet weak var userSignUpButton: UIButton!
    @IBOutlet weak var institutionSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userSignUpButton.roundButton()
        institutionSignUp.roundButton()
    }

    @IBAction func goToUserSignUp() {
        performSegue(withIdentifier: "UserSignUp", sender: self)
    }
    
    @IBAction func goToInstitutionSignUp() {
        performSegue(withIdentifier: "InstitutionSignUp", sender: self)
    }
    
}

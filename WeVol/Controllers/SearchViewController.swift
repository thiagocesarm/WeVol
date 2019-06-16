//
//  SearchViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit
import DropDown

class SearchViewController: UIViewController {
    
    @IBOutlet weak var institutionNameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var typeDropDownAnchorView: UIView!
    @IBOutlet weak var distanceDropDownAnchorView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var openMapButton: UIButton!
    
    let typeDropDown = DropDown()
    let distanceDropDown = DropDown()
    
    let typeDataSource = ["Todos os tipos de trabalho", "Trabalhos Manuais", "Cuidados de Pessoas"]
    let distanceDataSource = ["Qualquer distância", "0.5 km", "1 km", "3 km", "5 km"]
    
    var jobTypeSelected = ""
    var distanceSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        jobTypeSelected = typeDataSource[0]
        distanceSelected = distanceDataSource[0]
        
        configureDropDown()
        
        tableView.isHidden = true
        openMapButton.isHidden = true
        
        typeTextField.delegate = self
        distanceTextField.delegate = self
    }
    
    func configureDropDown() {
        // Type drop down
        typeDropDown.anchorView = typeDropDownAnchorView
        typeDropDown.dataSource = typeDataSource
        
        // Distance drop down
        distanceDropDown.anchorView = distanceDropDownAnchorView
        distanceDropDown.dataSource = distanceDataSource
        
        typeDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.jobTypeSelected = item
            self.typeTextField.text = item
        }
        distanceDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.distanceSelected = item
            self.distanceTextField.text = item
        }
    }
    
    
    @IBAction func searchInstitutions(_ sender: Any) {
        print("\(jobTypeSelected) -- \(distanceSelected)")
    }
    
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == typeTextField {
            typeDropDown.show()
        } else if textField == distanceTextField {
            distanceDropDown.show()
        }
        return false
    }
}

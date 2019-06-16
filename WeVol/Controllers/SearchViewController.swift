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
    
    let allInstitutions = DatabaseSimulator.getInstitutionData()
    var searchResultInstitutions: [Institution] = []
    let typeDropDown = DropDown()
    let distanceDropDown = DropDown()
    
    let allJobTypes = DatabaseSimulator.getAllJobTypes()
    var typeDataSource = ["Todos os tipos de trabalho"]
    let distanceDataSource = ["Qualquer distância", "0.5 km", "1 km", "3 km", "5 km"]
    
    var jobTypeSelected: JobType?
    var distanceSelected: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        typeDataSource += DatabaseSimulator.getAllJobTypes().map { $0.string }
        
        configureDropDown()
        
        tableView.isHidden = true
        openMapButton.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
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
            if index > 0 {
                self.jobTypeSelected = self.allJobTypes[index - 1]
            } else {
                self.jobTypeSelected = nil
            }
            self.typeTextField.text = item
        }
        distanceDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            if index > 0 {
                let distanceString = String(item.dropLast(3))
                self.distanceSelected = (distanceString as NSString).floatValue
            } else {
                self.distanceSelected = nil
            }
            self.distanceTextField.text = item
        }
    }
    
    
    @IBAction func searchInstitutions(_ sender: Any) {
        searchResultInstitutions = allInstitutions
        
        if let nameToSearch = institutionNameTextField.text?.lowercased(),
            !nameToSearch.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            searchResultInstitutions = searchResultInstitutions.filter {
                return $0.name.lowercased().contains(nameToSearch)
            }
        }
        
        if let jobSelected = jobTypeSelected {
            searchResultInstitutions = searchResultInstitutions.filter {
                return $0.jobTypesList.contains(jobSelected)
            }
        }
        
        if let distance = distanceSelected {
            searchResultInstitutions = searchResultInstitutions.filter {
                return $0.distance <= distance
            }
        }
        
        if searchResultInstitutions.count == 0 {
            tableView.isHidden = true
            openMapButton.isHidden = true
            let alert = UIAlertController(title: "Ops...", message: "Nenhuma instituição encontrada!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        } else {
            tableView.reloadData()
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.scrollToRow(at: indexPath, at: .top, animated: false)
            tableView.isHidden = false
            openMapButton.isHidden = false
        }
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

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultInstitutions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let institutionCell = Bundle.main.loadNibNamed("InstitutionTableViewCell", owner: self, options: nil)?.first as! InstitutionTableViewCell
        institutionCell.institution = searchResultInstitutions[indexPath.row]
        return institutionCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let institutionDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "InstitutionDetails") as! InstitutionDetailsViewController
        
        institutionDetailsViewController.institution = searchResultInstitutions[indexPath.row]
        navigationController?.pushViewController(institutionDetailsViewController, animated: true)
    }
    
}

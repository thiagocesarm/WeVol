//
//  HomeViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 11/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var institutions: [Institution] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadInstitutions()
    }
    
    func loadInstitutions() {
        institutions = DatabaseSimulator.getInstitutionData()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return institutions.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let institutionCell = Bundle.main.loadNibNamed("InstitutionTableViewCell", owner: self, options: nil)?.first as? InstitutionTableViewCell else {
            return UITableViewCell()
        }
        
        institutionCell.institution = institutions[indexPath.section]
        
        return institutionCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let institutionDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "InstitutionDetails") as! InstitutionDetailsViewController
        
        institutionDetailsViewController.institution = institutions[indexPath.section]
        navigationController?.pushViewController(institutionDetailsViewController, animated: true)
    }

}

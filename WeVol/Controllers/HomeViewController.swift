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
        institutions.append(Institution(image: "img01", name: "Mãos Amigas", category: "Educação e Cultura"))
        institutions.append(Institution(image: "img02", name: "Casa de Apoio", category: "Educação e Cultura"))
        institutions.append(Institution(image: "img03", name: "Instituto Ajudare", category: "Educação e Cultura"))
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return institutions.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let institutionCell = tableView.dequeueReusableCell(withIdentifier: "InstitutionTableViewCell") as? InstitutionTableViewCell else {
            return UITableViewCell()
        }
        
        institutionCell.institution = institutions[indexPath.section]
        
        return institutionCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let institutionDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "InstitutionDetails") as! InstitutionDetailsViewController
        navigationController?.pushViewController(institutionDetailsViewController, animated: true)
    }

}

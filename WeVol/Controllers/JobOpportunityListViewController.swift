//
//  JobOpportunityListViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 17/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class JobOpportunityListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var shouldShowTableView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if shouldShowTableView {
            tableView.isHidden = false
            tableView.reloadData()
        } else {
            tableView.isHidden = true
        }
    }

    @IBAction func goToAddOpportunity() {
        shouldShowTableView = !shouldShowTableView
        performSegue(withIdentifier: "addOpportunity", sender: self)
    }
}

extension JobOpportunityListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let opportunityCell = Bundle.main.loadNibNamed("OpportunityTableViewCell", owner: self, options: nil)?.first as! OpportunityTableViewCell
        
        if let currOpportunity = DatabaseSimulator.opportunityToShow {
            
            opportunityCell.dateLabel.text = currOpportunity.date
            opportunityCell.titleLabel.text = currOpportunity.title
            opportunityCell.descriptionLabel.text = currOpportunity.description
            opportunityCell.bottomLineView.isHidden = true
            
        }
        
        return opportunityCell
    }
    
    
}

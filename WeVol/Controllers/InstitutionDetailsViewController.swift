//
//  InstitutionDetailsViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 11/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit

class InstitutionDetailsViewController: UIViewController {
    
    @IBOutlet weak var institutionImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var donationButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var opportunitiesTableView: UITableView!
    
    
    var institution: Institution!
    var opportunitiesList: [Opportunity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        opportunitiesList = institution.opportunityList

        institutionImageView.image = UIImage(named: institution.image)
        nameLabel.text = institution.name
        categoryLabel.text = institution.category
        
        opportunitiesTableView.dataSource = self
        opportunitiesTableView.delegate = self
        opportunitiesTableView.rowHeight = UITableView.automaticDimension;
        opportunitiesTableView.estimatedRowHeight = 60.0
        opportunitiesTableView.reloadData()
    }
    
    @IBAction func goToDonationPage(_ sender: Any) {
        performSegue(withIdentifier: "institutionDetailsToDonationSegue", sender: self)
    }
    
    @IBAction func goToSharePage(_ sender: Any) {
        performSegue(withIdentifier: "institutionDetailsToShareSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "institutionDetailsToDonationSegue" {
            if let donationViewController = segue.destination as? DonationViewController {
                donationViewController.institution = self.institution
            }
        } else if segue.identifier == "institutionDetailsToShareSegue" {
            if let shareViewController = segue.destination as? ShareViewController {
                shareViewController.institution = self.institution
            }
        }
    }

}

extension InstitutionDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return institution.opportunityList.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let singleLabelCell = Bundle.main.loadNibNamed("SingleLabelTableViewCell", owner: self, options: nil)?.first as! SingleLabelTableViewCell
            
//            if indexPath.row == 0 { singleLabelCell.titleLabel.text = "Detalhes"
//            } else if indexPath.row == 1 {
            singleLabelCell.titleLabel.textAlignment = .justified
            
            singleLabelCell.titleLabel.numberOfLines = 0
            singleLabelCell.titleLabel.text = "\t\t\(institution.detailedInfo)"
            
            singleLabelCell.titleLabel.font = UIFont.systemFont(ofSize: 17)
//            }
            
            return singleLabelCell
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let singleLabelCell = Bundle.main.loadNibNamed("SingleLabelTableViewCell", owner: self, options: nil)?.first as! SingleLabelTableViewCell
                singleLabelCell.titleLabel.text = "Oportunidades"
                singleLabelCell.titleLabel.textAlignment = .center
                singleLabelCell.titleLabel.backgroundColor = UIColor.appTheme
                return singleLabelCell
            } else {
                let opportunityCell = Bundle.main.loadNibNamed("OpportunityTableViewCell", owner: self, options: nil)?.first as! OpportunityTableViewCell
                
                let currOpportunity = opportunitiesList[indexPath.row - 1]
                
                opportunityCell.dateLabel.text = currOpportunity.date
                opportunityCell.titleLabel.text = currOpportunity.title
                opportunityCell.descriptionLabel.text = currOpportunity.description
                
                if indexPath.row == opportunitiesList.count {
                    opportunityCell.bottomLineView.isHidden = true
                }
                
                return opportunityCell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1, indexPath.row > 0 {
            if DatabaseSimulator.isLoggedIn {
                let alert = UIAlertController(title: "", message: "Deseja confirmar participação nesse trabalho voluntário?", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
                let okAction = UIAlertAction(title: "Sim", style: .default, handler: { action in
                    let alert = UIAlertController(title: "Sucesso ✅", message: "Participação confirmada!", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                })
                alert.addAction(cancelAction)
                alert.addAction(okAction)
                tableView.deselectRow(at: indexPath, animated: false)
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Alerta", message: "Você precisa estar logado para confirmar participação. Deseja ir para a página de login?", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
                let okAction = UIAlertAction(title: "Sim", style: .default, handler: { action in
                    self.tabBarController?.selectedIndex = 2
                })
                alert.addAction(cancelAction)
                alert.addAction(okAction)
                tableView.deselectRow(at: indexPath, animated: false)
                self.present(alert, animated: true)
            }
        }
    }
    
}

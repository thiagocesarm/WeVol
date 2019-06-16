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
        
        var opportunityList: [Opportunity] = []
        var bankAccountList: [BankAccount] = []
        
        bankAccountList.append(BankAccount(bankName: "Caixa Econômica Federal", agencyNumber: "xxxx-x", accountNumber: "xxxxx-x"))
        bankAccountList.append(BankAccount(bankName: "Banco do Brasil", agencyNumber: "xxxx-x", accountNumber: "xxxxx-x"))
        
        opportunityList.append(Opportunity(date: "01/06/2019", title: "Distribuição de comida", description: "Mutirão para distribuição de sopa e alimentos para os atingidos pela enchente da barragem Verdes Mares."))
        opportunityList.append(Opportunity(date: "01/07/2019", title: "Construção do muro da sede", description: "Estamos precisando de voluntários para ajudar na construção do muro de nossa sede."))
        
        institutions.append(Institution(image: "img01", name: "Mãos Amigas", category: "Educação e Cultura", detailedInfo: "A motivação inicial para o presente trabalho ocorreu através de um tema pré-estabelecido, a concepção de soluções computacionais que pudessem auxiliar pessoas em situação de vulnerabilidade. Com esse tema em mente, a etapa seguinte foi pensar em um problema de vulnerabilidade humana que pudesse ser amenizado ou solucionado por meio de tec- nologia.", opportunityList: opportunityList, bankAccountList: bankAccountList))
        institutions.append(Institution(image: "img02", name: "Casa de Apoio", category: "Educação e Cultura", detailedInfo: "Lorem ipsum dolor sit amet", opportunityList: opportunityList, bankAccountList: bankAccountList))
        institutions.append(Institution(image: "img03", name: "Instituto Ajudare", category: "Educação e Cultura", detailedInfo: "Lorem ipsum dolor sit amet", opportunityList: opportunityList, bankAccountList: bankAccountList))
        
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
        
        institutionDetailsViewController.institution = institutions[indexPath.section]
        navigationController?.pushViewController(institutionDetailsViewController, animated: true)
    }

}

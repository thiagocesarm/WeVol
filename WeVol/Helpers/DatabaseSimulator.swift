//
//  DatabaseSimulator.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import Foundation

class DatabaseSimulator {
    
    static var isLoggedIn = false
    
    static var loggedInstitution: Institution?
    
    static var bankAccountToShow: BankAccount?
    
    static var opportunityToShow: Opportunity?
    
    static var simulatedInstitutionLogged = Institution(image: "img01", name: "Grupo Anjos Solidários", category: "Projetos sociais", detailedInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam enim leo, luctus eget mollis sit amet, tempor eget turpis. Phasellus mattis justo quis aliquam mollis. Vestibulum dolor nulla, fringilla vel velit vitae, feugiat semper erat. Nulla vitae risus a ante convallis lobortis et fringilla nunc.", opportunityList: [], bankAccountList: [], jobTypesList: [.eventParticipation, .manualLabor], distance: 0.3, latitude: -5.832428, longitude: -35.202803)
    
    static func getInstitutionData() -> [Institution] {
        
        var institutions: [Institution] = []
        var opportunityList: [Opportunity] = []
        var bankAccountList: [BankAccount] = []
        
        bankAccountList.append(BankAccount(bankName: "Caixa Econômica Federal", agencyNumber: "xxxx-x", accountNumber: "xxxxx-x"))
        bankAccountList.append(BankAccount(bankName: "Banco do Brasil", agencyNumber: "xxxx-x", accountNumber: "xxxxx-x"))
        
        opportunityList.append(Opportunity(date: "21/06/2019", title: "Distribuição de comida", description: "Mutirão para distribuição de sopa e alimentos para os atingidos pela enchente da barragem Verdes Mares."))
        opportunityList.append(Opportunity(date: "05/07/2019", title: "Construção do muro da sede", description: "Estamos precisando de voluntários para ajudar na construção do muro de nossa sede."))
        
        institutions.append(Institution(image: "img01", name: "Casa Mãos Amigas", category: "Projetos sociais", detailedInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam enim leo, luctus eget mollis sit amet, tempor eget turpis. Phasellus mattis justo quis aliquam mollis. Vestibulum dolor nulla, fringilla vel velit vitae, feugiat semper erat. Nulla vitae risus a ante convallis lobortis et fringilla nunc.", opportunityList: opportunityList, bankAccountList: bankAccountList, jobTypesList: [.eventParticipation, .manualLabor], distance: 0.3, latitude: -5.830769, longitude: -35.206741))
        institutions.append(Institution(image: "img02", name: "Grupo de Apoio Jovem", category: "Educação e cultura", detailedInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam enim leo, luctus eget mollis sit amet, tempor eget turpis. Phasellus mattis justo quis aliquam mollis. Vestibulum dolor nulla, fringilla vel velit vitae, feugiat semper erat. Nulla vitae risus a ante convallis lobortis et fringilla nunc.", opportunityList: opportunityList, bankAccountList: bankAccountList, jobTypesList: [.eventParticipation, .peopleCaring], distance: 0.9, latitude: -5.834718, longitude: -35.200948))
        institutions.append(Institution(image: "img03", name: "Instituto Reciclare", category: "Meio ambiente e sustentabilidade", detailedInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam enim leo, luctus eget mollis sit amet, tempor eget turpis. Phasellus mattis justo quis aliquam mollis. Vestibulum dolor nulla, fringilla vel velit vitae, feugiat semper erat. Nulla vitae risus a ante convallis lobortis et fringilla nunc.", opportunityList: opportunityList, bankAccountList: bankAccountList, jobTypesList: [.technicalLabor, .manualLabor], distance: 2.4, latitude: -5.828748, longitude: -35.203005))
        return institutions
    }
    
    static func getAllJobTypes() -> [JobType] {
        return [.peopleCaring, .eventParticipation, .manualLabor, .technicalLabor]
    }
    
}

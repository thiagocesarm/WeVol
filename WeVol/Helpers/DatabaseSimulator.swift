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
    
    static func getInstitutionData() -> [Institution] {
        
        var institutions: [Institution] = []
        var opportunityList: [Opportunity] = []
        var bankAccountList: [BankAccount] = []
        
        bankAccountList.append(BankAccount(bankName: "Caixa Econômica Federal", agencyNumber: "xxxx-x", accountNumber: "xxxxx-x"))
        bankAccountList.append(BankAccount(bankName: "Banco do Brasil", agencyNumber: "xxxx-x", accountNumber: "xxxxx-x"))
        
        opportunityList.append(Opportunity(date: "01/06/2019", title: "Distribuição de comida", description: "Mutirão para distribuição de sopa e alimentos para os atingidos pela enchente da barragem Verdes Mares."))
        opportunityList.append(Opportunity(date: "01/07/2019", title: "Construção do muro da sede", description: "Estamos precisando de voluntários para ajudar na construção do muro de nossa sede."))
        
        institutions.append(Institution(image: "img01", name: "Mãos Amigas", category: "Projetos sociais", detailedInfo: "A motivação inicial para o presente trabalho ocorreu através de um tema pré-estabelecido, a concepção de soluções computacionais que pudessem auxiliar pessoas em situação de vulnerabilidade. Com esse tema em mente, a etapa seguinte foi pensar em um problema de vulnerabilidade humana que pudesse ser amenizado ou solucionado por meio de tec- nologia.", opportunityList: opportunityList, bankAccountList: bankAccountList, jobTypesList: [.eventParticipation, .manualLabor], distance: 0.3, latitude: -5.830769, longitude: -35.206741))
        institutions.append(Institution(image: "img02", name: "Grupo de Apoio Jovem", category: "Educação e cultura", detailedInfo: "Lorem ipsum dolor sit amet", opportunityList: opportunityList, bankAccountList: bankAccountList, jobTypesList: [.eventParticipation, .peopleCaring], distance: 0.9, latitude: -5.834718, longitude: -35.200948))
        institutions.append(Institution(image: "img03", name: "Instituto Reciclare", category: "Meio ambiente e sustentabilidade", detailedInfo: "Lorem ipsum dolor sit amet", opportunityList: opportunityList, bankAccountList: bankAccountList, jobTypesList: [.technicalLabor, .manualLabor], distance: 2.4, latitude: -5.828748, longitude: -35.203005))
        return institutions
    }
    
    static func getAllJobTypes() -> [JobType] {
        return [.peopleCaring, .eventParticipation, .manualLabor, .technicalLabor]
    }
    
}

//
//  JobType.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import Foundation

enum JobType {
    case peopleCaring
    case manualLabor
    case technicalLabor
    case eventParticipation
    
    var string: String {
        switch self {
        case .peopleCaring:
            return "Cuidado de pessoas"
        case .manualLabor:
            return "Trabalhos manuais"
        case .technicalLabor:
            return "Trabalhos técnicos"
        case .eventParticipation:
            return "Participação em eventos"
        }
    }
}

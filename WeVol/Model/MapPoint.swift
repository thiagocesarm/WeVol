//
//  MapPoint.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import Foundation
import MapKit

class MapPoint: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var institution: Institution
    let coordinate: CLLocationCoordinate2D
    
    init(institution: Institution) {
        self.institution = institution
        self.title = institution.name
        self.subtitle = institution.category
        self.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(institution.latitude), longitude: CLLocationDegrees(institution.longitude))
        
        super.init()
    }
    
}

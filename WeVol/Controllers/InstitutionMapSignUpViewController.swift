//
//  InstitutionMapSignUpViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit
import MapKit

class InstitutionMapSignUpViewController: UIViewController {
    
    var institutioName: String!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
        mapView.addGestureRecognizer(longTapGesture)
        
        let regionRadius: CLLocationDistance = 1000
        let initialLocation = CLLocation(latitude: -5.8322572, longitude: -35.2058046)
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @objc func longTap(sender: UIGestureRecognizer){
        print("long tap")
        if sender.state == .began {
            let locationInView = sender.location(in: mapView)
            let locationOnMap = mapView.convert(locationInView, toCoordinateFrom: mapView)
            addAnnotation(location: locationOnMap)
        }
    }
    
    func addAnnotation(location: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = institutioName
        self.mapView.addAnnotation(annotation)
    }

    @IBAction func confirmSignUp() {
        DatabaseSimulator.isLoggedIn = true
        DatabaseSimulator.loggedInstitution = DatabaseSimulator.getInstitutionData().first
        self.navigationController?.popToRootViewController(animated: false)
    }
}

//extension InstitutionMapSignUpViewController {
//
//}

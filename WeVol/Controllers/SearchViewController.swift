//
//  SearchViewController.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import UIKit
import DropDown
import MapKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var institutionNameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var typeDropDownAnchorView: UIView!
    @IBOutlet weak var distanceDropDownAnchorView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var openMapButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    
    let allInstitutions = DatabaseSimulator.getInstitutionData()
    var searchResultInstitutions: [Institution] = []
    let typeDropDown = DropDown()
    let distanceDropDown = DropDown()
    
    let allJobTypes = DatabaseSimulator.getAllJobTypes()
    var typeDataSource = ["Todos os tipos de trabalho"]
    let distanceDataSource = ["Qualquer distância", "0.5 km", "1 km", "3 km", "5 km"]
    
    var jobTypeSelected: JobType?
    var distanceSelected: Float?
    
    var isTableView = true
    
    // Map properties
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        typeDataSource += DatabaseSimulator.getAllJobTypes().map { $0.string }
        
        configureDropDown()
        
        // IMD location
        let initialLocation = CLLocation(latitude: -5.8322572, longitude: -35.2058046)
        centerMapOnLocation(location: initialLocation)
        
        mapView.isHidden = true
        tableView.isHidden = true
        openMapButton.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        mapView.delegate = self
        typeTextField.delegate = self
        distanceTextField.delegate = self
    }
    
    func configureDropDown() {
        // Type drop down
        typeDropDown.anchorView = typeDropDownAnchorView
        typeDropDown.dataSource = typeDataSource
        
        // Distance drop down
        distanceDropDown.anchorView = distanceDropDownAnchorView
        distanceDropDown.dataSource = distanceDataSource
        
        typeDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            if index > 0 {
                self.jobTypeSelected = self.allJobTypes[index - 1]
            } else {
                self.jobTypeSelected = nil
            }
            self.typeTextField.text = item
        }
        distanceDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            if index > 0 {
                let distanceString = String(item.dropLast(3))
                self.distanceSelected = (distanceString as NSString).floatValue
            } else {
                self.distanceSelected = nil
            }
            self.distanceTextField.text = item
        }
    }
    
    
    @IBAction func searchInstitutions(_ sender: Any) {
        searchResultInstitutions = allInstitutions
        mapView.removeAnnotations(mapView.annotations)
        
        if let nameToSearch = institutionNameTextField.text?.lowercased(),
            !nameToSearch.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            searchResultInstitutions = searchResultInstitutions.filter {
                return $0.name.lowercased().contains(nameToSearch)
            }
        }
        
        if let jobSelected = jobTypeSelected {
            searchResultInstitutions = searchResultInstitutions.filter {
                return $0.jobTypesList.contains(jobSelected)
            }
        }
        
        if let distance = distanceSelected {
            searchResultInstitutions = searchResultInstitutions.filter {
                return $0.distance <= distance
            }
        }
        
        if searchResultInstitutions.count == 0 {
            tableView.isHidden = true
            mapView.isHidden = true
            openMapButton.isHidden = true
            let alert = UIAlertController(title: "Ops...", message: "Nenhuma instituição encontrada!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        } else {
            // Update tableView
            tableView.reloadData()
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.scrollToRow(at: indexPath, at: .top, animated: false)
            
            // Update map markers
            for institution in searchResultInstitutions {
                mapView.addAnnotation(MapPoint(institution: institution))
            }
            tableView.isHidden = !isTableView
            mapView.isHidden = isTableView
            openMapButton.isHidden = false
        }
    }
    
    @IBAction func toggleMapView() {
        isTableView = !isTableView
        if isTableView {
            openMapButton.setTitle("Mostrar mapa", for: .normal)
        } else {
            openMapButton.setTitle("Mostrar lista", for: .normal)
        }
        tableView.isHidden = !isTableView
        mapView.isHidden = isTableView
    }
    
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == typeTextField {
            typeDropDown.show()
        } else if textField == distanceTextField {
            distanceDropDown.show()
        }
        return false
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultInstitutions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let institutionCell = Bundle.main.loadNibNamed("InstitutionTableViewCell", owner: self, options: nil)?.first as! InstitutionTableViewCell
        institutionCell.institution = searchResultInstitutions[indexPath.row]
        return institutionCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let institutionDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "InstitutionDetails") as! InstitutionDetailsViewController
        
        institutionDetailsViewController.institution = searchResultInstitutions[indexPath.row]
        navigationController?.pushViewController(institutionDetailsViewController, animated: true)
    }
    
}

extension SearchViewController: MKMapViewDelegate {
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? MapPoint else { return nil }
        // 3
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! MapPoint
        let institution = location.institution
        
        let institutionDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "InstitutionDetails") as! InstitutionDetailsViewController
        
        institutionDetailsViewController.institution = institution
        navigationController?.pushViewController(institutionDetailsViewController, animated: true)
    }
}

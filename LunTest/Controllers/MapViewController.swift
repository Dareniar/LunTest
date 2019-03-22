//
//  MapViewController.swift
//  LunTest
//
//  Created by Danil Shchegol on 3/22/19.
//  Copyright © 2019 Danil Shchegol. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    var address: Address?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backButton.layer.cornerRadius = 5
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        mapView.register(MarkerView.self,
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        //creating annotation from address object and centering map on it
        if let address = address {
            mapView.addAnnotation(address)
            mapView.showAnnotations([address], animated: false)
        }
    }

    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

//class for custom annotation
class MarkerView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            canShowCallout = true
            if let image = UIImage(named: "marker") {
                self.image = image
            } else {
                image = nil
            }
        }
    }
}

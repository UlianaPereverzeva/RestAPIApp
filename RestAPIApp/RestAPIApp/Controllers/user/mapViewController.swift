//
//  mapViewController.swift
//  RestAPIApp
//
//  Created by ульяна on 29.12.22.
//

import UIKit
import MapKit

class PinForMap: NSObject, MKAnnotation {

    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?

    init(pinTital: String, pinSubtitle: String , location: CLLocationCoordinate2D) {
        self.title = pinTital
        self.subtitle = pinSubtitle
        self.coordinate = location
    }
}

class mapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
//    let annotation: MKAnnotationView?
    var user: User?
  
    let mapView : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setMapConstraints()
        mapView.delegate = self
        
        let latitude = user?.address?.geo?.lat
        let longitude = user?.address?.geo?.lng
                
        let latitudeDegrees = CLLocationDegrees(latitude!)!
        let longitudeDegrees = CLLocationDegrees(longitude!)!
        
        let location = CLLocationCoordinate2D(latitude: latitudeDegrees , longitude: longitudeDegrees)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapView.setRegion(region, animated: true)
        
        let pin = PinForMap(pinTital: user?.company?.name ?? "", pinSubtitle: user?.address?.city ?? "", location: location)
        
        self.mapView.addAnnotation(pin)
    }
    
    private func setMapConstraints() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }
}

//extension mapViewController : MKMapViewDelegate {
//     //Do something
//}

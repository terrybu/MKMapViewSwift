//
//  ViewController.swift
//  MapViewTesting
//
//  Created by Terry Bu on 1/4/16.
//  Copyright © 2016 Terry Bu. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    
    @IBOutlet var mapKitView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        mapKitView.delegate = self

        
        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        centerMapOnLocation(initialLocation)
        
        // show artwork on map
        let artwork = Artwork(locationName: "Waikiki Gateway Park",
            discipline: "Sculpture",
            coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661), title: "Some place", subtitle: "subtitle here")
        mapKitView.addAnnotation(artwork)
        
    }
    
    let regionRadius: CLLocationDistance = 1000 //1000 meters, 1KM
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapKitView.setRegion(coordinateRegion, animated: true)
        //setRegion tells mapView to display the region. The map view automatically transitions the current view to the desired region with a neat zoom animation, with no extra code required!
    }


}


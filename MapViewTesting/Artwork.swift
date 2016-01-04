//
//  Artwork.swift
//  MapViewTesting
//
//  Created by Terry Bu on 1/4/16.
//  Copyright © 2016 Terry Bu. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class Artwork: NSObject, MKAnnotation {
    let locationName: String
    let discipline: String
    var title: String?
    var subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(locationName: String, discipline: String, coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        super.init()
    }
    
    // annotation callout info button opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDictionary = [String(CNPostalAddressStreetKey): self.subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
        
    }
    
}

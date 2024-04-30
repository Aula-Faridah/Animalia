//
//  LocationModel.swift
//  Animalia
//
//  Created by MacBook Pro on 30/04/24.
//

import Foundation
import MapKit

struct LocationModel: Codable, Identifiable {
    var id, name, image: String
    var latitude, longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

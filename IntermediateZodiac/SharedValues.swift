//
//  SharedValues.swift
//  IntermediateZodiac
//
//  Created by William Tong on 7/7/2020.
//  Copyright © 2020 William Tong. All rights reserved.
//

import Foundation
import Combine

class SharedValues:ObservableObject{
    @Published var julianCentury:Double!
    @Published var julianCenturyC:Double!
    @Published var sunLongitude:Double!
    @Published var sunLongitudeC:Double!
    @Published var moonLongitude:Double!
    @Published var moonLongitudeC:Double!
    @Published var newDate:Date!
    @Published var newDateC:Date!
    @Published var nineGeoCoordinates:[GeoLatLon]!
    @Published var nineGeoCoordinatesC:[GeoLatLon]!
    @Published var planetsPos:[Coordinate]!
    @Published var planetsPosC:[Coordinate]!
}

//
//  ChartViewModel.swift
//  IntermediateZodiac
//
//  Created by William Tong on 31/3/2021.
//  Copyright © 2021 William Tong. All rights reserved.
//

import SwiftUI

class ChartViewModel:ObservableObject{
    
    @Published var baseWheel:HelioPositions!
    @Published var julianCentury:Double!
    @Published var julianCenturyC:Double!
   
    @Published var nineGeoCoordinatesC:[PlanetGeoCoord]!
    @Published var nineGeoLatLon:[GeoLatLon]!
    @Published var nineGeoLatLonC:[GeoLatLon]!
//    @Published var positions:[GeoLatLon]!
    @Published var innerWheel:WheelData!
    @Published var outterWheel:WheelData!
    @Published var zodiacRing:[Coordinate] = ChartViewModel.DrawZodiacRing(radius: zodiac)
    
    static var zodiac:CGFloat{
        
       return UIScreen.main.bounds.width * 0.35
    }
    
    
    static func createWheel(date:Date) -> HelioPositions{
        
        let julianCentury = Declination.julianCentury(Declination.date(toJulian: date))
        
        var recentDate = false
        
        if(julianCentury > 0.49 || julianCentury < -2.0 ){
            
            recentDate = false
            
        }else if(julianCentury <= 0.49 && julianCentury >= -2.0){
            
            recentDate = true
        }
        
        let data = HelioPositions(julianCentury: julianCentury, recentDate: recentDate)
        
        
        
        return data
    }
    
    
    func calcJulianCent(date:Date) -> Double{
        julianCentury = Declination.julianCentury(Declination.date(toJulian: date))
       //j2000

        
        return julianCentury
    }
    
    func DrawWheel(meanLong:[GeoLatLon],julianCentury:Double, ringRadius:CGFloat) -> [Coordinate] {
        
        let sunLongitude = Declination.sunLongtitude(julianCentury)
        let moonLongitude = Moon.moonLongitude(julianCentury)
        var planetCoors = [Coordinate]()
        let sunX = -ringRadius * CGFloat(cos(sunLongitude * .pi/180))
        let sunY = ringRadius * CGFloat(sin(sunLongitude * .pi/180))
        
        planetCoors.append(Coordinate(x: sunX, y: sunY))
        
        
        let moonX = -ringRadius * CGFloat(cos(moonLongitude * .pi/180))
        let moonY = ringRadius * CGFloat(sin(moonLongitude * .pi/180))
        planetCoors.append(Coordinate(x: moonX, y: moonY))
        
        let mercuryX = -ringRadius * CGFloat(cos(meanLong[0].longitude * .pi/180))
        let mercuryY = ringRadius * CGFloat(sin(meanLong[0].longitude * .pi/180))
        planetCoors.append(Coordinate(x: mercuryX, y: mercuryY))
        
        let venusX = -ringRadius * CGFloat(cos(meanLong[1].longitude * .pi/180))
        let venusY = ringRadius * CGFloat(sin(meanLong[1].longitude * .pi/180))
        planetCoors.append(Coordinate(x: venusX, y: venusY))
        
        
        let marsX = -ringRadius * CGFloat(cos(meanLong[2].longitude * .pi/180))
        let marsY = ringRadius * CGFloat(sin(meanLong[2].longitude * .pi/180))
        planetCoors.append(Coordinate(x: marsX, y: marsY))
        
        
        let jupiterX = -ringRadius * CGFloat(cos(meanLong[3].longitude * .pi/180))
        let jupiterY = ringRadius * CGFloat(sin(meanLong[3].longitude * .pi/180))
        planetCoors.append(Coordinate(x: jupiterX, y: jupiterY))
        
        
        let saturnX = -ringRadius * CGFloat(cos(meanLong[4].longitude * .pi/180))
        let saturnY = ringRadius * CGFloat(sin(meanLong[4].longitude * .pi/180))
        planetCoors.append(Coordinate(x: saturnX, y: saturnY))
        
        
        let uranusX = -ringRadius * CGFloat(cos(meanLong[5].longitude * .pi/180))
        let uranusY = ringRadius * CGFloat(sin(meanLong[5].longitude * .pi/180))
        planetCoors.append(Coordinate(x: uranusX, y: uranusY))
        
        let neptuneX = -ringRadius * CGFloat(cos(meanLong[6].longitude * .pi/180))
        let neptuneY = ringRadius * CGFloat(sin(meanLong[6].longitude * .pi/180))
        planetCoors.append(Coordinate(x: neptuneX, y: neptuneY))
        
        let plutoX = -ringRadius * CGFloat(cos(meanLong[7].longitude * .pi/180))
        let plutoY = ringRadius * CGFloat(sin(meanLong[7].longitude * .pi/180))
        planetCoors.append(Coordinate(x: plutoX, y: plutoY))
        
        return planetCoors
    
    }
    
    static func DrawZodiacRing(radius:CGFloat) -> [Coordinate]{
        
        var zodiacPoints = [Coordinate]()
        let ariesX = -radius * CGFloat(cos(15 * Double.pi/180))
        let ariesY = radius * CGFloat(sin(15 * Double.pi/180))
        
        zodiacPoints.append(Coordinate(x: ariesX, y: ariesY))
        
        let taurusX = -radius * CGFloat(cos(45 * Double.pi/180))
        let taurusY = radius * CGFloat(sin(45 * Double.pi/180))
        
        zodiacPoints.append(Coordinate(x: taurusX, y: taurusY))
        
        
        let geminiX = -radius * CGFloat(cos(75 * Double.pi/180))
        let geminiY = radius * CGFloat(sin(75 * Double.pi/180))
        zodiacPoints.append(Coordinate(x: geminiX, y: geminiY))
        
        let cancerX = -radius * CGFloat(cos(105 * Double.pi/180))
        let cancerY =  radius * CGFloat(sin(105 * Double.pi/180))
        
        zodiacPoints.append(Coordinate(x: cancerX, y: cancerY))
        
        let leoX = -radius * CGFloat(cos(135 * Double.pi/180))
        let leoY =  radius * CGFloat(sin(135 * Double.pi/180))
        zodiacPoints.append(Coordinate(x: leoX, y: leoY))
        
        
        let virgoX = -radius * CGFloat(cos(165 * Double.pi/180))
        let virgoY =   radius * CGFloat(sin(165 * Double.pi/180))
        zodiacPoints.append(Coordinate(x: virgoX, y: virgoY))
        
        
        let libraX = -radius * CGFloat(cos(195 * Double.pi/180))
        let libraY =  radius * CGFloat(sin(195 * Double.pi/180))
        zodiacPoints.append(Coordinate(x: libraX, y: libraY))
        
        
        let scorpioX = -radius * CGFloat(cos(225 * Double.pi/180))
        let scorpioY =  radius * CGFloat(sin(225 * Double.pi/180))
        zodiacPoints.append(Coordinate(x: scorpioX, y: scorpioY))
        
        
        let sagittariusX = -radius * CGFloat(cos(255 * Double.pi/180))
        let sagittariusY =  radius * CGFloat(sin(255 * Double.pi/180))
        zodiacPoints.append(Coordinate(x: sagittariusX, y: sagittariusY))
        
        
        let capriconX = -radius * CGFloat(cos(285 * Double.pi/180))
        let capriconY =  radius * CGFloat(sin(285 * Double.pi/180))
        zodiacPoints.append(Coordinate(x: capriconX, y: capriconY))
        
        
        let aquariusX = -radius * CGFloat(cos(315 * Double.pi/180))
        let aquariusY =  radius * CGFloat(sin(315 * Double.pi/180))
        zodiacPoints.append(Coordinate(x: aquariusX, y: aquariusY))
        
        
        let piscesX = -radius * CGFloat(cos(345 * Double.pi/180))
        let piscesY = radius * CGFloat(sin(345 * Double.pi/180))
        zodiacPoints.append(Coordinate(x: piscesX, y: piscesY))
        
        return zodiacPoints
        
    }
}

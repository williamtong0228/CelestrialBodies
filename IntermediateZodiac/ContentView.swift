//
//  ContentView.swift
//  IntermediateZodiac
//
//  Created by William Tong on 6/7/2020.
//  Copyright © 2020 William Tong. All rights reserved.
//

import SwiftUI
struct Coordinate {
    var x:CGFloat
    var y:CGFloat
}

struct ContentView: View {
    @EnvironmentObject var sharing:SharedValues
    @EnvironmentObject var positions:ChartViewModel

    @State var isDoubleWheel = false
    @State var outterSunX:CGFloat = 0
    @State var outterSunY:CGFloat = 0
    @State var outterMoonX:CGFloat = 0
    @State var outterMoonY:CGFloat = 0
    @State var outterMercuryX:CGFloat = 0
    @State var outterMercuryY:CGFloat = 0
    @State var outterVenusX:CGFloat = 0
    @State var outterVenusY:CGFloat = 0
    @State var outterMarsX:CGFloat = 0
    @State var outterMarsY:CGFloat = 0
    @State var outterJupiterX:CGFloat = 0
    @State var outterJupiterY:CGFloat = 0
    @State var outterSaturnX:CGFloat = 0
    @State var outterSaturnY:CGFloat = 0
    @State var outterUranusX:CGFloat = 0
    @State var outterUranusY:CGFloat = 0
    @State var outterNeptuneX:CGFloat = 0
    @State var outterNeptuneY:CGFloat = 0
    @State var outterPlutoX:CGFloat = 0
    @State var outterPlutoY:CGFloat = 0
    
    @State var innerSunX:CGFloat = 0
    @State var innerSunY:CGFloat = 0
    @State var innerMoonX:CGFloat = 0
    @State var innerMoonY:CGFloat = 0
    @State var innerMercuryX:CGFloat = 0
    @State var innerMercuryY:CGFloat = 0
    @State var innerVenusX:CGFloat = 0
    @State var innerVenusY:CGFloat = 0
    @State var innerMarsX:CGFloat = 0
    @State var innerMarsY:CGFloat = 0
    @State var innerJupiterX:CGFloat = 0
    @State var innerJupiterY:CGFloat = 0
    @State var innerSaturnX:CGFloat = 0
    @State var innerSaturnY:CGFloat = 0
    @State var innerUranusX:CGFloat = 0
    @State var innerUranusY:CGFloat = 0
    @State var innerNeptuneX:CGFloat = 0
    @State var innerNeptuneY:CGFloat = 0
    @State var innerPlutoX:CGFloat = 0
    @State var innerPlutoY:CGFloat = 0
    
    @State var sunX:CGFloat = 0
    @State var sunY:CGFloat = 0
    @State var moonX:CGFloat = 0
    @State var moonY:CGFloat = 0
    @State var mercuryX:CGFloat = 0
    @State var mercuryY:CGFloat = 0
    @State var venusX:CGFloat = 0
    @State var venusY:CGFloat = 0
    @State var marsX:CGFloat = 0
    @State var marsY:CGFloat = 0
    @State var jupiterX:CGFloat = 0
    @State var jupiterY:CGFloat = 0
    @State var saturnX:CGFloat = 0
    @State var saturnY:CGFloat = 0
    @State var uranusX:CGFloat = 0
    @State var uranusY:CGFloat = 0
    @State var neptuneX:CGFloat = 0
    @State var neptuneY:CGFloat = 0
    @State var plutoX:CGFloat = 0
    @State var plutoY:CGFloat = 0
    
    
    @State var sunCX:CGFloat = 0
    @State var sunCY:CGFloat = 0
    @State var moonCX:CGFloat = 0
    @State var moonCY:CGFloat = 0
    @State var mercuryCX:CGFloat = 0
    @State var mercuryCY:CGFloat = 0
    @State var venusCX:CGFloat = 0
    @State var venusCY:CGFloat = 0
    @State var marsCX:CGFloat = 0
    @State var marsCY:CGFloat = 0
    @State var jupiterCX:CGFloat = 0
    @State var jupiterCY:CGFloat = 0
    @State var saturnCX:CGFloat = 0
    @State var saturnCY:CGFloat = 0
    @State var uranusCX:CGFloat = 0
    @State var uranusCY:CGFloat = 0
    @State var neptuneCX:CGFloat = 0
    @State var neptuneCY:CGFloat = 0
    @State var plutoCX:CGFloat = 0
    @State var plutoCY:CGFloat = 0
    
    
    @State var ariesX:CGFloat = 0
    @State var ariesY:CGFloat = 0
    @State var taurusX:CGFloat = 0
    @State var taurusY:CGFloat = 0
    @State var geminiX:CGFloat = 0
    @State var geminiY:CGFloat = 0
    @State var cancerX:CGFloat = 0
    @State var cancerY:CGFloat = 0
    @State var leoX:CGFloat = 0
    @State var leoY:CGFloat = 0
    @State var virgoX:CGFloat = 0
    @State var virgoY:CGFloat = 0
    @State var libraX:CGFloat = 0
    @State var libraY:CGFloat = 0
    @State var scorpioX:CGFloat = 0
    @State var scorpioY:CGFloat = 0
    @State var sagittariusX:CGFloat = 0
    @State var sagittariusY:CGFloat = 0
    @State var capriconX:CGFloat = 0
    @State var capriconY:CGFloat = 0
    @State var aquariusX:CGFloat = 0
    @State var aquariusY:CGFloat = 0
    @State var piscesX:CGFloat = 0
    @State var piscesY:CGFloat = 0
    
    var planetsPos:[Coordinate]{
    
        return sharing.planetsPos
    }
    var zodiac:CGFloat{
        
       return UIScreen.main.bounds.width * 0.35
    }
    
    var innerRing:CGFloat{
        
       return UIScreen.main.bounds.width * 0.3
    }
        
    var outterRing:CGFloat{
        
       return UIScreen.main.bounds.width * 0.45
    }
    var currentPosition:[GeoLatLon]{

        return sharing.nineGeoCoordinates
//        return positions.nineGeoCoordinates
    }
    
    @State var currentLongitude:[PlanetGeoCoord] = []
    @State var meanLong:[GeoLatLon] = []

    var body: some View {
        ZStack{
            VStack{
                Text("\(DateFormatter.localizedString(from: sharing.newDate, dateStyle: .medium, timeStyle: .medium))")
                Spacer()
            }
            HStack{
                
                Spacer()
                VStack{
                    if (sharing.nineGeoCoordinates.count > 0) {
                        Spacer()
                        
//                        Spacer()
//                        Text("Geocentric Coordinates:\nMercury: \(currentLongitude[0].geoX,specifier: "%.5f") , \(currentLongitude[0].geoY,specifier: "%.5f"), \(currentLongitude[0].geoZ,specifier: "%.5f")\nVenus:  \(currentLongitude[1].geoX,specifier: "%.5f") ,\(currentLongitude[1].geoY,specifier: "%.5f") ,\(currentLongitude[1].geoZ,specifier: "%.5f")\nMars: \(currentLongitude[2].geoX,specifier: "%.5f") ,\(currentLongitude[2].geoY,specifier: "%.5f") ,\(currentLongitude[2].geoZ,specifier: "%.5f")\nJupiter: \(currentLongitude[3].geoX,specifier: "%.5f") ,\(currentLongitude[3].geoY,specifier: "%.5f") ,\(currentLongitude[3].geoZ,specifier: "%.5f")\nSaturn: \(currentLongitude[4].geoX,specifier: "%.5f") ,\(currentLongitude[4].geoY,specifier: "%.5f") ,\(currentLongitude[4].geoZ,specifier: "%.5f")\nUranus: \(currentLongitude[5].geoX,specifier: "%.5f") ,\(currentLongitude[5].geoY,specifier: "%.5f") ,\(currentLongitude[5].geoZ,specifier: "%.5f")\nNeptune: \(currentLongitude[6].geoX,specifier: "%.5f") ,\(currentLongitude[6].geoY,specifier: "%.5f") ,\(currentLongitude[6].geoZ,specifier: "%.5f")\nPluto: \(currentLongitude[7].geoX,specifier: "%.5f") ,\(currentLongitude[7].geoY,specifier: "%.5f") ,\(currentLongitude[7].geoZ,specifier: "%.5f")\n")
    //                    Spacer()
                        Text("Geocentric Longitude:\nSun: \(sharing.sunLongitude ?? 0) \nMoon \(sharing.moonLongitude ?? 0) \nMercury: \(sharing.nineGeoCoordinates[0].longitude) \nVenus: \(sharing.nineGeoCoordinates[1].longitude) \nMars: \(sharing.nineGeoCoordinates[2].longitude) \nJupiter: \(sharing.nineGeoCoordinates[3].longitude) \nSaturn: \(sharing.nineGeoCoordinates[4].longitude) \nUranus: \(sharing.nineGeoCoordinates[5].longitude) \nNeptune: \(sharing.nineGeoCoordinates[6].longitude) \nPluto: \(sharing.nineGeoCoordinates[7].longitude)")
                            .font(.system(size: 10))
                        
                    }
            }

            }.onAppear(){
//                currentLongitude = currentPosition
//                meanLong = positions.baseWheel.wheelPos[0].nineGeoLatLon
                sharing.sunLongitude = Declination.sunLongtitude(sharing.julianCentury)
                sharing.moonLongitude = Moon.moonLongitude(sharing.julianCentury)
                print("check double wheel \(isDoubleWheel)")
//                sunX = -outterRing * CGFloat(cos(sharing.sunLongitude * .pi/180))
//                sunY = outterRing * CGFloat(sin(sharing.sunLongitude * .pi/180))
//                outterSunX = -(zodiac + 20) * CGFloat(cos(sharing.sunLongitude * .pi/180))
//                outterSunY = (zodiac + 20) * CGFloat(sin(sharing.sunLongitude * .pi/180))
//
//                moonX = -outterRing * CGFloat(cos(sharing.moonLongitude * .pi/180))
//                moonY = outterRing * CGFloat(sin(sharing.moonLongitude * .pi/180))
//                outterMoonX =  -(zodiac + 20) * CGFloat(cos(sharing.moonLongitude * .pi/180))
//                outterMoonY = (zodiac + 20) * CGFloat(sin(sharing.moonLongitude * .pi/180))
//
//                mercuryX = -outterRing * CGFloat(cos(meanLong[0].longitude * .pi/180))
//                mercuryY = outterRing * CGFloat(sin(meanLong[0].longitude * .pi/180))
//                outterMercuryX =  -(zodiac + 20) * CGFloat(cos(meanLong[0].longitude * .pi/180))
//                outterMercuryY = (zodiac + 20) * CGFloat(sin(meanLong[0].longitude * .pi/180))
//
//                venusX = -outterRing * CGFloat(cos(meanLong[1].longitude * .pi/180))
//                venusY = outterRing * CGFloat(sin(meanLong[1].longitude * .pi/180))
//                outterVenusX =  -(zodiac + 20) * CGFloat(cos(meanLong[1].longitude * .pi/180))
//                outterVenusY = (zodiac + 20) * CGFloat(sin(meanLong[1].longitude * .pi/180))
//
//
//                marsX = -outterRing * CGFloat(cos(meanLong[2].longitude * .pi/180))
//                marsY = outterRing * CGFloat(sin(meanLong[2].longitude * .pi/180))
//                outterMarsX =  -(zodiac + 20) * CGFloat(cos(meanLong[2].longitude * .pi/180))
//                outterMarsY = (zodiac + 20) * CGFloat(sin(meanLong[2].longitude * .pi/180))
//
//
//                jupiterX = -outterRing * CGFloat(cos(meanLong[3].longitude * .pi/180))
//                jupiterY = outterRing * CGFloat(sin(meanLong[3].longitude * .pi/180))
//                outterJupiterX =  -(zodiac + 20) * CGFloat(cos(meanLong[3].longitude * .pi/180))
//                outterJupiterY = (zodiac + 20) * CGFloat(sin(meanLong[3].longitude * .pi/180))
//
//
//                saturnX = -outterRing * CGFloat(cos(meanLong[4].longitude * .pi/180))
//                saturnY = outterRing * CGFloat(sin(meanLong[4].longitude * .pi/180))
//                outterSaturnX =  -(zodiac + 20) * CGFloat(cos(meanLong[4].longitude * .pi/180))
//                outterSaturnY = (zodiac + 20) * CGFloat(sin(meanLong[4].longitude * .pi/180))
//
//
//                uranusX = -outterRing * CGFloat(cos(meanLong[5].longitude * .pi/180))
//                uranusY = outterRing * CGFloat(sin(meanLong[5].longitude * .pi/180))
//                outterUranusX =  -(zodiac + 20) * CGFloat(cos(meanLong[5].longitude * .pi/180))
//                outterUranusY = (zodiac + 20) * CGFloat(sin(meanLong[5].longitude * .pi/180))
//
//
//                neptuneX = -outterRing * CGFloat(cos(meanLong[6].longitude * .pi/180))
//                neptuneY = outterRing * CGFloat(sin(meanLong[6].longitude * .pi/180))
//                outterNeptuneX =  -(zodiac + 20) * CGFloat(cos(meanLong[6].longitude * .pi/180))
//                outterNeptuneY = (zodiac + 20) * CGFloat(sin(meanLong[6].longitude * .pi/180))
//
//
//                plutoX = -outterRing * CGFloat(cos(meanLong[7].longitude * .pi/180))
//                plutoY = outterRing * CGFloat(sin(meanLong[7].longitude * .pi/180))
//                outterPlutoX =  -(zodiac + 20) * CGFloat(cos(meanLong[7].longitude * .pi/180))
//                outterPlutoY = (zodiac + 20) * CGFloat(sin(meanLong[7].longitude * .pi/180))
//
//

//                print("Geocentric Longitude:\nSun: \(String(describing: sharing.sunLongitude)) \nMercury: \(meanLong[0].longitude) \nVenus: \(meanLong[1].longitude) \nMars: \(meanLong[2].longitude) \nJupiter: \(meanLong[3].longitude) \nSaturn: \(meanLong[4].longitude) \nUranus: \(meanLong[5].longitude) \nNeptune: \(meanLong[6].longitude) \nPluto: \(meanLong[7].longitude)")
            }
            ZStack{
                if(isDoubleWheel){
                    ZStack{
                        Text("☉")
                            .foregroundColor(Color.red)
                            .font(.system(size: 30))
                            .offset(x: sunCX * 1.02, y: sunCY * 1.02)
                            .frame(width: 50, height: 50, alignment: .center)
                            
                            .overlay(Path{ path in
                                
                                path.move(to:CGPoint(x: sunCX * 0.95 + 25, y: sunCY * 0.95 + 25))
                                path.addLine(to:CGPoint(x:innerSunX + 25,y: innerSunY + 25))
                               
                            }
                            .stroke(Color.red,lineWidth: 1))
                            
                        Text("☾")
                            .foregroundColor(Color.blue)
                            .font(.system(size: 30))
                            .offset(x: moonCX * 1.02, y: moonCY * 1.02)
                            .frame(width: 50, height: 50, alignment: .center)
                            
                            .overlay(Path{ path in
                                
                                path.move(to:CGPoint(x: moonCX * 0.95 + 25, y: moonCY * 0.95 + 25))
                                path.addLine(to:CGPoint(x:innerMoonX + 25,y: innerMoonY + 25))
                               
                            }
                            .stroke(Color.blue,lineWidth: 1))
                        
                        
                        Text("☿")
                            .foregroundColor(Color.green)
                            .font(.system(size: 35))
                            .offset(x: mercuryCX * 1.02, y: mercuryCY * 1.02)
                            .frame(width: 50, height: 50, alignment: .center)
                            .overlay(Path{ path in
                                
                                path.move(to:CGPoint(x: mercuryCX * 0.95 + 25, y: mercuryCY * 0.95 + 25))
                                path.addLine(to:CGPoint(x:innerMercuryX + 25,y: innerMercuryY + 25))
                               
                            }
                            .stroke(Color.green,lineWidth: 1))
                            
                        
                        Text("♀︎")
                            .foregroundColor(Color.yellow)
                            .font(.system(size: 35))
                            .offset(x: venusCX * 1.02, y: venusCY * 1.02)
                            .frame(width: 50, height: 50, alignment: .center)
                            .overlay(Path{ path in
                                
                                path.move(to:CGPoint(x: venusCX * 0.95 + 25, y: venusCY * 0.95 + 25))
                                path.addLine(to:CGPoint(x:innerVenusX + 25,y: innerVenusY + 25))
                               
                            }
                            .stroke(Color.yellow,lineWidth: 1))
                        Text("♂︎")
                            .foregroundColor(Color.red)
                            .font(.system(size: 35))
                            .offset(x: marsCX * 1.02, y: marsCY * 1.02)
                            .frame(width: 50, height: 50, alignment: .center)
                            .overlay(Path{ path in
                                
                                path.move(to:CGPoint(x: marsCX * 0.95 + 25, y: marsCY * 0.95 + 25))
                                path.addLine(to:CGPoint(x:innerMarsX + 25,y: innerMarsY + 25))
                               
                            }
                            .stroke(Color.red,lineWidth: 1))
                    }
                }
                
                Text("☉")
                    .foregroundColor(Color.red)
                    .font(.system(size: 30))
                    .offset(x: planetsPos[0].x * 1.02, y: planetsPos[0].y * 1.02)
                    .frame(width: 50, height: 50, alignment: .center)
                    
                    .overlay(Path{ path in
                        
                        path.move(to:CGPoint(x: planetsPos[0].x * 0.95 + 25, y: planetsPos[0].y * 0.95 + 25))
                        path.addLine(to:CGPoint(x:outterSunX + 25,y: outterSunY + 25))
                       
                    }
                    .stroke(Color.red,lineWidth: 1))
                    
                Text("☾")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 30))
                    .offset(x: planetsPos[1].x * 1.02, y: planetsPos[1].y * 1.02)
                    .frame(width: 50, height: 50, alignment: .center)
                    
                    .overlay(Path{ path in
                        
                        path.move(to:CGPoint(x: planetsPos[1].x * 0.95 + 25, y: planetsPos[1].y * 0.95 + 25))
                        path.addLine(to:CGPoint(x:outterMoonX + 25,y: outterMoonY + 25))
                       
                    }
                    .stroke(Color.blue,lineWidth: 1))
                
                
                Text("☿")
                    .foregroundColor(Color.green)
                    .font(.system(size: 35))
                    .offset(x: planetsPos[2].x * 1.02, y: planetsPos[2].y * 1.02)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Path{ path in
                        
                        path.move(to:CGPoint(x: planetsPos[2].x * 0.95 + 25, y: planetsPos[2].y * 0.95 + 25))
                        path.addLine(to:CGPoint(x:outterMercuryX + 25,y: outterMercuryY + 25))
                       
                    }
                    .stroke(Color.green,lineWidth: 1))
                    
                
                Text("♀︎")
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 35))
                    .offset(x: planetsPos[3].x * 1.02, y: planetsPos[3].y * 1.02)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Path{ path in
                        
                        path.move(to:CGPoint(x: planetsPos[3].x * 0.95 + 25, y: planetsPos[3].y * 0.95 + 25))
                        path.addLine(to:CGPoint(x:outterVenusX + 25,y: outterVenusY + 25))
                       
                    }
                    .stroke(Color.yellow,lineWidth: 1))
                Text("♂︎")
                    .foregroundColor(Color.red)
                    .font(.system(size: 35))
                    .offset(x: planetsPos[4].x * 1.02, y: planetsPos[4].y * 1.02)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Path{ path in
                        
                        path.move(to:CGPoint(x: planetsPos[4].x * 0.95 + 25, y: planetsPos[4].y * 0.95 + 25))
                        path.addLine(to:CGPoint(x:outterMarsX + 25,y: outterMarsY + 25))
                       
                    }
                    .stroke(Color.red,lineWidth: 1))
                    
                Text("")
                    
                    .frame(width: 50, height: 50, alignment: .leading)
                    
                    .overlay(Capsule()
                                .size(width:40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25))
                    .overlay(Capsule()
                                .size(width: 40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25)
                                .rotation(Angle(degrees:30)))
                    .overlay(Capsule()
                                .size(width: 40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25)
                                .rotation(Angle(degrees:60)))
                    .overlay(Capsule()
                                .size(width: 40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25)
                                .rotation(Angle(degrees:90)))
                    .overlay(Capsule()
                                .size(width: 40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25)
                                .rotation(Angle(degrees:120)))
                    .overlay(Capsule()
                                .size(width: 40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25)
                                .rotation(Angle(degrees:150)))
                    .overlay(Capsule()
                                .size(width: 40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25)
                                .rotation(Angle(degrees:180)))
                    .overlay(Capsule()
                                .size(width: 40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25)
                                .rotation(Angle(degrees:210)))
                    .overlay(Capsule()
                                .size(width: 40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25)
                                .rotation(Angle(degrees:240)))
                    .overlay(Capsule()
                                .size(width: 40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25)
                                .rotation(Angle(degrees:270)))
                    .overlay(Capsule()
                                .size(width: 40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25)
                                .rotation(Angle(degrees:300)))
                    .overlay(Capsule()
                                .size(width: 40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25)
                                .rotation(Angle(degrees:330)))
                    .overlay(Capsule()
                                .size(width: 40, height: 2)
                                .offset(x: -UIScreen.main.bounds.width/2 + 60, y: 25)
                                .rotation(Angle(degrees:360)))
                    .overlay(Circle()
                                .stroke(Color.primary,lineWidth: 2)
                                .frame(width: (zodiac - 20) * 2, height: (zodiac - 20) * 2)
                                .foregroundColor(Color.clear)
                                )
                    .overlay(Circle()
                                .stroke(Color.primary,lineWidth: 2)
                                .frame(width: (zodiac + 20) * 2, height: (zodiac + 20) * 2)
                                .foregroundColor(Color.clear)
                                )
                
                
                   
                    
                                
            }
            if(isDoubleWheel){
                ZStack{
                    Text("♃")
                        .foregroundColor(Color.red)
                        .font(.system(size: 35))
                        .offset(x: jupiterCX * 1.02, y: jupiterCY * 1.02)
                        .frame(width: 50, height: 50, alignment: .center)
                        .overlay(Path{ path in
                            
                            path.move(to:CGPoint(x: jupiterCX * 0.95 + 25, y: jupiterCY * 0.95 + 25))
                            path.addLine(to:CGPoint(x:innerJupiterX + 25,y: innerJupiterY + 25))
                           
                        }
                        .stroke(Color.red,lineWidth: 1))
                    Text("♄")
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 35))
                        .offset(x: saturnCX * 1.02, y: saturnCY * 1.02)
                        .frame(width: 50, height: 50, alignment: .center)
                        .overlay(Path{ path in
                            
                            path.move(to:CGPoint(x: saturnCX * 0.95 + 25, y: saturnCY * 0.95 + 25))
                            path.addLine(to:CGPoint(x:innerSaturnX + 25,y: innerSaturnY + 25))
                           
                        }
                        .stroke(Color.yellow,lineWidth: 1))
                    
                    Text("♅")
                        .foregroundColor(Color.green)
                        .font(.system(size: 35))
                        .offset(x: uranusCX * 1.02, y: uranusCY * 1.02)
                        .frame(width: 50, height: 50, alignment: .center)
                        .overlay(Path{ path in
                            
                            path.move(to:CGPoint(x: uranusCX * 0.95 + 25, y: uranusCY * 0.95 + 25))
                            path.addLine(to:CGPoint(x:innerUranusX + 25,y: innerUranusY + 25))
                           
                        }
                        .stroke(Color.green,lineWidth: 1))
                    
                    
                    Text("♆")
                        .foregroundColor(Color.blue)
                        .font(.system(size: 35))
                        .offset(x: neptuneCX * 1.02, y: neptuneCY * 1.02)
                        .frame(width: 50, height: 50, alignment: .center)
                        .overlay(Path{ path in
                            
                            path.move(to:CGPoint(x: neptuneCX * 0.95  + 25, y: neptuneCY * 0.95 + 25))
                            path.addLine(to:CGPoint(x:innerNeptuneX + 25,y: innerNeptuneY + 25))
                           
                        }
                        .stroke(Color.blue,lineWidth: 1))
                    
                    
                    Text("♇")
                        .foregroundColor(Color.blue)
                        .font(.system(size: 35))
                        .offset(x: plutoCX * 1.02, y: plutoCY * 1.02)
                        .frame(width: 50, height: 50, alignment: .center)
                        .overlay(Path{ path in
                            
                            path.move(to:CGPoint(x: plutoCX * 0.95 + 25, y: plutoCY * 0.95 + 25))
                            path.addLine(to:CGPoint(x:innerPlutoX + 25,y: innerPlutoY + 25))
                           
                        }
                        .stroke(Color.blue,lineWidth: 1))
                }
            }
            ZStack{
                Text("♃")
                    .foregroundColor(Color.red)
                    .font(.system(size: 35))
                    .offset(x: planetsPos[5].x * 1.02, y: planetsPos[5].y * 1.02)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Path{ path in
                        
                        path.move(to:CGPoint(x: planetsPos[5].x * 0.95 + 25, y: planetsPos[5].y * 0.95 + 25))
                        path.addLine(to:CGPoint(x:outterJupiterX + 25,y: outterJupiterY + 25))
                       
                    }
                    .stroke(Color.red,lineWidth: 1))
                Text("♄")
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 35))
                    .offset(x: planetsPos[6].x * 1.02, y: planetsPos[6].y * 1.02)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Path{ path in
                        
                        path.move(to:CGPoint(x: planetsPos[6].x  * 0.95 + 25, y: planetsPos[6].y * 0.95 + 25))
                        path.addLine(to:CGPoint(x:outterSaturnX + 25,y: outterSaturnY + 25))
                       
                    }
                    .stroke(Color.yellow,lineWidth: 1))
                
                Text("♅")
                    .foregroundColor(Color.green)
                    .font(.system(size: 35))
                    .offset(x: planetsPos[7].x * 1.02, y: planetsPos[7].y * 1.02)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Path{ path in
                        
                        path.move(to:CGPoint(x: planetsPos[7].x * 0.95 + 25, y: planetsPos[7].y * 0.95 + 25))
                        path.addLine(to:CGPoint(x:outterUranusX + 25,y: outterUranusY + 25))
                       
                    }
                    .stroke(Color.green,lineWidth: 1))
                
                
                Text("♆")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 35))
                    .offset(x: planetsPos[8].x * 1.02, y: planetsPos[8].y * 1.02)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Path{ path in
                        
                        path.move(to:CGPoint(x: planetsPos[8].x * 0.95  + 25, y: planetsPos[8].y * 0.95 + 25))
                        path.addLine(to:CGPoint(x:outterNeptuneX + 25,y: outterNeptuneY + 25))
                       
                    }
                    .stroke(Color.blue,lineWidth: 1))
                
                
                Text("♇")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 35))
                    .offset(x: planetsPos[9].x * 1.02, y: planetsPos[9].y * 1.02)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Path{ path in
                        
                        path.move(to:CGPoint(x: planetsPos[9].x * 0.95 + 25, y: planetsPos[9].y * 0.95 + 25))
                        path.addLine(to:CGPoint(x:outterPlutoX + 25,y: outterPlutoY + 25))
                       
                    }
                    .stroke(Color.blue,lineWidth: 1))
            }
            ZStack{
                Text("♈︎")
                    .foregroundColor(Color.red)
                    .font(.system(size: 45))
                    .offset(x: positions.zodiacRing[0].x, y:positions.zodiacRing[0].y)
                    .opacity(0.3)
                Text("♉︎")
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 45))
                    .offset(x: positions.zodiacRing[1].x, y:positions.zodiacRing[1].y)
                    .opacity(0.3)
                Text("♊︎")
                    .foregroundColor(Color.green)
                    .font(.system(size: 45))
                    .offset(x: positions.zodiacRing[2].x, y:positions.zodiacRing[2].y)
                    .opacity(0.3)
                Text("♋︎")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 45))
                    .offset(x: positions.zodiacRing[3].x, y:positions.zodiacRing[3].y)
                    .opacity(0.3)
                Text("♌︎")
                    .foregroundColor(Color.red)
                    .font(.system(size: 45))
                    .offset(x: positions.zodiacRing[4].x, y:positions.zodiacRing[4].y)
                    .opacity(0.3)
                Text("♍︎")
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 45))
                    .offset(x: positions.zodiacRing[5].x, y:positions.zodiacRing[5].y)
                    .opacity(0.3)
                
            }
            ZStack{
                Text("♎︎")
                    .foregroundColor(Color.green)
                    .font(.system(size: 45))
                    .offset(x:positions.zodiacRing[6].x, y:positions.zodiacRing[6].y)
                    .opacity(0.3)
                Text("♏︎")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 45))
                    .offset(x:positions.zodiacRing[7].x, y:positions.zodiacRing[7].y)
                    .opacity(0.3)
                Text("♐︎")
                    .foregroundColor(Color.red)
                    .font(.system(size: 45))
                    .offset(x:positions.zodiacRing[8].x, y:positions.zodiacRing[8].y)
                    .opacity(0.3)
                Text("♑︎")
                    .foregroundColor(Color.yellow)
                    .offset(x:positions.zodiacRing[9].x, y:positions.zodiacRing[9].y)
                    .opacity(0.3)
                    .font(.system(size: 45))
                Text("♒︎")
                    .foregroundColor(Color.green)
                    .offset(x:positions.zodiacRing[10].x, y:positions.zodiacRing[10].y)
                    .opacity(0.3)
                    
                    .font(.system(size: 45))
                Text("♓︎")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 45))
                    .offset(x:positions.zodiacRing[11].x, y:positions.zodiacRing[11].y)
                    .opacity(0.3)
                
            }


            
        }
        
        
        
            
//        Text("\(sharing.julianCentury)")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(sunX: 30, sunY: 30, moonX: 60, moonY: 60, mercuryX: 90, mercuryY: 90, venusX: 120, venusY: 120, marsX: 150, marsY: 150, jupiterX: 180, jupiterY: 180, saturnX: 210, saturnY: 210, uranusX: 240, uranusY: 240, neptuneX: 270, neptuneY: 270, plutoX: 300, plutoY: 300)
    }
}

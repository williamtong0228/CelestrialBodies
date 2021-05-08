//
//  BirthdayInputView.swift
//  IntermediateZodiac
//
//  Created by William Tong on 21/2/2021.
//  Copyright © 2021 William Tong. All rights reserved.
//

import SwiftUI

struct SecWheelInputView: View {
    
    @EnvironmentObject var sharing:SharedValues
    @EnvironmentObject var positions:ChartViewModel
    
    @State var myDate:Date = Date()
    @State var myTime:Date = Date()
    @State var calcMoon = false
    @State var personalized = false
    @State var popSheet = false
    @State var popSecond = false

    var moonOffsetY:CGFloat {
        if calcMoon {
            return 120
        }else{
            
            return 0
        }
    }
    var outterRing:CGFloat{
        
       return UIScreen.main.bounds.width * 0.45
    }
    var reconstructedTime:Date {
        let newDate = myDate
        let newTime = myTime
        var components = DateComponents()
        let calendarDate = Calendar.current.dateComponents([.year, .month, .day], from: newDate)
        
        let calendarTime = Calendar.current.dateComponents([.hour, .minute], from: newTime)
        
        
        components.year = calendarDate.year
        components.month = calendarDate.month
        components.day = calendarDate.day
        components.hour = calendarTime.hour
        components.minute = calendarTime.minute
        
        let combinedDate = Calendar.current.date(from: components) ?? Date()
        return combinedDate
    }
    var body: some View {
        VStack{
            HStack{
                Text("\(DateFormatter.localizedString(from: reconstructedTime, dateStyle: .medium, timeStyle: .short))")
                    .offset(x: 0,y: -80)
                
            }
            if #available(iOS 14.0, *) {
                ZStack{
                    
                    DatePicker("", selection: $myDate, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .offset(x: 0, y: -80)
                   
                    Toggle(isOn: $calcMoon, label: {
                        Text("Moon Sign reading: ")
                            .font(.system(size: 15))
                            
                    }).offset(x: 0, y: 80)
                    if calcMoon {
                        DatePicker("Approximate Birth time:", selection: $myTime, displayedComponents: .hourAndMinute)
                            .font(.system(size: 15))
                            .animation(.easeIn)
                            .offset(x: 0, y: moonOffsetY)
                    }
                    
                }
                
            }else{
                ZStack{
                    DatePicker(selection: $myDate, label: {
                        Text("Select Date")
                            .offset(x: 0, y: -80)
                    })
                    DatePicker(selection: $myTime, label: {
                        Text("Select Time")
                            .offset(x: 0, y: moonOffsetY)
                    })
                }
               
            }
            
            Button("Compute Dual Chart") {
                sharing.julianCenturyC = Declination.julianCentury(Declination.date(toJulian: reconstructedTime))
                sharing.newDateC = reconstructedTime
                
                
                sharing.nineGeoCoordinatesC = positions.baseWheel.wheelPos[0].nineGeoLatLon
                sharing.planetsPosC = positions.DrawWheel(meanLong: sharing.nineGeoCoordinates, julianCentury: sharing.julianCentury, ringRadius: outterRing)

                popSheet = true
            }
            .sheet(isPresented: $popSheet) {
                ContentView(isDoubleWheel:true)
                    
            }
            
        }

        
            
    }
}

struct SecWheelInputView_Previews: PreviewProvider {
    static var previews: some View {
        SecWheelInputView()
    }
}

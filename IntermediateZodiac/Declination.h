//
//  Header.h
//  Hello World
//
//  Created by Wing lun tong on 15/2/2016.
//  Copyright © 2016 Wing lun tong. All rights reserved.
//

#import <Foundation/Foundation.H>

@interface Declination : NSObject
@property int julianYear, julianMonth;
@property NSDate *calendarDate, *calenNew;
@property double JD,deltaTime,longtitude,julianDay;
@property NSMutableArray *iteration, *iter,*twentyFour;

+(double)dateToJulian:(NSDate*) date;
+(NSDate*)julianToDate:(double)julian;
+(double)julianCentury:(double)julian;
+(double)sunLongtitude:(double)julianCentury;
+(NSMutableArray*)twentyFourAtomspheres:(double)julian delta:(double)deltaJD iterate: (NSMutableArray*) atomspheres;

@end

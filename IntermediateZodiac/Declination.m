//
//  Declination.m
//  Hello World
//
//  Created by Wing lun tong on 15/2/2016.
//  Copyright © 2016 Wing lun tong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Declination.h"
#import "GlobalCalUpper.h"

@interface Declination()

@end

@implementation Declination
@synthesize julianMonth,julianYear,calendarDate,JD,calenNew,deltaTime,longtitude,julianDay,iteration,iter,twentyFour;

-(id)init{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eventHandler:) name:@"channelthisgmt" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eventHandlerSwift:) name:@"channelthisgmtswift" object:nil];
    }
    return self;
}



-(void) eventHandler:(NSNotification*) notification
{
    if ([[notification name] isEqualToString:@"channelthisgmt"])
    {
        NSLog(@"GMT time %@",notification.userInfo);
        
        NSDictionary *dict= @{ @"dcsaveddate":notification.userInfo};
        
        NSDate *retrieveddate = [dict objectForKey:@"dcsaveddate"];
        
        NSLog(@"date information retrieveddate: %@",retrieveddate);
        
        calendarDate = retrieveddate;
        
        //NSLog(@"date information setdate: %@",setdate);
        
        JD = [Declination dateToJulian:calendarDate];
        calenNew = [Declination julianToDate:JD];
        deltaTime = [Declination julianCentury:JD];
        longtitude = [Declination julianCentury:deltaTime];
       
        iter=[GlobalCalUpper interpolationAtomspheres:calendarDate];
        //NSLog(@"iter,%@", iter);
        twentyFour=[Declination twentyFourAtomspheres:JD delta:deltaTime iterate:iter];
        [self broadcastTwentyFour];
        [self broadcastJC];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"channelthisgmt" object:nil];
    }
}


-(void) eventHandlerSwift:(NSNotification*) notification {
   if ([[notification name] isEqualToString:@"channelthisgmtswift"])
    {
        NSLog(@"GMT time %@",notification.userInfo);
        
//        NSDictionary *dict= @{ @"dcsaveddate":notification.userInfo};
        
        NSDate *retrieveddate = [notification.userInfo objectForKey:@"dictgmt"];
        
        NSLog(@"date information retrieveddate: %@",retrieveddate);
        
        calendarDate = retrieveddate;
        
        //NSLog(@"date information setdate: %@",setdate);
        
        JD = [Declination dateToJulian:calendarDate];
        calenNew = [Declination julianToDate:JD];
        deltaTime = [Declination julianCentury:JD];
        longtitude = [Declination julianCentury:deltaTime];
        
        iter=[GlobalCalUpper interpolationAtomspheres:calendarDate];
        //NSLog(@"iter,%@", iter);
        twentyFour=[Declination twentyFourAtomspheres:JD delta:deltaTime iterate:iter];
        [self broadcastTwentyFour];
        [self broadcastJC];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"channelthisgmt" object:nil];
    }

    
    
}

+(double)dateToJulian:(NSDate*)date
{
    
    double julianMonth = 0.0,julianDay = 0.0, julianYear = 0.0;
    NSDateFormatter *julian=[[NSDateFormatter alloc]init];
    NSTimeZone *gmt = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [julian setTimeZone:gmt];
    [julian setDateFormat:@"yyyy"];
    int cYear=[[julian stringFromDate:date]intValue];
    [julian setDateFormat:@"MM"];
    int cMonth= [[julian stringFromDate:date]intValue];
    [julian setDateFormat:@"dd"];
    double cDay = [[julian stringFromDate:date]doubleValue];
    [julian setDateFormat:@"HH"];
    double cHour = [[julian stringFromDate:date]doubleValue];
    [julian setDateFormat:@"mm"];
    double cMinute = [[julian stringFromDate:date]doubleValue];
    
    cDay = cDay + ((cHour*60 + cMinute)/(24*60));
    //NSLog(@"cDay %f,cminute %f, chour, %f",cDay,cMinute,cHour);
    
    if (cMonth<3) {
         julianMonth=cMonth+12;
         julianYear=cYear -1 ;
         julianDay = cDay;
    }
    else if(cMonth>=3){
         julianMonth=cMonth;
         julianYear=cYear;
         julianDay = cDay;

    }
    
//    NSLog(@"JulianDay %f,",julianDay);
    
    int gregFix1= julianYear/100;
    int gregFix2 =  2 - gregFix1 + (int)(gregFix1/4) ;
    
    double tojulian = (int)(365.25*(julianYear+4716))+(int)(30.6001*(julianMonth + 1 ))+julianDay + (int)gregFix2 - 1524.5;
    
    NSLog(@"(int)(gregFix1/4) %d, Julian Day %f",(int)(gregFix1/4),tojulian );
    
    return tojulian;
}

+(NSDate*)julianToDate:(double)julian
{
    double jd = julian;
    double getjd = 0.0;
    double alpha;
    double f = 0;
    
    jd = jd +0.5 ;
    f= jd - (int)jd;
    jd=(int)jd;
    
    
    if (jd<2299161) {
        getjd=jd;
    }
    else if (jd>=2299161)
    {
        alpha = (int)((jd - 1867216.25) / 36524.25);
        getjd = jd + 1 + alpha - (int)(alpha / 4);
    }
    
    double correction = getjd + 1524 ;
    int C = (int)((correction - 122.1) / 365.25) ; //'get year
    int D = (int)(365.25 * C) ;//'get day
    int E = (int)((correction - D) / 30.6001) ; //'get month
    
    //'the day of the month
    int hi, tsuki = 0, toshi = 0;
    
    hi = correction - D - (int)(30.6001 * E) + f;
    
    if (E < 14)
    {
        tsuki = E - 1;
    }
    
    else if(E == 14 || E == 15 ){
    
        tsuki = E - 13;
    }
    
    if(tsuki > 2 ){
        toshi = C - 4716;
    }
    
    else if (tsuki == 1||tsuki == 2) {
        toshi = C - 4715;
    }
    
   // NSLog(@"julian to date %d/%d/%d,",toshi,tsuki,hi);
    
    NSDate *newDate;
    NSCalendar *calenDate=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *local = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    NSDateComponents *calenday = [[NSDateComponents alloc]init];
    NSDateFormatter *convertedDate = [[NSDateFormatter alloc]init];
    
    [convertedDate setDateFormat:@"yyyy"];
    [convertedDate setDateFormat:@"MM"];
    [convertedDate setDateFormat:@"dd"];
    [convertedDate setDateFormat:@"HH"];
    int hour = (int)f*24;
    [convertedDate setDateFormat:@"mm"];
    int minute = (int)(f*24*60)%60;
    [convertedDate setDateFormat:@"ss"];
    int second = (int)(f*24*60*60)%60;
    
    [calenday setYear:toshi];
    [calenday setMonth:tsuki];
    [calenday setDay:hi];
    [calenday setHour:hour];
    [calenday setMinute:minute];
    [calenday setSecond:second];
    [calenday setTimeZone:local];
    
    newDate = [calenDate dateFromComponents:calenday];
    
    //NSLog(@"declination.m julian to date %@",newDate);
    return newDate;
    
}

+(double)julianCentury:(double)julian
{
    double julianT = (julian - 2451545.0)/36525;
    
    //NSLog(@"julianT,%f,",julianT);
    return julianT;
}

+(double)sunLongtitude:(double)julianCentury
{
    double meanLong =(280.46646 + 36000.76983 * julianCentury + 0.0003032 * pow(julianCentury, 2));
    double meanAnom = 357.52911 + 35999.05029 * julianCentury - 0.0001537 * pow(julianCentury, 2);
    //double e = 0.016708634 - 0.000042037 * deltaJD - 0.0000001267 * pow(deltaJD, 2);
    
    double sunCenter = (1.914602 - 0.004817 * julianCentury - 0.000014 * pow(julianCentury, 2)) * sin(meanAnom * M_PI/180)+ (0.019993 - 0.000101 * julianCentury) * sin(2 * meanAnom * M_PI/180) + 0.000289 * sin(3 * meanAnom * M_PI/180);
    
    double trueLong = meanLong + sunCenter;
    //double trueAnom = meanAnom + sunCenter;
    
    //double radiusVect= (1.000001018 * (1 - pow(e, 2))) / (1 + e * cos(trueAnom * M_PI/180));
    
    //NSLog(@"radiusvector %f, e %f, suncenter %f, trueLongtitude %f",radiusVect,e,sunCenter,fmod((360 + fmod(trueLong,360)),360));
    
    double omega = 125.04 - 1934.136*julianCentury;
    double apparent = trueLong - 0.00569 - 0.00478* sin(omega * M_PI / 180);
    
    apparent = fmod((360 + fmod(apparent,360)),360);
    
   //NSLog(@"apparent longtitude, %f" , apparent);
 
    
    
    return apparent;
    

}



+(NSMutableArray*)twentyFourAtomspheres:(double)julian delta:(double)deltaJD iterate: (NSMutableArray*) atomspheres
{
    NSMutableArray *constantAtom =[[NSMutableArray alloc]init];
    
    double unit = 15.00000001;
    for (int i = 0; i<=23; i++) {
        [constantAtom addObject:[NSNumber numberWithDouble:(i*unit)]];
       
    }
    //NSLog(@"atomsphere(constantAtom),%@",constantAtom);
    //[GlobalCalUpper interpolationAtomspheres:date];
    
    
    NSMutableArray *temp = [[NSMutableArray alloc]init];
    NSDate *iterated =[[NSDate alloc]init];
    NSCalendar *iterDate =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *iterUnit =[[NSDateComponents alloc]init];
    int countIter = 0;
    
    
    NSCalendar *checkCalender = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
   
COMPARE_ARRAY:
    //NSLog(@"atoms %@",atomspheres);

    for (int i=1; i<=[atomspheres count]-1; i++) {
        NSDateComponents *countDays= [checkCalender components:NSCalendarUnitDay fromDate:atomspheres[i-1] toDate:atomspheres[i] options:0];
        
        if ([countDays day]>20) {
            NSDate *checkDate = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:15 toDate:atomspheres[i-1] options:0];
            
            [atomspheres replaceObjectAtIndex:i withObject:checkDate];
            //NSLog(@"replaced atomspheres %@",atomspheres);
        }
    }
    
    temp=[atomspheres mutableCopy];
    NSSet *before = [NSSet setWithArray:temp];
   
    
    for (int i = 0; i<=[atomspheres count]-1; i++) {
        double tempJulian =[self dateToJulian:atomspheres[i]];
        
        double tempDelta = [self julianCentury:tempJulian];
        
        double tempLong = [self sunLongtitude:tempDelta];
        
        for (int p=0; p<=[constantAtom count]-1; p++) {
            if (fabs(tempLong - [constantAtom[p]doubleValue])>=12) {
                //continue;
                
            }
            else if ((tempLong - [constantAtom[p]doubleValue]<=0.001) && (tempLong - [constantAtom[p]doubleValue]>= 0))
            {
                //continue;
            }
            
            else if ((tempLong - [constantAtom[p]doubleValue]>=-0.001) && (tempLong - [constantAtom[p]doubleValue]<= 0))
            {
                
            }
            else if((tempLong - [constantAtom[p]doubleValue]>2.0) && ((tempLong - [constantAtom[p]doubleValue])<10))
            {
                
                
                [iterUnit setMinute:-1920];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                [iterUnit setMinute:0];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
            }
            else if((tempLong - [constantAtom[p]doubleValue]>1.0) && (tempLong - [constantAtom[p]doubleValue])<=2.0)
            {
                
                
                [iterUnit setMinute:-960];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                [iterUnit setMinute:0];
                
                
                //countIter++;
               //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                 //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
                
            }
            else if((tempLong - [constantAtom[p]doubleValue]>0.75) && (tempLong - [constantAtom[p]doubleValue])<=1.0)
            {
                
                
                [iterUnit setMinute:-720];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                [iterUnit setMinute:0];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);


            }

            else if((tempLong - [constantAtom[p]doubleValue]>0.5) && (tempLong - [constantAtom[p]doubleValue])<=0.75)
            {
                
                
                [iterUnit setMinute:-480];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                 //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);


            }


            else if((tempLong - [constantAtom[p]doubleValue] >0.25) && (tempLong - [constantAtom[p]doubleValue])<=0.5)
            {
                
                
                [iterUnit setMinute:-240];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                 //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);

                

            }
            
            else if((tempLong - [constantAtom[p]doubleValue]>0.1) && (tempLong - [constantAtom[p]doubleValue])<=0.25)
            {
                
                
                [iterUnit setMinute:-80];
                //NSLog(@"%@",iterUnit);
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres delta, %f",((tempLong - [constantAtom[p]doubleValue])));
                 //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);

                

                
            }
            else if((tempLong - [constantAtom[p]doubleValue]>0.075) && (tempLong - [constantAtom[p]doubleValue])<=0.1)
            {
                
                
                [iterUnit setMinute:-60];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                 //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
            }

            else if((tempLong - [constantAtom[p]doubleValue]>0.050) && (tempLong - [constantAtom[p]doubleValue])<=0.075)
            {
                
                
                [iterUnit setMinute:-40];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                 //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
            }
            else if((tempLong - [constantAtom[p]doubleValue]>0.025) && (tempLong - [constantAtom[p]doubleValue])<=0.050)
            {
                
                
                [iterUnit setMinute:-20];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                 //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
            }
           
            else if((tempLong - [constantAtom[p]doubleValue]>0.01) && (tempLong - [constantAtom[p]doubleValue])<=0.025)
            {
                
                
                [iterUnit setMinute:-16];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                 //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
            }

            else if((tempLong - [constantAtom[p]doubleValue]>0.0075) && (tempLong - [constantAtom[p]doubleValue])<=0.010)
            {
                
                
                [iterUnit setMinute:-12];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                 //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
            }

            else if((tempLong - [constantAtom[p]doubleValue]>0.0050) && (tempLong - [constantAtom[p]doubleValue])<=0.0075)
            {
                
                
                [iterUnit setMinute:-8];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                 //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
            }

            else if((tempLong - [constantAtom[p]doubleValue]>0.0025) && (tempLong - [constantAtom[p]doubleValue])<=0.0050)
            {
                
                
                [iterUnit setMinute:-5];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
            }

            else if((tempLong - [constantAtom[p]doubleValue]>0.001) && (tempLong - [constantAtom[p]doubleValue])<=0.0025)
            {
                
                
                [iterUnit setMinute:-1];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                 //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
            }
            
            else if ((tempLong - [constantAtom[p]doubleValue]< -2.0) && (tempLong - [constantAtom[p]doubleValue])>-10)
            {
                
                
                [iterUnit setMinute:1920];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
               //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                 //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
            }

            else if ((tempLong - [constantAtom[p]doubleValue]< -1.0) && (tempLong - [constantAtom[p]doubleValue])>=-2.0)
            {
                
                
                [iterUnit setMinute:960];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
               
                            }

            else if ((tempLong - [constantAtom[p]doubleValue]< -0.75) && (tempLong - [constantAtom[p]doubleValue])>=-1.0)
            {
                
                
                [iterUnit setMinute:720];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                 //NSLog(@"iterated %@",iterated);
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter++;
              //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
                //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
                
                          }
           else if ((tempLong - [constantAtom[p]doubleValue]< -0.5) && (tempLong - [constantAtom[p]doubleValue])>=-0.75)
           {
               
               
               [iterUnit setMinute:480];
               iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                //NSLog(@"iterated %@",iterated);
               [atomspheres replaceObjectAtIndex:i withObject:iterated];
               //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
              
           }

           else if ((tempLong - [constantAtom[p]doubleValue]< -0.25 )&& (tempLong - [constantAtom[p]doubleValue])>=-0.5)
           {
               
               
               [iterUnit setMinute:240];
               iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                //NSLog(@"iterated %@",iterated);
               [atomspheres replaceObjectAtIndex:i withObject:iterated];
               //countIter++;
               //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
              
           }
           else if ((tempLong - [constantAtom[p]doubleValue])< -0.1 && (tempLong - [constantAtom[p]doubleValue])>=-0.25)
           {
               
               
               [iterUnit setMinute:80];
               iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                //NSLog(@"iterated %@",iterated);
               [atomspheres replaceObjectAtIndex:i withObject:iterated];
               //countIter++;
            //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
           
           }
           else if ((tempLong - [constantAtom[p]doubleValue])< -0.075 && (tempLong - [constantAtom[p]doubleValue])>=-0.1)
           {
               
               
               [iterUnit setMinute:60];
               iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                //NSLog(@"iterated %@",iterated);
               [atomspheres replaceObjectAtIndex:i withObject:iterated];
               //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
           }
           else if ((tempLong - [constantAtom[p]doubleValue])< -0.050 && (tempLong - [constantAtom[p]doubleValue])>=-0.075)
           {
               
               
               [iterUnit setMinute:40];
               iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                //NSLog(@"iterated %@",iterated);
               [atomspheres replaceObjectAtIndex:i withObject:iterated];
               //countIter++;
               //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
              
           }

           else if ((tempLong - [constantAtom[p]doubleValue])< -0.025 && (tempLong - [constantAtom[p]doubleValue])>=-0.050)
           {
               
               
               [iterUnit setMinute:20];
               iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                //NSLog(@"iterated %@",iterated);
               [atomspheres replaceObjectAtIndex:i withObject:iterated];
               //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
           }
            
           else if ((tempLong - [constantAtom[p]doubleValue])< -0.01 && (tempLong - [constantAtom[p]doubleValue])>=-0.025)
           {
               
               
               [iterUnit setMinute:16];
               iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                //NSLog(@"iterated %@",iterated);
               [atomspheres replaceObjectAtIndex:i withObject:iterated];
               //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
             
           }

           else if ((tempLong - [constantAtom[p]doubleValue])< -0.0075 && (tempLong - [constantAtom[p]doubleValue])>=-0.01)
           {
               
               
               [iterUnit setMinute:12];
               iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                //NSLog(@"iterated %@",iterated);
               [atomspheres replaceObjectAtIndex:i withObject:iterated];
               //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
                          }

           else if ((tempLong - [constantAtom[p]doubleValue])< -0.0050 && (tempLong - [constantAtom[p]doubleValue])>=-0.0075)
           {
               
               
               [iterUnit setMinute:8];
               iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                //NSLog(@"iterated %@",iterated);
               [atomspheres replaceObjectAtIndex:i withObject:iterated];
               //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
                          }

            
            
           else if ((tempLong - [constantAtom[p]doubleValue])< -0.0025 && (tempLong - [constantAtom[p]doubleValue])>=-0.0050)
           {
               
               
               [iterUnit setMinute:5];
               iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                //NSLog(@"iterated %@",iterated);
               [atomspheres replaceObjectAtIndex:i withObject:iterated];
               //countIter++;
                //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
               
           }

        
          else if ((tempLong - [constantAtom[p]doubleValue])< -0.001 && (tempLong - [constantAtom[p]doubleValue])>=-0.0025)
           {
               
               
               [iterUnit setMinute:1];
               iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                //NSLog(@"iterated %@",iterated);
               [atomspheres replaceObjectAtIndex:i withObject:iterated];
               //countIter++;
               //NSLog(@"i=%d, p=%d, countIter,%d, ",i, p, countIter);
               //NSLog(@"twentyFourAtomspheres %f",((tempLong - [constantAtom[p]doubleValue])));
           }

         
            
            if(countIter>1000)
            {
                break;
            }
          
        }
    }
    NSSet *after = [NSSet setWithArray:atomspheres];
     //NSLog(@"set month,%@",atomspheres);
     //NSLog(@"%@",iterUnit);
    
  
    if ([before isEqualToSet:after])
    {
    //NSLog(@"set month,%@",atomspheres);
        //NSLog(@"iteration count,%d",countIter);
    }
    else goto COMPARE_ARRAY;
    
    
    return atomspheres;
}







+(NSMutableArray*)zodiacConstellations:(double)julian delta:(double)deltaJD iterate: (NSMutableArray*) atomspheres
{
    NSMutableArray *constantAtom =[[NSMutableArray alloc]init];
    
    double unit = 30.00000001;
    for (int i = 0; i<=11; i++) {
        [constantAtom addObject:[NSNumber numberWithDouble:(i*unit)]];
    }
    //NSLog(@"atomsphere,%@",constantAtom);
    //[GlobalCalUpper interpolationAtomspheres:date];
    
    
    NSMutableArray *temp = [[NSMutableArray alloc]init];
    NSDate *iterated =[[NSDate alloc]init];
    NSCalendar *iterDate =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *iterUnit =[[NSDateComponents alloc]init];
    //int countIter1 = 0;
COMPARE_ARRAY:
    //NSLog(@"atoms %@",atomspheres);
    
    temp=[atomspheres mutableCopy];
    NSSet *before = [NSSet setWithArray:temp];
    
    
    for (int i = 0; i<=[atomspheres count]-1; i++) {
        double tempJulian =[self dateToJulian:atomspheres[i]];
        double tempDelta = [self julianCentury:tempJulian];
        double tempLong = [self sunLongtitude:tempDelta];
        for (int p=0; p<=[constantAtom count]-1; p++) {
            if (fabs(tempLong - [constantAtom[p]doubleValue])>=10) {
                //continue;
            }
            else if ((tempLong - [constantAtom[p]doubleValue]<=0.0025) && (tempLong - [constantAtom[p]doubleValue]>= 0))
            {
                //continue;
            }
            
            else if ((tempLong - [constantAtom[p]doubleValue]>=-0.0025) && (tempLong - [constantAtom[p]doubleValue]<= 0))
            {
                
            }
            else if((tempLong - [constantAtom[p]doubleValue]>2) && ((tempLong - [constantAtom[p]doubleValue])<10))
            {
                [iterUnit setMinute:-1920];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            else if((tempLong - [constantAtom[p]doubleValue]>1.0) && (tempLong - [constantAtom[p]doubleValue])<=2)
            {
                [iterUnit setMinute:-960];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
                //NSLog(@"countIter,%d",countIter1);
            }
            else if((tempLong - [constantAtom[p]doubleValue]>0.75) && (tempLong - [constantAtom[p]doubleValue])<=1.0)
            {
                
                
                [iterUnit setMinute:-720];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
                //NSLog(@"countIter,%d",countIter1);
            }
            
            else if((tempLong - [constantAtom[p]doubleValue]>0.5) && (tempLong - [constantAtom[p]doubleValue])<=0.75)
            {
                
                
                [iterUnit setMinute:-480];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"countIter,%d",countIter1);
            }
            
            
            else if((tempLong - [constantAtom[p]doubleValue] >0.25) && (tempLong - [constantAtom[p]doubleValue])<=0.5)
            {
                
                
                [iterUnit setMinute:-240];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"countIter,%d",countIter1);
            }
            
            else if((tempLong - [constantAtom[p]doubleValue]>0.1) && (tempLong - [constantAtom[p]doubleValue])<=0.25)
            {
                
                
                [iterUnit setMinute:-80];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"countIter,%d",countIter1);
            }
            else if((tempLong - [constantAtom[p]doubleValue]>0.075) && (tempLong - [constantAtom[p]doubleValue])<=0.1)
            {
                
                
                [iterUnit setMinute:-60];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"countIter,%d",countIter1);
            }
            
            else if((tempLong - [constantAtom[p]doubleValue]>0.050) && (tempLong - [constantAtom[p]doubleValue])<=0.075)
            {
                
                
                [iterUnit setMinute:-40];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"countIter,%d",countIter1);
            }
            else if((tempLong - [constantAtom[p]doubleValue]>0.025) && (tempLong - [constantAtom[p]doubleValue])<=0.050)
            {
                
                
                [iterUnit setMinute:-20];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"countIter,%d",countIter1);
            }
            
            else if((tempLong - [constantAtom[p]doubleValue]>0.01) && (tempLong - [constantAtom[p]doubleValue])<=0.025)
            {
                
                
                [iterUnit setMinute:-12];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"countIter,%d",countIter1);
            }
            
            else if((tempLong - [constantAtom[p]doubleValue]>0.0075) && (tempLong - [constantAtom[p]doubleValue])<=0.010)
            {
                
                [iterUnit setMinute:-8];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"countIter,%d",countIter1);
            }
            
            else if((tempLong - [constantAtom[p]doubleValue]>0.0050) && (tempLong - [constantAtom[p]doubleValue])<=0.0075)
            {
                
                
                [iterUnit setMinute:-6];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"countIter,%d",countIter1);
            }
            
            else if((tempLong - [constantAtom[p]doubleValue]>0.0025) && (tempLong - [constantAtom[p]doubleValue])<=0.0050)
            {
                
                
                [iterUnit setMinute:-1];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"countIter,%d",countIter1);
            }
            
        /*    else if((tempLong - [constantAtom[p]doubleValue]>0.001) && (tempLong - [constantAtom[p]doubleValue])<=0.0025)
            {
                
                
                [iterUnit setSecond:45];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"countIter,%d",countIter1);
            }
         */
            
            
            else if ((tempLong - [constantAtom[p]doubleValue]< -2.0) && (tempLong - [constantAtom[p]doubleValue])>-10)
            {
                
                
                [iterUnit setMinute:1920];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
               //NSLog(@"countIter,%d",countIter1);
            }
            
            else if ((tempLong - [constantAtom[p]doubleValue]< -1.0) && (tempLong - [constantAtom[p]doubleValue])>=-2.0)
            {
                
                [iterUnit setMinute:960];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            
            else if ((tempLong - [constantAtom[p]doubleValue]< -0.75) && (tempLong - [constantAtom[p]doubleValue])>=-1.0)
            {
                
                [iterUnit setMinute:720];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            else if ((tempLong - [constantAtom[p]doubleValue]< -0.5) && (tempLong - [constantAtom[p]doubleValue])>=-0.75)
            {
                
                [iterUnit setMinute:480];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            
            else if ((tempLong - [constantAtom[p]doubleValue]< -0.25 )&& (tempLong - [constantAtom[p]doubleValue])>=-0.5)
            {
                
                [iterUnit setMinute:240];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            else if ((tempLong - [constantAtom[p]doubleValue])< -0.1 && (tempLong - [constantAtom[p]doubleValue])>=-0.25)
            {
                
                [iterUnit setMinute:80];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            else if ((tempLong - [constantAtom[p]doubleValue])< -0.075 && (tempLong - [constantAtom[p]doubleValue])>=-0.1)
            {
                
                [iterUnit setMinute:60];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
            }
            else if ((tempLong - [constantAtom[p]doubleValue])< -0.050 && (tempLong - [constantAtom[p]doubleValue])>=-0.075)
            {
                
                [iterUnit setMinute:40];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            
            else if ((tempLong - [constantAtom[p]doubleValue])< -0.025 && (tempLong - [constantAtom[p]doubleValue])>=-0.050)
            {
                
                
                [iterUnit setMinute:20];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            
            else if ((tempLong - [constantAtom[p]doubleValue])< -0.01 && (tempLong - [constantAtom[p]doubleValue])>=-0.025)
            {
                
                
                [iterUnit setMinute:12];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            
            else if ((tempLong - [constantAtom[p]doubleValue])< -0.0075 && (tempLong - [constantAtom[p]doubleValue])>=-0.01)
            {
                
                
                [iterUnit setMinute:8];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            
            else if ((tempLong - [constantAtom[p]doubleValue])< -0.0050 && (tempLong - [constantAtom[p]doubleValue])>=-0.0075)
            {
                
                
                [iterUnit setMinute:6];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            else if ((tempLong - [constantAtom[p]doubleValue])< -0.0025 && (tempLong - [constantAtom[p]doubleValue])>=-0.0050)
            {
                
                [iterUnit setMinute:1];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            
          /*  else if ((tempLong - [constantAtom[p]doubleValue])< -0.001 && (tempLong - [constantAtom[p]doubleValue])>=-0.0025)
            {
                
                
                [iterUnit setSecond:45];
                iterated = [iterDate dateByAddingComponents:iterUnit toDate:atomspheres[i] options:0];
                [atomspheres replaceObjectAtIndex:i withObject:iterated];
                //countIter1++;
               //NSLog(@"countIter,%d",countIter1);
                //NSLog(@"zodiacConstellations %f",((tempLong - [constantAtom[p]doubleValue])));
            }
            */
            
        }
    }
    NSSet *after = [NSSet setWithArray:atomspheres];
    
    
    
    if ([before isEqualToSet:after])
    {
        //NSLog(@"set month,%@",atomspheres);
        //NSLog(@"iteration count,%d",countIter);
    }
    else goto COMPARE_ARRAY;
    

    return atomspheres;
}



-(void)broadcastJC
{
    
    NSDictionary *julianC=@{@"dcjuliancentury": [NSNumber numberWithDouble:deltaTime]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"channeljuliancentury" object:self userInfo:julianC[@"dcjuliancentury"]];
    NSLog(@"Declination Julian Century Broadcasting");
}

-(void)broadcastTwentyFour
{
    NSDictionary *twentyFourArr =@{@"dctwentyfour":twentyFour};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"channeltwentyfouratoms" object:nil userInfo:twentyFourArr];//[@"dctwentyfour"]
    NSLog(@"Declination 24 seasons Broadcasting");
}

-(void)broadcastAppLong
{
    NSString *longString =[NSString stringWithFormat:@"%f",longtitude];
   NSDictionary *appaLong=@{@"dclongitude":longString};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"channellongitude" object:self userInfo:appaLong[@"dclongitude"]];
}


-(void)dealloc
{
     [[NSNotificationCenter defaultCenter] removeObserver:self name:@"channelthisgmt" object:nil];
}

@end

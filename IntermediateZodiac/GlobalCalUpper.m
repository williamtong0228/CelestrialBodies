//
//  GlobalCalUpper.m
//  Hello World
//
//  Created by Wing lun tong on 9/2/2016.
//  Copyright © 2016 Wing lun tong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalCalUpper.h"

@interface GlobalCalUpper()

@end

@implementation GlobalCalUpper


+(NSMutableArray*)daysIntervals:(NSDate*)calDays
{
    NSDate *ari, *tau, *gem, *can, *leo, *vir, *lib, *sco, *sag, *cap, *aqu, *pic;
    NSCalendar *calendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *local =[NSTimeZone localTimeZone];
    NSDateComponents *indays =[[NSDateComponents alloc]init];
    NSDateFormatter *mmdd=[[NSDateFormatter alloc]init];
    NSMutableArray *zodiac =[[NSMutableArray alloc]init];
    
    [mmdd setDateFormat:@"yyyy"];
    int year=[[mmdd stringFromDate:calDays]intValue];
    [mmdd setDateFormat:@"MM"];
    int month = 3;
    [mmdd setDateFormat:@"dd"];
    int day = 21;
    [mmdd setDateFormat:@"HH"];
    int hour = 12;
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:local];
    
    ari=[calendar dateFromComponents:indays];
    [zodiac addObject:ari];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 4;
    [mmdd setDateFormat:@"dd"];
    day = 21;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
     [indays setTimeZone:local];
    
    tau = [calendar dateFromComponents:indays];
    [zodiac addObject:tau];

    
    [mmdd setDateFormat:@"MM"];
    month = 5;
    [mmdd setDateFormat:@"dd"];
    day = 22;
    [mmdd setDateFormat:@"HH"];
    hour = 12;

    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
     [indays setTimeZone:local];
    gem = [calendar dateFromComponents:indays];
    [zodiac addObject:gem];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 6;
    [mmdd setDateFormat:@"dd"];
    day = 22;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
     [indays setTimeZone:local];
    can = [calendar dateFromComponents:indays];
    [zodiac addObject:can];

    
    [mmdd setDateFormat:@"MM"];
    month = 7;
    [mmdd setDateFormat:@"dd"];
    day = 23;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
     [indays setTimeZone:local];
    leo = [calendar dateFromComponents:indays];
    [zodiac addObject:leo];
    
    

    [mmdd setDateFormat:@"MM"];
    month = 8;
    [mmdd setDateFormat:@"dd"];
    day = 22;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
     [indays setTimeZone:local];
    vir = [calendar dateFromComponents:indays];
    [zodiac addObject:vir];

    [mmdd setDateFormat:@"MM"];
    month = 9;
    [mmdd setDateFormat:@"dd"];
    day = 24;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
     [indays setTimeZone:local];
    lib = [calendar dateFromComponents:indays];
    [zodiac addObject:lib];

    [mmdd setDateFormat:@"MM"];
    month = 10;
    [mmdd setDateFormat:@"dd"];
    day = 24;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
     [indays setTimeZone:local];
    sco = [calendar dateFromComponents:indays];
    [zodiac addObject:sco];

    
    [mmdd setDateFormat:@"MM"];
    month = 11;
    [mmdd setDateFormat:@"dd"];
    day = 23;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
     [indays setTimeZone:local];
    sag = [calendar dateFromComponents:indays];
    [zodiac addObject:sag];

    
    [mmdd setDateFormat:@"MM"];
    month = 12;
    [mmdd setDateFormat:@"dd"];
    day = 23;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
     [indays setTimeZone:local];
    cap = [calendar dateFromComponents:indays];
    [zodiac addObject:cap];
    
  
    
    
    [mmdd setDateFormat:@"MM"];
    month = 1;
    [mmdd setDateFormat:@"dd"];
    day = 21;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
     [indays setTimeZone:local];
    aqu = [calendar dateFromComponents:indays];
    [zodiac addObject:aqu];


    [mmdd setDateFormat:@"MM"];
    month = 2;
    [mmdd setDateFormat:@"dd"];
    day = 20;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
     [indays setTimeZone:local];
    pic = [calendar dateFromComponents:indays];
    [zodiac addObject:pic];

    
   
    return zodiac;
    }
    
    
    
    

+(NSMutableArray*)interpolationAtomspheres:(NSDate*)calDays
{
    NSDate *dec, *aqu, *jan, *pic, *feb, *ari, *mar, *tau, *apr, *gem, *may, *can, *jun, *leo, *jul, *vir, *aug, *lib, *sep, *sco, *oct,*sag, *nov, *cap;
    
    NSCalendar *calendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *gmt =[NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    NSDateComponents *indays =[[NSDateComponents alloc]init];
    NSDateFormatter *mmdd=[[NSDateFormatter alloc]init];
    NSMutableArray *zodiac =[[NSMutableArray alloc]init];
    
    
    [mmdd setDateFormat:@"yyyy"];
    int year=[[mmdd stringFromDate:calDays]intValue];
    [mmdd setDateFormat:@"MM"];
    int month = 1;
    [mmdd setDateFormat:@"dd"];
    int day = 5;
    [mmdd setDateFormat:@"HH"];
    int hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    dec = [calendar dateFromComponents:indays];
    [zodiac addObject:dec];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 1;
    [mmdd setDateFormat:@"dd"];
    day = 21;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    aqu = [calendar dateFromComponents:indays];
    [zodiac addObject:aqu];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 2;
    [mmdd setDateFormat:@"dd"];
    day = 4;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    jan = [calendar dateFromComponents:indays];
    [zodiac addObject:jan];

    
    [mmdd setDateFormat:@"MM"];
    month = 2;
    [mmdd setDateFormat:@"dd"];
    day = 20;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    pic = [calendar dateFromComponents:indays];
    [zodiac addObject:pic];

    
    [mmdd setDateFormat:@"MM"];
    month = 3;
    [mmdd setDateFormat:@"dd"];
    day = 6;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    feb=[calendar dateFromComponents:indays];
    [zodiac addObject:feb];

    
    [mmdd setDateFormat:@"MM"];
    month = 3;
    [mmdd setDateFormat:@"dd"];
    day = 21;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    ari=[calendar dateFromComponents:indays];
    [zodiac addObject:ari];
    
    
    
    [mmdd setDateFormat:@"MM"];
    month = 4;
    [mmdd setDateFormat:@"dd"];
    day = 5;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    mar = [calendar dateFromComponents:indays];
    [zodiac addObject:mar];

    
    
    [mmdd setDateFormat:@"MM"];
    month = 4;
    [mmdd setDateFormat:@"dd"];
    day = 21;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    tau = [calendar dateFromComponents:indays];
    [zodiac addObject:tau];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 5;
    [mmdd setDateFormat:@"dd"];
    day = 6;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    apr = [calendar dateFromComponents:indays];
    [zodiac addObject:apr];

    
    [mmdd setDateFormat:@"MM"];
    month = 5;
    [mmdd setDateFormat:@"dd"];
    day = 22;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    gem = [calendar dateFromComponents:indays];
    [zodiac addObject:gem];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 6;
    [mmdd setDateFormat:@"dd"];
    day = 6;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    may = [calendar dateFromComponents:indays];
    [zodiac addObject:may];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 6;
    [mmdd setDateFormat:@"dd"];
    day = 22;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    can = [calendar dateFromComponents:indays];
    [zodiac addObject:can];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 7;
    [mmdd setDateFormat:@"dd"];
    day = 7;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    jun = [calendar dateFromComponents:indays];
    [zodiac addObject:jun];

    
    [mmdd setDateFormat:@"MM"];
    month = 7;
    [mmdd setDateFormat:@"dd"];
    day = 23;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    leo = [calendar dateFromComponents:indays];
    [zodiac addObject:leo];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 8;
    [mmdd setDateFormat:@"dd"];
    day = 8;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    jul = [calendar dateFromComponents:indays];
    [zodiac addObject:jul];

    
    [mmdd setDateFormat:@"MM"];
    month = 8;
    [mmdd setDateFormat:@"dd"];
    day = 22;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    vir = [calendar dateFromComponents:indays];
    [zodiac addObject:vir];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 9;
    [mmdd setDateFormat:@"dd"];
    day = 8;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    aug = [calendar dateFromComponents:indays];
    [zodiac addObject:aug];

    
    [mmdd setDateFormat:@"MM"];
    month = 9;
    [mmdd setDateFormat:@"dd"];
    day = 24;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    lib = [calendar dateFromComponents:indays];
    [zodiac addObject:lib];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 10;
    [mmdd setDateFormat:@"dd"];
    day = 8;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    sep = [calendar dateFromComponents:indays];
    [zodiac addObject:sep];

    
    [mmdd setDateFormat:@"MM"];
    month = 10;
    [mmdd setDateFormat:@"dd"];
    day = 24;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    sco = [calendar dateFromComponents:indays];
    [zodiac addObject:sco];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 11;
    [mmdd setDateFormat:@"dd"];
    day = 8;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    oct = [calendar dateFromComponents:indays];
    [zodiac addObject:oct];

    
    [mmdd setDateFormat:@"MM"];
    month = 11;
    [mmdd setDateFormat:@"dd"];
    day = 23;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    sag = [calendar dateFromComponents:indays];
    [zodiac addObject:sag];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 12;
    [mmdd setDateFormat:@"dd"];
    day = 7;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    nov = [calendar dateFromComponents:indays];
    [zodiac addObject:nov];

    
    [mmdd setDateFormat:@"MM"];
    month = 12;
    [mmdd setDateFormat:@"dd"];
    day = 23;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    cap = [calendar dateFromComponents:indays];
    [zodiac addObject:cap];
    
    
    
    //NSLog(@"GlobalCalUpper interpolationAtomspheres %@,",zodiac);
    
    
    return zodiac;
}


+(NSMutableArray*)twelveMonths:(NSDate*)calDays
{
    NSDate *dec, *jan, *feb, *mar, *apr, *may, *jun, *jul, *aug, *sep, *oct, *nov;
    
    NSCalendar *calendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *gmt =[NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    NSDateComponents *indays =[[NSDateComponents alloc]init];
    NSDateFormatter *mmdd=[[NSDateFormatter alloc]init];
    NSMutableArray *zodiac =[[NSMutableArray alloc]init];
    
    
    [mmdd setDateFormat:@"yyyy"];
    int year=[[mmdd stringFromDate:calDays]intValue];
    [mmdd setDateFormat:@"MM"];
    int month = 1;
    [mmdd setDateFormat:@"dd"];
    int day = 5;
    [mmdd setDateFormat:@"HH"];
    int hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    dec = [calendar dateFromComponents:indays];
    [zodiac addObject:dec];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 2;
    [mmdd setDateFormat:@"dd"];
    day = 4;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    jan = [calendar dateFromComponents:indays];
    [zodiac addObject:jan];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 3;
    [mmdd setDateFormat:@"dd"];
    day = 6;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    feb=[calendar dateFromComponents:indays];
    [zodiac addObject:feb];
    
    
    
    
    [mmdd setDateFormat:@"MM"];
    month = 4;
    [mmdd setDateFormat:@"dd"];
    day = 5;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    mar = [calendar dateFromComponents:indays];
    [zodiac addObject:mar];
    
    
    
    
    [mmdd setDateFormat:@"MM"];
    month = 5;
    [mmdd setDateFormat:@"dd"];
    day = 6;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    apr = [calendar dateFromComponents:indays];
    [zodiac addObject:apr];
    
    
    
    [mmdd setDateFormat:@"MM"];
    month = 6;
    [mmdd setDateFormat:@"dd"];
    day = 6;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    may = [calendar dateFromComponents:indays];
    [zodiac addObject:may];
    
    
    
    [mmdd setDateFormat:@"MM"];
    month = 7;
    [mmdd setDateFormat:@"dd"];
    day = 7;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    jun = [calendar dateFromComponents:indays];
    [zodiac addObject:jun];
    
    
    
    
    [mmdd setDateFormat:@"MM"];
    month = 8;
    [mmdd setDateFormat:@"dd"];
    day = 8;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    jul = [calendar dateFromComponents:indays];
    [zodiac addObject:jul];
    
    
    
    
    [mmdd setDateFormat:@"MM"];
    month = 9;
    [mmdd setDateFormat:@"dd"];
    day = 8;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    aug = [calendar dateFromComponents:indays];
    [zodiac addObject:aug];
    
    
    
    [mmdd setDateFormat:@"MM"];
    month = 10;
    [mmdd setDateFormat:@"dd"];
    day = 8;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    sep = [calendar dateFromComponents:indays];
    [zodiac addObject:sep];
    
    
    [mmdd setDateFormat:@"MM"];
    month = 11;
    [mmdd setDateFormat:@"dd"];
    day = 8;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    oct = [calendar dateFromComponents:indays];
    [zodiac addObject:oct];
    
    
    
    
    [mmdd setDateFormat:@"MM"];
    month = 12;
    [mmdd setDateFormat:@"dd"];
    day = 7;
    [mmdd setDateFormat:@"HH"];
    hour = 12;
    
    
    [indays setYear:year];
    [indays setMonth:month];
    [indays setDay:day];
    [indays setHour:hour];
    [indays setTimeZone:gmt];
    nov = [calendar dateFromComponents:indays];
    [zodiac addObject:nov];
    
    
    
    
    NSLog(@"GlobalCalUpper twelveMonths %@,",zodiac);
    
    
    return zodiac;
}


+(NSArray*)startEndOfYear: (NSDate*)getYear
{
    NSDateComponents *dateUnit=[[NSDateComponents alloc]init];
    NSCalendar *crossDate = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone  *localz = [NSTimeZone localTimeZone];
    
    NSDate *startOfYear = [[NSDate alloc]init];
    NSDate *endOfYear=[[NSDate alloc]init];
    NSDateFormatter *createDate =[[NSDateFormatter alloc]init];
    
    NSMutableArray* startEnd=[[NSMutableArray alloc]init];
    
    
    [createDate setDateFormat:@"yyyy"];
    int year = [[createDate stringFromDate:getYear]intValue];
    [createDate setDateFormat:@"MM"];
    int month = 1;
    [createDate setDateFormat:@"dd"];
    int day = 1;
    [createDate setDateFormat:@"HH"];
    int hour = 0;
    [createDate setDateFormat:@"mm"];
    int minute = 0;
    [createDate setDateFormat:@"ss"];
    int sec=1;
    
    
    [dateUnit setYear:year];
    [dateUnit setMonth:month];
    [dateUnit setDay:day];
    [dateUnit setHour:hour];
    [dateUnit setMinute:minute];
    [dateUnit setSecond:sec];
    [dateUnit setTimeZone:localz];
    
    startOfYear = [crossDate dateFromComponents:dateUnit];
    
    [startEnd addObject:startOfYear];
    
    
    [createDate setDateFormat:@"MM"];
    month = 12;
    [createDate setDateFormat:@"dd"];
    day = 31;
    [createDate setDateFormat:@"HH"];
    hour = 23;
    [createDate setDateFormat:@"mm"];
    minute = 59;
    [createDate setDateFormat:@"ss"];
    sec=59;
    
    [dateUnit setMonth:month];
    [dateUnit setDay:day];
    [dateUnit setHour:hour];
    [dateUnit setMinute:minute];
    [dateUnit setSecond:sec];
    
    endOfYear = [crossDate dateFromComponents:dateUnit];
    
    [startEnd addObject:endOfYear];
    
    return startEnd;
    
}




@end

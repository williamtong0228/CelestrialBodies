//
//  Moon.m
//  Hello World
//
//  Created by   on 12/6/2016.
//  Copyright © 2016年 Wing lun tong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Moon.h"

@interface Moon()

@end

@implementation Moon

//-(id)init{
//    self = [super init];
//    if (self) {
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eventHandler:) name:@"channeljuliancentury" object:nil];
//        NSLog(@"Moon.m init");
//    }
//    return self;
//}
//
//-(void)eventHandler:(NSNotification*)notification
//{
//    if ([[notification name] isEqualToString:@"channeljuliancentury"]) {
//
//        NSDictionary *dict= @{@"dcjuliancentury":notification.userInfo};
//        double julianCentury = [[dict objectForKey:@"dcjuliancentury"] doubleValue];
//        NSLog(@"channeljuliancentury catched");
//        [Moon moonLongitude:julianCentury];
//
//         [[NSNotificationCenter defaultCenter] removeObserver:self name:@"channeljuliancentury" object:nil];
//
//    }
//
//}

+(double)moonLongitude:(double)juliancentury
{
    double meanLong = 218.3164477 + (481267.88123421 * juliancentury) - (0.0015786 *  pow(juliancentury,2)) + (pow(juliancentury,3) / 538841) - (pow(juliancentury,4) / 65194000);

   
    double meanElong = 297.8501921 + 445267.1114034 * juliancentury - 0.0018819 * pow(juliancentury,2) + pow(juliancentury,3) / 545868 - pow(juliancentury,4) / 113065000;
    
    double sunMeanAnom = 357.5291092 + 35999.0502909 * juliancentury - 0.0001536 * pow(juliancentury,2) + pow(juliancentury,3)/ 24490000;
    
    double moonMeanAnom = 134.9633964 + 477198.8675055 * juliancentury + 0.0087414 * pow(juliancentury,2) + pow(juliancentury,3) / 69699 - pow(juliancentury,4) / 14712000;
    
    double moonNodeLat = 93.272095 + 483202.0175233 * juliancentury - 0.0036539 * pow(juliancentury,2)  - pow(juliancentury,3) / 3526000 + pow(juliancentury,4) / 863310000;
    
    double venusGrav = 119.75 + 131.849 * juliancentury;
    
    double jupiterGrav = 53.09 + 479264.29 * juliancentury;
    
    double eccen = 1 - 0.002516 * juliancentury - 0.0000074 * pow(juliancentury,2);
   
    
    // D meanElong/ M sunMeanAnom/M' moonMeanAnom/ F moonNodeLat
    
    double omega = 0;
    omega = 6288774 * sin(moonMeanAnom * M_PI / 180);
    omega = omega + 1274027 * sin((meanElong * 2 - moonMeanAnom) * M_PI / 180);
    omega = omega + 658314 * sin(meanElong * 2 * M_PI / 180);
    omega = omega + 213618 * sin(moonMeanAnom * 2 * M_PI / 180);
    omega = omega - 185116 * eccen * sin(sunMeanAnom * M_PI / 180);
    omega = omega - 114332 * sin(moonNodeLat * 2 * M_PI / 180);
    omega = omega + 58793 * sin((meanElong * 2 - moonMeanAnom * 2) * M_PI / 180);
    omega = omega + 57066 * eccen * sin((meanElong * 2 - sunMeanAnom - moonMeanAnom) * M_PI / 180);
    omega = omega + 53322 * sin((meanElong * 2 + moonMeanAnom) * M_PI / 180);
    omega = omega + 45758 * eccen * sin((meanElong * 2 - sunMeanAnom) * M_PI / 180);
    omega = omega - 40923 * eccen * sin((sunMeanAnom - moonMeanAnom) * M_PI / 180);
    omega = omega - 34720 * sin(meanElong * M_PI / 180);
    omega = omega - 30383 * eccen * sin((sunMeanAnom + moonMeanAnom) * M_PI / 180);
    omega = omega + 15327 * sin((meanElong * 2 - moonNodeLat * 2) * M_PI / 180);
    omega = omega - 12528 * sin((moonMeanAnom + moonNodeLat * 2) * M_PI / 180);
    omega = omega + 10980 * sin((moonMeanAnom - moonNodeLat * 2) * M_PI / 180);
    omega = omega + 10675 * sin((meanElong * 4 - moonMeanAnom) * M_PI / 180);
    omega = omega + 10034 * sin(moonMeanAnom * 3 * M_PI / 180);
    omega = omega + 8548 * sin(meanElong * 4 * M_PI / 180 - moonMeanAnom * 2 * M_PI / 180);
    omega = omega - 7888 * eccen * sin(meanElong * 2 * M_PI / 180 + sunMeanAnom * M_PI / 180 - moonMeanAnom * M_PI / 180);
    omega = omega - 6766 * eccen * sin(meanElong * 2 * M_PI / 180 + sunMeanAnom * M_PI / 180);
    omega = omega - 5163 * sin(meanElong * M_PI / 180 - moonMeanAnom * M_PI / 180);
    omega = omega + 4987 * eccen * sin(meanElong * M_PI / 180 + sunMeanAnom * M_PI / 180);
    //' D meanElong/ M sunMeanAnom/M' moonMeanAnom/ F moonNodeLat
    
    omega = omega + 4036 * eccen * sin(meanElong * 2 * M_PI / 180 - sunMeanAnom * M_PI / 180 + moonMeanAnom * M_PI / 180);
    omega = omega + 3994 * sin(meanElong * 2 * M_PI / 180 + moonMeanAnom * 2 * M_PI / 180);
    omega = omega + 3861 * sin(meanElong * 4 * M_PI / 180);
    omega = omega + 3665 * sin(meanElong * 2 * M_PI / 180 - moonMeanAnom * 3 * M_PI / 180);
    omega = omega - 2689 * eccen * sin(sunMeanAnom * M_PI / 180 - moonMeanAnom * 2 * M_PI / 180);
    omega = omega - 2602 * sin(meanElong * 2 * M_PI / 180 - moonMeanAnom * M_PI / 180 + moonNodeLat * 2 * M_PI / 180);
    omega = omega + 2390 * eccen * sin(meanElong * 2 * M_PI / 180 - sunMeanAnom * M_PI / 180 - moonMeanAnom * 2 * M_PI / 180);
    omega = omega - 2348 * sin(meanElong * M_PI / 180 + moonMeanAnom * M_PI / 180);
    omega = omega + 2236 * pow(eccen,2) * sin(meanElong * 2 * M_PI / 180 - sunMeanAnom * 2 * M_PI / 180);
    omega = omega - 2120 * eccen * sin(sunMeanAnom * M_PI / 180 + moonMeanAnom * 2 * M_PI / 180);
    omega = omega - 2069 * pow(eccen,2) * sin(sunMeanAnom * 2 * M_PI / 180);
    omega = omega + 2048 * pow(eccen,2) * sin(meanElong * 2 * M_PI / 180 - sunMeanAnom * 2 * M_PI / 180 - moonMeanAnom * M_PI / 180);
    omega = omega - 1773 * sin(meanElong * 2 * M_PI / 180 + moonMeanAnom * M_PI / 180 - moonNodeLat * 2 * M_PI / 180);
    omega = omega - 1595 * sin(meanElong * 2 * M_PI / 180 + moonNodeLat * 2 * M_PI / 180);
    omega = omega + 1215 * eccen * sin(meanElong * 4 * M_PI / 180 - sunMeanAnom * M_PI / 180 - moonMeanAnom * M_PI / 180);
    omega = omega - 1110 * sin(moonMeanAnom * 2 * M_PI / 180 + moonNodeLat * 2 * M_PI / 180);
    omega = omega - 892 * sin(meanElong * 3 * M_PI / 180 - moonMeanAnom * M_PI / 180);
    omega = omega - 810 * eccen * sin(meanElong * 2 * M_PI / 180 + sunMeanAnom * M_PI / 180 + moonMeanAnom * M_PI / 180);
    omega = omega + 759 * eccen * sin(meanElong * 4 * M_PI / 180 - sunMeanAnom * M_PI / 180 - moonMeanAnom * 2 * M_PI / 180);
    omega = omega - 713 * pow(eccen,2) * sin(sunMeanAnom * 2 * M_PI / 180 - moonMeanAnom * M_PI / 180);
    omega = omega - 700 * pow(eccen,2) * sin(meanElong * 2 * M_PI / 180 + sunMeanAnom * 2 * M_PI / 180 - moonMeanAnom * M_PI / 180);
    omega = omega + 691 * eccen * sin(meanElong * 2 * M_PI / 180 + sunMeanAnom * M_PI / 180 - moonMeanAnom * 2 * M_PI / 180);
    omega = omega + 596 * eccen * sin(meanElong * 2 * M_PI / 180 - sunMeanAnom * M_PI / 180 - moonNodeLat * 2 * M_PI / 180);
    omega = omega + 549 * sin(meanElong * 4 * M_PI / 180 + moonMeanAnom * M_PI / 180);
    omega = omega + 537 * sin(moonMeanAnom * 4 * M_PI / 180);
    omega = omega + 520 * eccen * sin(meanElong * 4 * M_PI / 180 - sunMeanAnom * M_PI / 180);
    omega = omega - 487 * sin(meanElong * M_PI / 180 - moonMeanAnom * 2 * M_PI / 180);
    omega = omega - 399 * eccen * sin(meanElong * 2 * M_PI / 180 + sunMeanAnom * M_PI / 180 - moonNodeLat * 2 * M_PI / 180);
    omega = omega - 381 * sin(moonMeanAnom * 2 * M_PI / 180 - moonNodeLat * 2 * M_PI / 180);
    omega = omega + 351 * eccen * sin(meanElong * M_PI / 180 + sunMeanAnom * M_PI / 180 + moonMeanAnom * M_PI / 180);
    omega = omega - 340 * sin(meanElong * 3 * M_PI / 180 - moonMeanAnom * 2 * M_PI / 180);
    omega = omega + 330 * sin(meanElong * 4 * M_PI / 180 - moonMeanAnom * 3 * M_PI / 180);
    omega = omega + 327 * eccen * sin(meanElong * 2 * M_PI / 180 - sunMeanAnom * M_PI / 180 + moonMeanAnom * 2 * M_PI / 180);
    omega = omega - 323 * pow(eccen,2) * sin(sunMeanAnom * 2 * M_PI / 180 + moonMeanAnom * M_PI / 180);
    omega = omega + 299 * eccen * sin(meanElong * M_PI / 180 + sunMeanAnom * M_PI / 180 - moonMeanAnom * M_PI / 180);
    omega = omega + 294 * sin(meanElong * 2 * M_PI / 180 + moonMeanAnom * 3 * M_PI / 180);
    
    
    omega = omega + 3958 * sin(venusGrav * M_PI / 180);
    omega = omega + 1962 * sin(meanLong * M_PI / 180 - moonNodeLat * M_PI / 180);
    omega = omega + 318 * sin(jupiterGrav * M_PI / 180);
    
   
    double lamda = meanLong + (omega / 1000000);
    
    double appLongitude = lamda + 0.00461;

    appLongitude = fmod(appLongitude, 360.0);
    
    if (appLongitude<0) {
        appLongitude=appLongitude+360;
    }
    
    NSLog(@"moon appLongitude %f",appLongitude);
    
    return appLongitude;


}


@end

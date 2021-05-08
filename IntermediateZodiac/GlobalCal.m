//
//  GlobalCal.m
//  Hello World
//
//  Created by Wing lun tong on 30/1/2016.
//  Copyright © 2016 Wing lun tong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalCal.h"
#import "IntermediateZodiac-Swift.h"
#import <UIKit/UIKit.h>

@interface GlobalCal()

@end

@implementation GlobalCal


+(NSString*)arrayToString:(NSMutableArray*)arrayChart
{
    NSString *arrToStr;
    arrToStr =@"";
    for (int i=0; i<=[arrayChart count]-1; i++) {
        
    
    arrToStr = [NSString stringWithFormat:@"%@,%@",arrToStr,arrayChart[i]];
}
    arrToStr=[arrToStr substringFromIndex:1];
    
    //NSLog(@"arrToStr %@",arrToStr);
    return arrToStr;
}



+(NSArray*)stringToArray:(NSString *)stringChart
{
    NSArray *strToArr;
    strToArr=[[NSArray alloc]init];
    strToArr=[stringChart componentsSeparatedByString:@","];
    return strToArr;
}




+(NSDate*)timeSpan:(NSDate*)natal progression:(NSDate*)calProgress
{
    
    NSCalendar *calendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit units = NSCalendarUnitMinute;
    NSDateComponents *comp=[calendar components:units fromDate:natal toDate:calProgress options:0];
    
    
    
    NSInteger dayunits = labs([comp minute]);
    NSLog(@"comp units %ld,",(long)dayunits);
    dayunits=dayunits/2/60*10;
    
    
    
    NSDateComponents *days=[[NSDateComponents alloc]init];
    [days setDay:dayunits];
    
    NSDate *contact= [calendar dateByAddingComponents:days toDate:natal options:0];
    NSDateFormatter *yymmdd=[[NSDateFormatter alloc]init];
    [yymmdd setDateFormat:@"yyyy-MM"];
    NSString *contactDate =[yymmdd stringFromDate:contact];
    NSLog(@"calProgression %@",calProgress);
    NSLog(@"First Progression Starts %@",contactDate);
    
    return contact;
    //NSLog(@"calculate progression %ld," ,(long)[comp minute]);
}



+(void)vibrateView:(UIView*) myView
{
    
    
    CGRect center = myView.frame;
    CGRect upperCenter = CGRectMake(myView.frame.origin.x,
                                    myView.frame.origin.y - 2,
                                    myView.frame.size.width,
                                    myView.frame.size.height);
    
    CGRect upperLeft = CGRectMake(myView.frame.origin.x - 2,
                                  myView.frame.origin.y - 2,
                                  myView.frame.size.width,
                                  myView.frame.size.height);
    
    
    CGRect upperRight = CGRectMake(myView.frame.origin.x + 2,
                                   myView.frame.origin.y - 2,
                                   myView.frame.size.width,
                                   myView.frame.size.height);
    
    
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        myView.frame = upperCenter;
        myView.layer.borderColor = [[UIColor redColor] CGColor];
        myView.layer.borderWidth = 1.0f;
    } completion:nil];
    //    [self performSelector:@selector(clearColor:) withObject:textField afterDelay:0.1];
    
    [UIView animateWithDuration:0.1 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        myView.frame = upperLeft;
        myView.layer.borderColor = [[UIColor redColor] CGColor];
        myView.layer.borderWidth = 1.0f;
    } completion:nil];
    
    [UIView animateWithDuration:0.1 delay:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        myView.frame = upperRight;
        myView.layer.borderColor = [[UIColor redColor] CGColor];
        myView.layer.borderWidth = 1.0f;
    } completion:nil];
    
    [UIView animateWithDuration:0.1 delay:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
        myView.frame = upperLeft;
        myView.layer.borderColor = [[UIColor redColor] CGColor];
        myView.layer.borderWidth = 1.0f;
    } completion:nil];
    [UIView animateWithDuration:0.1 delay:0.4 options:UIViewAnimationOptionCurveEaseIn animations:^{
        myView.frame = upperRight;
        myView.layer.borderColor = [[UIColor redColor] CGColor];
        myView.layer.borderWidth = 1.0f;
    } completion:nil];
    
    [UIView animateWithDuration:0.1 delay:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        myView.frame = upperLeft;
        myView.layer.borderColor = [[UIColor redColor] CGColor];
        myView.layer.borderWidth = 1.0f;
    } completion:nil];
    
    [UIView animateWithDuration:0.1 delay:0.6 options:UIViewAnimationOptionCurveEaseOut animations:^{
        myView.frame = upperRight;
        myView.layer.borderColor = [[UIColor redColor] CGColor];
        myView.layer.borderWidth = 1.0f;
    } completion:nil];
    
    [UIView animateWithDuration:0.1 delay:0.7 options:UIViewAnimationOptionCurveEaseIn animations:^{
        myView.frame = upperLeft;
        myView.layer.borderColor = [[UIColor redColor] CGColor];
        myView.layer.borderWidth = 1.0f;
    } completion:nil];
    [UIView animateWithDuration:0.1 delay:0.8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        myView.frame = upperRight;
        myView.layer.borderColor = [[UIColor redColor] CGColor];
        myView.layer.borderWidth = 1.0f;
    } completion:nil];
    
    [UIView animateWithDuration:0.1 delay:0.9 options:UIViewAnimationOptionCurveEaseIn animations:^{
        myView.frame = upperCenter;
        myView.layer.borderColor = [[UIColor redColor] CGColor];
        myView.layer.borderWidth = 1.0f;
    } completion:nil];
    
    
    [UIView animateWithDuration:0.1 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        myView.frame = center;
        myView.layer.borderColor = [[UIColor redColor] CGColor];
        myView.layer.borderWidth = 1.0f;
    } completion:^(BOOL finished){
        myView.layer.borderColor = [[UIColor clearColor] CGColor];
    }];
    
    
    
    
}
@end

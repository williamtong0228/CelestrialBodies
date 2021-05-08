//
//  GlobalCal.h
//  Hello World
//
//  Created by Wing lun tong on 30/1/2016.
//  Copyright © 2016 Wing lun tong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GlobalCal : NSObject{}


+(NSString*)arrayToString:(NSMutableArray*)arrayChart;
+(NSArray*)stringToArray:(NSString*)stringChart;

+(NSDate*)timeSpan:(NSDate*)natal progression:(NSDate*)calProgress;
+(void)vibrateView:(UIView*)myView;

@end

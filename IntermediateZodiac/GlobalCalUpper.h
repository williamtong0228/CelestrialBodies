//
//  GlobalUpperChar.h
//  Hello World
//
//  Created by Wing lun tong on 9/2/2016.
//  Copyright © 2016 Wing lun tong. All rights reserved.
//

#import <Foundation/Foundation.H>
@interface GlobalCalUpper:NSObject

+(NSMutableArray*)daysIntervals:(NSDate*)calDays;
+(NSMutableArray*)interpolationAtomspheres:(NSDate*)calDays;
+(NSArray*)startEndOfYear: (NSDate*)getYear;
+(NSMutableArray*)twelveMonths:(NSDate*)calDays;
@end

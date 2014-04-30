//
//  Alarm.h
//  snoozlessAlarm
//
//  Created by Doug Goss on 3/30/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>
//#import "SnoozlessMasterViewController.h"

@interface Alarm : NSObject
{
    NSDate *alarmDate;
    UILocalNotification *notification;
    NSTimer *addAlarm;
}

@property (strong, nonatomic)NSDate *alarmDate;
@property (strong, nonatomic)UILocalNotification *notification;

-(void)schedualNotificationWithDate;
-(void)setAlarm;
//-(void)schedualNotificationWithDate;


@end

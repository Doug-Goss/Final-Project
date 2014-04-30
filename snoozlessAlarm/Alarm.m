//
//  Alarm.m
//  snoozlessAlarm
//
//  Created by Doug Goss on 3/30/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import "Alarm.h"
#import "SnoozlessDetailViewController.h"

#import "SnoozlessMasterViewController.h"



@implementation Alarm

-(void)setAlarm
{
    
   // int interval = [[NSDate date] timeIntervalSinceDate:alarmDate];
    
  //  addAlarm = [NSTimer timerWithTimeInterval:abs(interval) target:self selector:@selector(schedualNotificationWithDate) userInfo:nil repeats:YES];
    //addAlarm = [[NSTimer alloc] initWithFireDate:alarmDate interval:0.5 target:self selector:@selector(schedualNotificationWithDate) userInfo:nil repeats:YES];
    
}


-(void)schedualNotificationWithDate{
    
    notification = [[UILocalNotification alloc]init];
    notification.fireDate = alarmDate;
    notification.alertBody = @"Time to wake up";
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
    
}


@end

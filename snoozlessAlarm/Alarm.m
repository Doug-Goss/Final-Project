//
//  Alarm.m
//  snoozlessAlarm
//
//  Created by Doug Goss on 3/30/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import "Alarm.h"
#import "SnoozlessDetailViewController.h"

@implementation Alarm

-(void)setAlarm
{
//    addAlarm = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(schedualNotificationWithDate) userInfo:nil repeats:YES];

}



-(void)schedualNotificationWithDate:(NSDate *)fireDate{
//-(void)schedualNotificationWithDate{
    notification = [[UILocalNotification alloc] init];
    
    notification.fireDate = fireDate;
    notification.alertAction = @"okay";
    notification.alertBody = @"Time to wake up";
   // notification
    
  
    
    
   // if ([self.alarmDate laterDate:[NSDate date]]) {
        
   // NSNotification *note = [[NSNotification alloc] initWithName:@"WakeUp" object:nil userInfo:nil];
    
   // [[NSNotificationCenter defaultCenter] postNotification:note];
        
   // }
    
   // [[UIApplication sharedApplication]scheduleLocalNotification:notification];
}
@end

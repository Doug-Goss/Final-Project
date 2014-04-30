//
//  SnoozlessDetailViewController.m
//  snoozlessAlarm
//
//  Created by Doug Goss on 3/30/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import "SnoozlessDetailViewController.h"

@interface SnoozlessDetailViewController ()

- (void)configureView;


@end

@implementation SnoozlessDetailViewController
@synthesize alarm;

#pragma mark - Managing the detail item



- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.alarm) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.timeZone = [NSTimeZone defaultTimeZone];
        dateFormatter.timeStyle = NSDateFormatterShortStyle;
        dateFormatter.dateStyle = NSDateFormatterShortStyle;
        [dateFormatter setDateFormat:@"hh:mm"];
        currentTimelabel.text = [dateFormatter stringFromDate:alarm.alarmDate];
     
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SaveAlarm:(id)sender {
    
    [alarm setAlarmDate:dateTimepicker.date];
    
   // NSLog(@"***** connectionDidFinishLoading *****");
   // [connection release];
    
    
   //[[NSNotificationCenter defaultCenter] postNotificationName:@"wake up" object:nil];
    
  //  [[NSNotificationCenter defaultCenter] postNotificationName:@"wake up" object:nil];
    
    
    
   // [[NSNotificationCenter defaultCenter] po]
//}
    
   // [NSNotificationCenter defaultCenter];
   // NSNotification* notification = [NSNotification notificationWithName:@"MyNotification" object:self];
  
   // [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    //UILocalNotification *notification = [[UILocalNotification alloc]init];
    /*
    alarm.notification = [[UILocalNotification alloc]init];
    alarm.notification.fireDate = dateTimepicker.date;
    alarm.notification.alertBody = @"Time to wake up";
    [[UIApplication sharedApplication]scheduleLocalNotification:alarm.notification];
     */
    
    
    //[alarm schedualNotificationWithDate];
    //[alarm setAlarm];
    //[alarm schedualNotificationWithDate];
    // Request to reload table view data
    
    int interval = [alarm.alarmDate timeIntervalSinceDate:[NSDate date]];
    timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(startAlarm) userInfo:nil repeats:NO];
    [self schedualNotificationWithDate:dateTimepicker.date];
       [self configureView];
    //alert message
    
    
    [self presentMessage:@"alarm set"];
    
    
}

-(void) presentMessage:(NSString *)message{
    
    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Alarm Clock" message:message delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    
    [alert show];
    
}

-(void)schedualNotificationWithDate:(NSDate *)fireDate{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    notification.fireDate = fireDate;
    notification.alertBody = @"Time to wake up";
    notification.soundName = @"alarm_clock_buzzer_ringing.mp3";
    
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
}

-(void)startAlarm{
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"wake up" object:nil];
}

@end

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
    
    //[alarm schedualNotificationWithDate:dateTimepicker.date];
    [alarm setAlarm];
    
    // Request to reload table view data
    [self configureView];
    //alert message
    [self presentMessage:@"alarm set"];
    
    
}

-(void) presentMessage:(NSString *)message{
    
    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Alarm Clock" message:message delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    
    [alert show];
    
}



@end

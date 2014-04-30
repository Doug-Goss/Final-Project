//
//  SnoozlessMasterViewController.h
//  snoozlessAlarm
//
//  Created by Doug Goss on 3/30/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import "Alarm.h"

@interface SnoozlessMasterViewController : UITableViewController {
    NSMutableArray *alarms;
 
}

//@property(nonatomic, strong)Alarm *alarm;
@property (nonatomic, strong) NSString *task;

- (IBAction)StartAlarmButton:(id)sender;

-(void)removeNotification:(NSIndexPath *)indexPath;

-(void)startTask;

@end

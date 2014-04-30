//
//  SnoozlessDetailViewController.h
//  snoozlessAlarm
//
//  Created by Doug Goss on 3/30/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import "Alarm.h"

@interface SnoozlessDetailViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
    
    
    __weak IBOutlet UIDatePicker *dateTimepicker;
    __weak IBOutlet UILabel *currentTimelabel;
    NSTimer *timer;
   

}





@property (strong, nonatomic) Alarm *alarm;



@end

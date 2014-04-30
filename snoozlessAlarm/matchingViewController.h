//
//  matchingViewController.h
//  snoozlessAlarm
//
//  Created by Doug Goss on 4/26/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface matchingViewController : UIViewController{
    AVAudioPlayer *audioPlayer1;
    NSTimer *timer;
    int colorValue;
    int TextValue;
    int scorevalue;
}
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UIButton *Button;
- (IBAction)PressButton:(id)sender;
- (void)startGame;
- (void)GetValues;
- (void)UpdateGame;
@end

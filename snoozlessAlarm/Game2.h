//
//  Game2.h
//  snoozlessAlarm
//
//  Created by Doug Goss on 4/30/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cuddler2.h"
#import <AVFoundation/AVFoundation.h>

int birdFlight;
int randomtoptunnelposition;
int randombottunnelposition;
int score;

int highscore;@interface Game2 : UIViewController <AVAudioPlayerDelegate>
{
    
    AVAudioPlayer *audioPlayer1;
    
    __weak IBOutlet UILabel *gameover;
    
    __weak IBOutlet Cuddler2 *bird;
    __weak IBOutlet UIButton *quit;
    __weak IBOutlet UIButton *playAgain;
    __weak IBOutlet UIButton *startGame;
    __weak IBOutlet UIImageView *pipeTop;
    __weak IBOutlet UIImageView *pipeBottom;
    __weak IBOutlet UIImageView *top;
    __weak IBOutlet UIImageView *bottom;
    __weak IBOutlet UILabel *Score;
    __weak IBOutlet UILabel *label;
    __weak IBOutlet UILabel *highScoreLabel;
    
    NSTimer *BirdMovement;
    NSTimer *tunnelMovement;
    NSTimer *runLoop;
}


- (IBAction)startGame:(id)sender;
- (void)BirdMoving;
- (void)TunnelMoving;
- (void)placeTunnel;
- (void)runloop;



@end

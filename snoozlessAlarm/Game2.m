//
//  Game2.m
//  snoozlessAlarm
//
//  Created by Doug Goss on 4/30/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import "Game2.h"
#import "Cuddler2.h"
#import <AVFoundation/AVFoundation.h>


@interface Game2 ()

@end

@implementation Game2

- (IBAction)startGame:(id)sender
{
    
    score = 0;
    startGame.hidden = YES;
    gameover.hidden = YES;
    playAgain.hidden = YES;
    quit.hidden = YES;
    
    Score.hidden = NO;
    label.hidden = NO;
    
    [bird setA:5];
    
    highScoreLabel.text = [NSString stringWithFormat:@"High Score: %i", highscore];
    
    
    Score.text = [NSString stringWithFormat:@"%d", score];
    
    bird.center = CGPointMake(65, 250);
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    pipeTop.hidden = NO;
    pipeBottom.hidden = NO;
    
    [self placeTunnel];
    
    tunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
    runLoop = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(runloop) userInfo:nil repeats:YES];
    
    
}

-(void)runloop
{
    
    if(CGRectIntersectsRect(bird.frame, pipeTop.frame) )
    {
        [self endGame];
        
    }
    else if (CGRectIntersectsRect(bird.frame, pipeBottom.frame) )
    {
        [self endGame];
        
    }
    else if (CGRectIntersectsRect(bird.frame, bottom.frame))
    {
        [self endGame];
        
    }
    
    
    
}

- (void)endGame
{
    /*
     if (score > highscore) {
     [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:score] forKey:@"HIGHSCORE"];
     }
     [tunnelMovement invalidate];
     [BirdMovement invalidate];
     gameover.hidden = NO;
     playAgain.hidden = NO;
     quit.hidden = NO;
     
     */
    
    if (score > 4) {
        [tunnelMovement invalidate];
        [BirdMovement invalidate];
        [audioPlayer1 stop];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        
    }
    [tunnelMovement invalidate];
    [BirdMovement invalidate];
    startGame.hidden = NO;
    
    
}


- (void)TunnelMoving{
    
    
    pipeTop.center = CGPointMake(pipeTop.center.x - 1, pipeTop.center.y);
    pipeBottom.center = CGPointMake(pipeBottom.center.x - 1, pipeBottom.center.y);
    
    if (pipeTop.center.x < -28) {
        score += 1;
        Score.text = [NSString stringWithFormat:@"%d", score];
        [self placeTunnel];
    }
    
    
}



- (void)placeTunnel{
    
    if (self.view.bounds.size.height == 568)
    {
        randomtoptunnelposition = arc4random() %350;
        randomtoptunnelposition = randomtoptunnelposition - 228;
        randombottunnelposition = randomtoptunnelposition + 620;
        
        pipeTop.center = CGPointMake(340, randomtoptunnelposition);
        pipeBottom.center = CGPointMake(340, randombottunnelposition);
        //... other setting for iPhone 4inch
    }
    else
    {
        randomtoptunnelposition = arc4random() %290;
        randomtoptunnelposition = randomtoptunnelposition - 168;
        randombottunnelposition = randomtoptunnelposition + 561;
        
        pipeTop.center = CGPointMake(340, randomtoptunnelposition);
        pipeBottom.center = CGPointMake(340, randombottunnelposition);
        //... other setting for iPhone 3.5 inch
    }
    
}

- (void)BirdMoving
{
    
    bird.center = CGPointMake(bird.center.x, bird.center.y - birdFlight);
    
    birdFlight = birdFlight - 5;
    
    if (birdFlight < -15) {
        birdFlight = -15;
    }
    
    if (birdFlight > 0) {
        bird.image = [UIImage imageNamed:@"ellisheaddown.png"];
    }
    
    if (birdFlight < 0) {
        bird.image = [UIImage imageNamed:@"ellishead.png"];
    }
    if (CGRectIntersectsRect(bird.frame, top.frame))
    {
        
        bird.center =CGPointMake(65, 7);
        // birdFlight = 0;
        birdFlight =  birdFlight - 5;
    }
    
    
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    birdFlight = 20;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    pipeTop.hidden = YES;
    pipeBottom.hidden = YES;
    gameover.hidden = YES;
    playAgain.hidden = YES;
    quit.hidden = YES;
    Score.hidden = YES;
    label.hidden = YES;
    
    //audio code
    NSString *music = [[NSBundle mainBundle] pathForResource:@"alarm_clock_buzzer_ringing" ofType:@"mp3"];
    audioPlayer1 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
    audioPlayer1.numberOfLoops = -1;
    [audioPlayer1 play];
    //end of adio code
    
    highscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    highScoreLabel.text = [NSString stringWithFormat:@"High Score: %i", highscore];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

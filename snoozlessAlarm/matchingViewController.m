//
//  matchingViewController.m
//  snoozlessAlarm
//
//  Created by Doug Goss on 4/26/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import "matchingViewController.h"

@interface matchingViewController ()

@end

@implementation matchingViewController

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
    NSString *music = [[NSBundle mainBundle] pathForResource:@"alarm_clock_buzzer_ringing" ofType:@"mp3"];
    audioPlayer1 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
    audioPlayer1.numberOfLoops = -1;
    [audioPlayer1 play];
    [self startGame];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startGame{
    scorevalue = 0;
    NSString *text = [NSString stringWithFormat:@"Score: %d", scorevalue];
    [self.score setText:text];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(GetValues) userInfo:nil repeats:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)GetValues{
    colorValue = arc4random() % 4;
    TextValue = arc4random() % 4;
    [self UpdateGame];
}

- (void)UpdateGame{
    
    if (colorValue == 0) {
        [self.Button setTitle:@"Green" forState:UIControlStateNormal];
    }
    if (colorValue == 1) {
         [self.Button setTitle:@"Blue" forState:UIControlStateNormal];
    }
    if (colorValue == 2) {
        [self.Button setTitle:@"red" forState:UIControlStateNormal];
    }
    if (colorValue == 3) {
        [self.Button setTitle:@"yellow" forState:UIControlStateNormal];    }
    if (TextValue == 0) {
        [self.Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }
    if (TextValue == 1) {
        [self.Button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    if (TextValue == 2) {
        [self.Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    if (TextValue == 3) {
        [self.Button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    }
}

- (IBAction)PressButton:(id)sender {
    if (colorValue == TextValue){
        scorevalue += 1;
        _score.text = [NSString stringWithFormat:@"Score: %d", scorevalue];
    }
    else{
        scorevalue = 0;
        NSString *text = [NSString stringWithFormat:@"Score: %d", scorevalue];
        [self.score setText:text];
    }
    
    if (scorevalue == 3) {
        [audioPlayer1 stop];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }

}
@end

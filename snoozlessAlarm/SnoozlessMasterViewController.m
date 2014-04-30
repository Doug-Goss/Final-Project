//
//  SnoozlessMasterViewController.m
//  snoozlessAlarm
//
//  Created by Doug Goss on 3/30/14.
//  Copyright (c) 2014 Doug Goss. All rights reserved.
//

#import "SnoozlessMasterViewController.h"
#import "SnoozlessDetailViewController.h"
#import "Game2.h"
#import "matchingViewController.h"



@interface SnoozlessMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation SnoozlessMasterViewController 



- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startTask)
                                                 name:@"wake up"
                                               object:nil];
    

   // [[UIApplication sharedApplication] ]
   
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
  
    self.navigationItem.rightBarButtonItem = addButton;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    Alarm *newAlarm = [[Alarm alloc] init];
    
    [_objects insertObject:newAlarm atIndex:0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    //[self startTask];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Alarm *t = [_objects objectAtIndex:[indexPath row]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.timeZone = [NSTimeZone defaultTimeZone];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    [dateFormatter setDateFormat:@"hh:mm"];
    
    NSString *datestring = [dateFormatter stringFromDate:t.alarmDate];
    
    [cell.textLabel setText:@"Alarm"];
    [cell.detailTextLabel setText:datestring];

    return cell;
 
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //Alarm *edit = [[Alarm alloc]init];
        //edit = [_objects objectAtIndex:indexPath.row];
        //[[UIApplication sharedApplication]cancelLocalNotification:edit.notification];
        //[self removeNotification:indexPath];
        
        [_objects removeObjectAtIndex:indexPath.row];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

//-(void)removeNotification:(NSIndexPath *)indexPath{
    
    /*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Alarm *object = _objects[indexPath.row];
        [[segue destinationViewController] setAlarm:object];
    }
}

- (void)application:(UIApplication *)app didReceiveLocalNotification:(UILocalNotification *)notif {
   
    NSLog(@"recieved notification");
    [self startTask];
    //SnoozlessTaskViewController *newTask = [[SnoozlessTaskViewController alloc] init];
    //[self.navigationController pushViewController:newTask animated:YES];
}


-(void)startTask{
    
    int tasknum = arc4random() % 4;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (tasknum > 2) {
        
        Game2 *task = (Game2*)[storyboard instantiateViewControllerWithIdentifier:@"task"];
        task.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:task animated:YES];
    }
    else{
        matchingViewController *task = (matchingViewController*)[storyboard instantiateViewControllerWithIdentifier:@"new"];
        task.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:task animated:YES];
    }
    
}

- (IBAction)StartAlarmButton:(id)sender {
    NSLog(@"the button workes");
}
@end

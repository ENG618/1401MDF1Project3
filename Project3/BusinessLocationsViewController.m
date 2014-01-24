//
//  BusinessLocationsViewController.m
//  Project3
//
//  Created by Eric Garcia on 1/23/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "BusinessLocationsViewController.h"

@interface BusinessLocationsViewController ()

@end

@implementation BusinessLocationsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Listing *listing = [[Listing alloc] initWithName:@"GE Mobile Headquarters" subName:@"Where it all started" loc:CLLocationCoordinate2DMake(28.4983f, -81.377267f)];
    Listing *listing1 = [[Listing alloc] initWithName:@"GE Mobile Outlet 1" subName:@"Our 1st outlet" loc:CLLocationCoordinate2DMake(28.663933f, -81.358567f)];
    Listing *listing2 = [[Listing alloc] initWithName:@"GE Mobile Outlet 2" subName:@"Our 2nd outlet" loc:CLLocationCoordinate2DMake(28.642817f, -81.339517f)];
    Listing *listing3 = [[Listing alloc] initWithName:@"GE Mobile Outlet 3" subName:@"Our 3rd outlet" loc:CLLocationCoordinate2DMake(28.647683f, -81.279567f)];
    Listing *listing4 = [[Listing alloc] initWithName:@"GE Mobile Outlet 4" subName:@"Our 4th outlet" loc:CLLocationCoordinate2DMake(28.697617f, -81.34625f)];
    Listing *listing5 = [[Listing alloc] initWithName:@"GE Mobile Outlet 5" subName:@"Our 5th outlet" loc:CLLocationCoordinate2DMake(28.691f, -81.38825f)];
    Listing *listing6 = [[Listing alloc] initWithName:@"GE Mobile Outlet 6" subName:@"Our 6th outlet" loc:CLLocationCoordinate2DMake(28.660633f, -81.342317f)];
    Listing *listing7 = [[Listing alloc] initWithName:@"GE Mobile Outlet 7" subName:@"Our 7th outlet" loc:CLLocationCoordinate2DMake(28.6455f, -81.267917f)];
    Listing *listing8 = [[Listing alloc] initWithName:@"GE Mobile Outlet 8" subName:@"Our 8th outlet" loc:CLLocationCoordinate2DMake(28.6253f, -81.315867f)];
    Listing *listing9 = [[Listing alloc] initWithName:@"GE Mobile Outlet 9" subName:@"Our 9th outlet" loc:CLLocationCoordinate2DMake(28.627233f, -81.36345f)];
    
    //Creating instance of singleton
    DataManager *manager = [DataManager sharedBusManager];
    if (manager != nil)
    {
        //Create Array
        NSMutableArray *businesses = manager.businesses;
        if (businesses != nil)
        {
            [businesses addObject:listing];
            [businesses addObject:listing1];
            [businesses addObject:listing2];
            [businesses addObject:listing3];
            [businesses addObject:listing4];
            [businesses addObject:listing5];
            [businesses addObject:listing6];
            [businesses addObject:listing7];
            [businesses addObject:listing8];
            [businesses addObject:listing9];
        }
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)editTable:(id)sender
{
    
    //Putting table in editing modse
    if (self.isEditing) {
        //if in editing mode, take out
        self.editing = NO;
        self.navigationItem.rightBarButtonItem.title = @"Edit";
    }else{
        //if not in editing mode, put into
        self.editing = YES;
        self.navigationItem.rightBarButtonItem.title = @"Done";
        
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Check if in edit mode
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        //Creating instance of singleton
        DataManager *manager = [DataManager sharedBusManager];
        
        if (manager != nil)
        {
            //Remove item from array
            [manager.businesses removeObjectAtIndex:indexPath.row];
            //Remove item from tableview
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    int rows = 0;
    
    //Creating instance of singleton
    DataManager *manager = [DataManager sharedBusManager];
    
    if (manager != nil)
    {
        rows = manager.businesses.count;
    }
    //Return number of items in array
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //Creating instance of singleton
    DataManager *manager = [DataManager sharedBusManager];
    
    if (manager != nil)
    {
        Listing *current = [manager.businesses objectAtIndex:indexPath.row];
        cell.textLabel.text = [current businessName];
        cell.detailTextLabel.text = [current subName];
        
    }
    
    
    
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

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

 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
     DataManager *manager = [DataManager sharedBusManager];
     if (manager != nil)
     {
         // Get the new view controller using [segue destinationViewController].
         BusinessDetailsViewController *detailVC = [segue destinationViewController];
         // Pass the selected object to the new view controller.
         //Obtain selected row
         NSIndexPath *path = [self.tableView indexPathForSelectedRow];
         //NSIndexPath *path = [self.tableView indexPathForSelectedRow];
         Listing *c = [manager.businesses objectAtIndex:path.row];
         //[dvc currentBusiness:c];
         detailVC.businessName = c.businessName;
         detailVC.subName = c.subName;
         detailVC.businessLoc = c.businessLoc;
     }
 }

@end

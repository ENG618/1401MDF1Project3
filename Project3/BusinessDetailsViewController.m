//
//  BusinessDetailsViewController.m
//  Project3
//
//  Created by Eric Garcia on 1/23/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "BusinessDetailsViewController.h"

@interface BusinessDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *latLabel;
@property (weak, nonatomic) IBOutlet UILabel *logLabel;

@end

@implementation BusinessDetailsViewController

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
    self.nameLabel.text = self.businessName;
    self.latLabel.text = [NSString stringWithFormat:@"%g", self.businessLoc.latitude];
    self.logLabel.text = [NSString stringWithFormat:@"%g", self.businessLoc.longitude];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    //Center of map
    CLLocationCoordinate2D centerMap = self.businessLoc;
    //Zoom level
    MKCoordinateSpan zoom;
    zoom.latitudeDelta = 0.50f;
    zoom.longitudeDelta = 0.50f;
    [businessMapView setRegion:MKCoordinateRegionMake(centerMap, zoom)animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

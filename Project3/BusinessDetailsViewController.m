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
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = self.businessName;
    annotation.subtitle = self.subName;
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(self.businessLoc.latitude, self.businessLoc.longitude);
    annotation.coordinate = location;
    
    
    //Add pins to mapView
    [businessMapView addAnnotation:annotation];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    //Center of map
    CLLocationCoordinate2D centerMap = self.businessLoc;
    //Zoom level
    MKCoordinateSpan zoom;
    zoom.latitudeDelta = 0.10f;
    zoom.longitudeDelta = 0.10f;
    [businessMapView setRegion:MKCoordinateRegionMake(centerMap, zoom)animated:YES];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation;
{
    
    //Checks for existing pin annotation view
    MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pinID"];
    if (pinAnnotationView == nil) {
        //Creates a new pin annotation view if one cannot be reused
        pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinID"];
        pinAnnotationView.pinColor =MKPinAnnotationColorGreen;
        pinAnnotationView.canShowCallout = YES;
        pinAnnotationView.animatesDrop = YES;
    }
    //Display the pin annotation view
    return pinAnnotationView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

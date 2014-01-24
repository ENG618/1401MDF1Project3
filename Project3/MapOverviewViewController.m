//
//  MapOverviewViewController.m
//  Project3
//
//  Created by Eric Garcia on 1/23/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "MapOverviewViewController.h"

@interface MapOverviewViewController ()

@end

@implementation MapOverviewViewController

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
}

- (void)viewDidAppear:(BOOL)animated
{
    //Remove all pins so if items were deleted from DataManager, they are removed from map
    [businessMapView removeAnnotations:businessMapView.annotations];
    
    //Center of map
    CLLocationCoordinate2D centerMap = CLLocationCoordinate2DMake(28.627233f, -81.36345f);
    //Zoom level
    MKCoordinateSpan zoom;
    zoom.latitudeDelta = 0.50f;
    zoom.longitudeDelta = 0.50f;
    [businessMapView setRegion:MKCoordinateRegionMake(centerMap, zoom)animated:NO];
    
    DataManager *manager = [DataManager sharedBusManager];
    if (manager != nil)
    {
        NSMutableArray *pins = [[NSMutableArray alloc] init];
        CLLocationCoordinate2D location;
        for (int i=0; i < manager.businesses.count; i++) {
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            annotation.title = [[[manager businesses] objectAtIndex:i] businessName];
            annotation.subtitle =[[[manager businesses] objectAtIndex:i] subName];
            location = [[[manager businesses] objectAtIndex:i] businessLoc];
            annotation.coordinate = location;
            //Add pin to array
            [pins addObject:annotation];
        }
        //Add pins to mapView
        [businessMapView addAnnotations:pins];
    }
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

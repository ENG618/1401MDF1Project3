//
//  BusinessDetailsViewController.h
//  Project3
//
//  Created by Eric Garcia on 1/23/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Listing.h"
#import "DataManager.h"

@interface BusinessDetailsViewController : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *businessMapView;
}

@property (nonatomic, strong) NSString *businessName;
@property (nonatomic, strong)NSString *subName;
@property (nonatomic, assign) CLLocationCoordinate2D businessLoc;
//@property (nonatomic, retain) IBOutlet MKMapView *businessMapView;

@end

//
//  Listing.h
//  Project3
//
//  Created by Eric Garcia on 1/23/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Listing : NSObject
{
    NSString *busName;
    CLLocationCoordinate2D location;
}

//Custom init
- (id)initWithName:(NSString*)name subName:(NSString*)subName loc:(CLLocationCoordinate2D)loc;

//Object Properties
@property (nonatomic, strong) NSString *businessName;
@property (nonatomic, strong)NSString *subName;
@property (nonatomic, assign) CLLocationCoordinate2D businessLoc;
@end

//
//  Listing.m
//  Project3
//
//  Created by Eric Garcia on 1/23/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "Listing.h"

@implementation Listing
static Listing *_sharedBusManager = nil;

- (id)initWithName:(NSString*)name subName:(NSString*)subName loc:(CLLocationCoordinate2D)loc
{
    if ((self = [super init]))
    {
        _businessName = name;
        _businessLoc = loc;
    }
    return self;
}
@end

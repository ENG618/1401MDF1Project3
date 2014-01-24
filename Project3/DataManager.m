//
//  DataManager.m
//  Project3
//
//  Created by Eric Garcia on 1/23/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
@synthesize businesses;

static DataManager *_sharedDataManager;

+ (DataManager*)sharedBusManager
{
    if (_sharedDataManager == nil)
    {
        _sharedDataManager = [[self alloc] init];
    }
    return _sharedDataManager;
}

- (id)init
{
    if ((self = [super init]))
    {
        businesses = [[NSMutableArray alloc] init];
    }
    return self;
}
@end

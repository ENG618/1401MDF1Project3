//
//  DataManager.h
//  Project3
//
//  Created by Eric Garcia on 1/23/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
{
    NSMutableArray *businesses;
}

//Static method
+ (DataManager*)sharedBusManager;

@property (nonatomic, strong)NSMutableArray *businesses;
@end

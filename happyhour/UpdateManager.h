//
//  UpdateManager.h
//  happyhour
//
//  Created by John Kraal on 3/31/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationDelegate.h"

@interface UpdateManager : NSObject

@property (strong) NSArray *localBars;
@property (strong, nonatomic) LocationDelegate* locationDelegate;

- (NSURL*)getUpdateURL;
- (void)updateBars;
- (void)checkForNewHappyHours;
- (CLLocationCoordinate2D)getCurrentLocation;

@end

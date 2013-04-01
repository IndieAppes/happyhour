//
//  UpdateManager.m
//  happyhour
//
//  Created by John Kraal on 3/31/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import "UpdateManager.h"

@implementation UpdateManager

@synthesize localBars;
@synthesize locationDelegate;

- (NSURL *)getUpdateURL
{
    NSString *path = [[NSString alloc]
                      initWithCString:"/getBarsNearMe"
                      encoding:NSUTF8StringEncoding];
    NSURL *base = [[NSURL alloc] initWithString:[[[NSBundle mainBundle]
                                                  infoDictionary]
                                                 objectForKey:@"UpdateServer"]];
    NSURL *url = [NSURL URLWithString:path relativeToURL:base];
    
    return url;
}

- (void)updateBars
{
    localBars = [[NSArray alloc] initWithObjects:@"dicks",
                 @"dongues", @"YOSPOS", @"BITCH", nil];
}

- (NSArray *)getBarsNearMe
{
    return localBars;
}

- (void)checkForNewHappyHours
{
    NSLog(@"Checking happy hours near %f %f",
          self.locationDelegate.lastKnownLatitude,
          self.locationDelegate.lastKnownLongitude);
}

@end
